<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartArtwork;
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
                'userId' => 'required|integer',
                'colorId' => 'required|integer',
                'quantity' => 'required|integer|min:1',
                'beanieType' => 'nullable|integer',
                'printingId' => 'nullable|integer',
                'printingPrice' => 'required|numeric',
                'productPrice' => 'required|numeric',
                'deliveryPrice' => 'required|numeric',
                'artworkType' => 'nullable|integer', // Either 'upload' or 'message'
                'artworkData' => 'nullable|string', // The file name or entered message
                'patchLength' => 'nullable|numeric|min:1|max:4',
                'patchHeight' => 'nullable|numeric|max:2.5',
                'fontStyle' => 'nullable|string',
                'numOfImprint' => 'nullable|integer',
                'imprintColors' => 'nullable|array',
            ]);

            // Create a new Cart item
            $cartItem = Cart::create([
                'product_id' => $validated['productId'],
                'user_id' => $validated['userId'],
                'color_id' => $validated['colorId'],
                'quantity' => $validated['quantity'],
                'beanie_type' => $validated['beanieType'],
                'printing_id' => $validated['printingId'],
                'printing_price' => $validated['printingPrice'],
                'product_price' => $validated['productPrice'],
                'delivery_price' => $validated['deliveryPrice'],
            ]);

            // Check if artwork data is provided and save it
            if (!empty($validated['artworkType']) && !empty($validated['artworkData'])) {
                CartArtwork::create([
                    'cart_id' => $cartItem->id,
                    'artwork_type' => $validated['artworkType'],
                    'artwork_data' => $validated['artworkData'] ?? '',
                    'patch_length' => $validated['patchLength'] ?? null,
                    'patch_height' => $validated['patchHeight'] ?? null,
                    'font_style' => $validated['fontStyle'] ?? null,
                    'num_of_imprint' => $validated['numOfImprint'] ?? null,
                    'imprint_color' => $validated['imprintColors'] ?? [],
                ]);
            }
            
            

            // Return a success response
            return response()->json(['success' => true, 'message' => 'Item added to cart!', 'cartItem' => $cartItem]);
        } catch (\Exception $e) {
            Log::error('Error adding to cart: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to add item to cart.'], 500);
        }
    }
}
