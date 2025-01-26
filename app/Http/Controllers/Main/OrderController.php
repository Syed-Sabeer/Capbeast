<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartArtwork;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\OrderShippingDetail;
use App\Models\OrderArtwork;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;
use PayPal\Api\Details;
use PayPal\Api\Amount;
use PayPal\Api\Transaction;
use PayPal\Api\Payer;
use PayPal\Api\RedirectUrls;
use Paypal\Common\PayPalModel;

class OrderController extends Controller
{
    private $apiContext;

    public function __construct()
    {
        $this->apiContext = new ApiContext(
            new OAuthTokenCredential(
                env('PAYPAL_CLIENT_ID'),  // PayPal Client ID
                env('PAYPAL_SECRET')      // PayPal Secret
            )
        );
    
        $this->apiContext->setConfig([
            'mode' => env('PAYPAL_MODE', 'sandbox'), // Use sandbox mode by default
            'http.ConnectionTimeOut' => 30,
            'log.LogEnabled' => true,
            'log.FileName' => storage_path('logs/paypal.log'),
            'log.LogLevel' => 'FINE', // Logging level: DEBUG, INFO, WARN, ERROR
        ]);
    }
    
    public function orderSuccess(Request $request)
    {
        $orderId = $request->query('orderId');
        $order = Order::with(['user', 'items'])->where('id', $orderId)->first();

        if (!$order) {
            return redirect()->route('home')->with('error', 'Order not found.');
        }

        return view('main.pages.ordersuccess', compact('order'));
    }

    public function orderHistory()
    {
        $userId = auth()->id();

        $orderhistory = Order::with(['items' => function ($query) {
            $query->with('orderArtwork');
        }, 'user'])->where('user_id', $userId)->get();

        return view('main.pages.orderhistory', ['orderhistory' => $orderhistory]);
    }

    public function index()
    {
        $userId = auth()->id();
    
        $cart = Cart::with(['product', 'color', 'printing'])
            ->where('user_id', $userId)
            ->get();
    
        if ($cart->isEmpty()) {
            return redirect()->route('cart')->with('error', 'Your cart is empty. Please add items before proceeding to checkout.');
        }
    
        // Calculate the subtotal and pass it as a float value (not formatted yet)
        $subtotal = $cart->reduce(function ($total, $item) {
            return $total + ($item->product_price + $item->printing_price + $item->delivery_price + $item->pompom_price) * $item->quantity;
        }, 0);
    
        return view('main.pages.checkout', compact('cart', 'subtotal'));
    }

    public function add(Request $request)
    {
        $userId = auth()->id();

        DB::beginTransaction();

        try {
            $request->validate([
                'firstname' => 'required|string|max:255',
                'lastname' => 'required|string|max:255',
                'companyname' => 'nullable|string|max:255',
                'address' => 'required|string|max:255',
                'email' => 'required|email|max:255',
                'phone' => 'required|string|max:20',
                'additional_info' => 'nullable|string|max:500',
            ]);

            $orderId = $this->generateOrderId();

            $cartItems = Cart::where('user_id', $userId)->with(['product', 'color', 'printing', 'artworks'])->get();

            if ($cartItems->isEmpty()) {
                return response()->json(['success' => false, 'message' => 'Cart is empty.'], 400);
            }

            $totalPrice = $cartItems->reduce(function ($total, $item) {
                return $total + ($item->product_price + $item->printing_price + $item->delivery_price + $item->pompom_price) * $item->quantity;
            }, 0);

            $order = Order::create([
                'user_id' => $userId,
                'order_id' => $orderId,
                'total_price' => $totalPrice,
            ]);

            OrderShippingDetail::create([
                'order_id' => $order->id,
                'firstname' => $request->input('firstname'),
                'lastname' => $request->input('lastname'),
                'companyname' => $request->input('companyname'),
                'address' => $request->input('address'),
                'email' => $request->input('email'),
                'phone' => $request->input('phone'),
                'additional_info' => $request->input('additional_info'),
            ]);

            Log::info('Created order with ID: ' . $order->id);

            foreach ($cartItems as $item) {
                if ($item->printing_price !== null && $item->beanie_type !== null) {
                    $orderItem = OrderItem::create([
                        'order_id' => $order->id,
                        'product_id' => $item->product_id,
                        'color_id' => $item->color_id,
                        'quantity' => $item->quantity,
                        'beanie_type' => $item->beanie_type,
                        'printing_id' => $item->printing_id,
                        'is_pompom' => $item->is_pompom,
                        'printing_price' => $item->printing_price,
                        'product_price' => $item->product_price,
                        'delivery_price' => $item->delivery_price,
                        'pompom_price' => $item->pompom_price,
                    ]);
                }

                if ($item->artworks) {
                    foreach ($item->artworks as $artwork) {
                        if ($artwork->artwork_dataImage && $request->hasFile('artwork_dataImage')) {
                            $artwork->artwork_dataImage = $request->file('artwork_dataImage')->store('OrderArtworkImages', 'public');
                        }

                        Log::info('Inserting artwork for Order ID: ' . $order->id);
                        Log::info('Artwork data: ' . json_encode($artwork));

                        OrderArtwork::create([
                            'order_item_id' => $orderItem->id,
                            'artwork_type' => $artwork->artwork_type,
                            'artwork_dataText' => $artwork->artwork_dataText,
                            'artwork_dataImage' => $artwork->artwork_dataImage ?? null,
                            'patch_length' => $artwork->patch_length,
                            'patch_height' => $artwork->patch_height,
                            'font_style' => $artwork->font_style,
                            'num_of_imprint' => $artwork->num_of_imprint,
                            'imprint_color' => $artwork->imprint_color ?? null,
                            'leathercolor' => $artwork->leathercolor,
                        ]);
                    }
                }
            }

            Cart::where('user_id', $userId)->delete();

            // Payment processing via PayPal
            return $this->createPayment($order->id, $totalPrice);

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Checkout failed: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Checkout failed. Please try again later.'], 500);
        }
    }

