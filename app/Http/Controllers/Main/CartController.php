<?php
namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class CartController extends Controller
{
    public function add(Request $request)
    {
        // Log the incoming request data
        Log::info('Request Data:', $request->all());
    
        try {
            // Validate the incoming request data
            $validated = $request->validate([
                'productId' => 'required|integer',
                'colorId' => 'required|string',
                'quantity' => 'required|integer|min:1',
                'beanieType' => 'nullable|string',
                'printingId' => 'nullable|integer',
                'printingPrice' => 'required|numeric',
                'productPrice' => 'required|numeric',
                'deliveryPrice' => 'required|numeric',
            ]);
    
            // Create a new Cart item
            $cartItem = Cart::create([
                'product_id' => $validated['productId'],
                'color_id' => $validated['colorId'],
                'quantity' => $validated['quantity'],
                'beanie_type' => $validated['beanieType'],
                'printing_id' => $validated['printingId'],
                'printing_price' => $validated['printingPrice'],
                'product_price' => $validated['productPrice'],
                'delivery_price' => $validated['deliveryPrice'],
            ]);
    
            // Return a response (could be a success message, or the cart data)
            return response()->json(['success' => true, 'message' => 'Item added to cart!', 'cartItem' => $cartItem]);
        } catch (\Exception $e) {
            Log::error('Error adding to cart: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to add item to cart.'], 500);
        }
    }
    
}
