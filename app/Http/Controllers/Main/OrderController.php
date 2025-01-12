<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartArtwork;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\OrderArtwork;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class OrderController extends Controller
{

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
        $userId = auth()->id(); // Get the authenticated user's ID
    
        // Fetch cart items belonging to the authenticated user, including the color
        $orderhistory = Order::with(['items' => function ($query) {
            $query->with('orderArtwork');
        }, 'user'])->where('user_id', $userId)->get();
        
        
        // Log::info('Order History:', $orderhistory->toArray());
// 
    // dd($orderhistory);
        return view('main.pages.orderhistory', ['orderhistory' => $orderhistory]);

    }
    

    public function index()
    {
        $userId = auth()->id(); // Get the authenticated user's ID

        // Fetch cart items belonging to the authenticated user, including the color
        $cart = Cart::with(['product', 'color', 'printing']) // Eager load color
            ->where('user_id', $userId)
            ->get();

        // Pass the cart data to the view
        return view('main.pages.checkout', compact('cart'));
        // Pass products to the view

    }

    

    public function add(Request $request)
    {
        $userId = auth()->id();
    
        DB::beginTransaction();
    
        try {
            // Generate a unique 5-character order ID
            $orderId = $this->generateOrderId();
    
            // Calculate total price
            $cartItems = Cart::where('user_id', $userId)->with(['product', 'color', 'printing', 'artworks'])->get();
            $totalPrice = $cartItems->reduce(function ($total, $item) {
                return $total + ($item->product_price + $item->printing_price + $item->delivery_price) * $item->quantity;
            }, 0);
    
            // Create order
            $order = Order::create([
                'user_id' => $userId,
                'order_id' => $orderId,
                'total_price' => $totalPrice,
            ]);
    
            // Log the created order ID
            Log::info('Created order with ID: ' . $order->id);
    
            // Create order items
            foreach ($cartItems as $item) {
                if ($item->printing_price !== null && $item->beanie_type !== null) {
                    $orderItem = OrderItem::create([
                        'order_id' => $order->id,
                        'product_id' => $item->product_id,
                        'color_id' => $item->color_id,
                        'quantity' => $item->quantity,
                        'beanie_type' => $item->beanie_type,
                        'printing_id' => $item->printing_id,
                        'printing_price' => $item->printing_price,
                        'product_price' => $item->product_price,
                        'delivery_price' => $item->delivery_price,
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
                            'order_item_id' => $orderItem->id, // Associate with the created OrderItem
                            'artwork_type' => $artwork->artwork_type,
                            'artwork_dataText' => $artwork->artwork_dataText,
                            'artwork_dataImage' => $artwork->artwork_dataImage ?? null,
                            'patch_length' => $artwork->patch_length,
                            'patch_height' => $artwork->patch_height,
                            'font_style' => $artwork->font_style,
                            'num_of_imprint' => $artwork->num_of_imprint,
                            'imprint_color' => json_encode($artwork->imprint_color ?? []),
                        ]);
                    }
                }
            }
    
            Cart::where('user_id', $userId)->delete();
    
            DB::commit();
    
            return response()->json([
                'success' => true,
                'message' => 'Checkout successful!',
                'orderId' => $order->id,
            ]);
    
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Checkout failed: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Checkout failed. Please try again later.'], 500);
        }
    }
    
    /**
     * Generate a unique 5-character order ID
     */
    private function generateOrderId()
    {
        do {
            $orderId = strtoupper(Str::random(6)); // Generate a random string of 5 characters
        } while (Order::where('order_id', $orderId)->exists());
    
        return $orderId;
    }
    
}