    private function generateOrderId()
    {
        do {
            $orderId = strtoupper(Str::random(6)); // Generate a random string of 6 characters
        } while (Order::where('order_id', $orderId)->exists());

        return $orderId;
    }

    // PayPal Payment Creation
    public function createPayment(Request $request)
    {
        // Set payer information
        $payer = new Payer();
        $payer->setPaymentMethod('paypal');

        // Set payment amount
        $amount = new Amount();
        $amount->setCurrency('USD')
               ->setTotal($request->input('total'));  // Amount from frontend

        // Set transaction details
        $transaction = new Transaction();
        $transaction->setAmount($amount)
                    ->setDescription('Order Payment');

        // Set redirect URLs (after payment approval or cancellation)
        $redirectUrls = new RedirectUrls();
        $redirectUrls->setReturnUrl(url('/payment-success'))  // Redirect after success
                     ->setCancelUrl(url('/payment-cancelled')); // Redirect if payment cancelled

        // Create the payment
        $payment = new Payment();
        $payment->setIntent('sale')
                ->setPayer($payer)
                ->setTransactions([$transaction])
                ->setRedirectUrls($redirectUrls);

        try {
            // Create the payment and get the approval URL
            $payment->create($this->apiContext);
        } catch (\PayPal\Exception\PayPalConnectionException $ex) {
            return response()->json(['error' => 'Error creating payment. Please try again later.']);
        }

        // Get the approval URL and return it to the frontend
        $approvalUrl = null;
        foreach ($payment->getLinks() as $link) {
            if ($link->getRel() == 'approval_url') {
                $approvalUrl = $link->getHref();
            }
        }

        return response()->json(['approval_url' => $approvalUrl]);
    }

    // PayPal Payment Success handling
    public function paymentSuccess(Request $request)
    {
        $paymentId = $request->get('paymentId');
        $payerId = $request->get('PayerID');
        $orderId = $request->query('orderId');  // Ensure orderId is passed in the URL

        // Get the payment details from PayPal
        $payment = Payment::get($paymentId, $this->apiContext);
        $execution = new PaymentExecution();
        $execution->setPayerId($payerId);

        try {
            // Execute the payment
            $result = $payment->execute($execution, $this->apiContext);

            // Update the order status to "completed"
            $order = Order::find($orderId);
            if ($order) {
                $order->update(['payment_status' => 'completed']);
                return redirect()->route('order.success', ['orderId' => $orderId]);
            } else {
                return redirect()->route('home')->with('error', 'Order not found.');
            }
        } catch (\Exception $e) {
            Log::error('PayPal payment execution failed: ' . $e->getMessage());
            return redirect()->route('payment.cancel');
        }
    }

    // PayPal Payment Cancel handling
    public function paymentCancel()
    {
        return redirect()->route('home')->with('error', 'Payment was canceled.');
    }

    private function _convertToArray($param)
    {
        $ret = array();
        foreach ($param as $k => $v) {
            if ($v instanceof PayPalModel) {
                $ret[$k] = $v->toArray();
            } else if (sizeof($v) <= 0 && is_array($v)) {
                $ret[$k] = array();
            } else if (is_array($v)) {
                $ret[$k] = $this->_convertToArray($v);
            } else {
                $ret[$k] = $v;
            }
        }

        // If the array is empty, convert it to a PayPalModel object to represent a valid JSON structure
        if (sizeof($ret) <= 0) {
            $ret = new PayPalModel();
        }

        return $ret;
    }
}
