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

class OrderController extends Controller
{
    public function checkout(Request $request)
    {
        $userId = auth()->id();

        DB::beginTransaction();

        try {
            // Calculate total price
            $cartItems = Cart::where('user_id', $userId)->with(['product', 'color', 'printing', 'artworks'])->get();
            $totalPrice = $cartItems->reduce(function ($total, $item) {
                return $total + ($item->product_price + $item->printing_price + $item->delivery_price) * $item->quantity;
            }, 0);

            // Create order
            $order = Order::create([
                'user_id' => $userId,
                'total_price' => $totalPrice,
                'status' => 'pending',
            ]);

            // Log the created order ID
            Log::info('Created order with ID: ' . $order->id);

            // Create order items
            foreach ($cartItems as $item) {
                // Only create the order item if necessary fields are available
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

                // If artwork exists for this cart item
                if ($item->artworks) {
                    foreach ($item->artworks as $artwork) {
                        // Handle artwork image upload if exists
                        if ($artwork->artwork_dataImage && $request->hasFile('artwork_dataImage')) {
                            $artwork->artwork_dataImage = $request->file('artwork_dataImage')->store('OrderArtworkImages', 'public');
                        }

                        // Log artwork information for debugging
                        Log::info('Inserting artwork for Order ID: ' . $order->id);
                        Log::info('Artwork data: ' . json_encode($artwork));

                        // Insert artwork data into OrderArtwork table only if artwork exists
                        OrderArtwork::create([
                            'order_id' => $order->id,  // Ensure that order_id is set
                            'artwork_type' => $artwork->artwork_type,
                            'artwork_dataText' => $artwork->artwork_dataText,
                            'artwork_dataImage' => $artwork->artwork_dataImage ?? null, // Handle null image case
                            'patch_length' => $artwork->patch_length,
                            'patch_height' => $artwork->patch_height,
                            'font_style' => $artwork->font_style,
                            'num_of_imprint' => $artwork->num_of_imprint,
                            'imprint_color' => json_encode($artwork->imprint_color ?? []), // Ensure imprint_color is stored as JSON string
                        ]);
                    }
                }
            }

            // Clear the user's cart after order creation
            Cart::where('user_id', $userId)->delete();

            DB::commit();

            return response()->json(['success' => true, 'message' => 'Checkout successful!', 'orderId' => $order->id]);
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Checkout failed: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Checkout failed. Please try again later.'], 500);
        }
    }
}
