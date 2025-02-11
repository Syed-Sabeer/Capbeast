<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartArtwork;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class CartController extends Controller
{

    public function index()
    {
        $userId = auth()->id(); 
    
        
        $cart = Cart::with(['product', 'color', 'printing']) 
                    ->where('user_id', $userId)
                    ->get();
    
       
        return view('main.pages.cart', compact('cart'));
    }
    


    public function add(Request $request)
    {
        
        Log::info('Request Data:', $request->all());

        try {
        
            $validated = $request->validate([
                'productId' => 'required|integer',
                'userId' => 'required|integer',
                'colorId' => 'required|integer',
                'quantity' => 'required|integer|min:1',
                'beanieType' => 'required|integer',
               'PomPomOption' => 'nullable|integer',
                'printingId' => 'required|integer',
                'printingPrice' => 'required|numeric',
                'productPrice' => 'required|numeric',
                'deliveryPrice' => 'required|numeric',
                'pompomPrice' => 'nullable|numeric',
                'artworkType' => 'nullable|integer',
                'artworkDataText' => 'nullable|string',
                'artworkDataImage' => 'nullable|mimes:jpeg,png,jpg,gif,ai,svg,eps',
                'patchLength' => 'nullable|numeric|min:1|max:4', 
                'patchHeight' => 'nullable|numeric|max:2.5', 
                'fontStyle' => 'nullable|string',
                'numOfImprint' => 'nullable|integer',
                'leathercolor' => 'nullable|integer',
                'imprintColors' => 'nullable|array',
            ]);

         
            $patchLength = $validated['patchLength'] ?? null;
            $patchHeight = $validated['patchHeight'] ?? null;
            $numOfImprint = $validated['numOfImprint'] ?? null;
         
$cartItem = Cart::create([
    'product_id' => $validated['productId'],
    'user_id' => $validated['userId'],
    'color_id' => $validated['colorId'],
    'quantity' => $validated['quantity'],
    'beanie_type' => $validated['beanieType'],
    'is_pompom' => $validated['PomPomOption'],
    'printing_id' => $validated['printingId'] , 
    'printing_price' => $validated['printingPrice'],
    'product_price' => $validated['productPrice'],
    'delivery_price' => $validated['deliveryPrice'],
    'pompom_price' => $validated['pompomPrice'],
]);


if (!empty($validated['artworkType']) && (!empty($validated['artworkDataText']) || !empty($validated['artworkDataImage']))) {
    
    if ($request->hasFile('artworkDataImage')) {
        $validated['artworkDataImage'] = $request->file('artworkDataImage')->store('CustomerArtworkImages', 'public');
    }

    
    CartArtwork::create([
        'cart_id' => $cartItem->id,
        'artwork_type' => $validated['artworkType'],
        'artwork_dataText' => $validated['artworkDataText'] ?? null,
        'artwork_dataImage' => $validated['artworkDataImage'] ?? null,
        'patch_length' => $patchLength,
        'patch_height' => $patchHeight,
        'font_style' => $validated['fontStyle'] ?? null, 
        'num_of_imprint' => $numOfImprint,
        'imprint_color' => $validated['imprintColors'] ?? [], 
        'leathercolor' => $validated['leathercolor'] ,
    ]);
}
            

           
            return response()->json(['success' => true, 'message' => 'Item added to cart!', 'cartItem' => $cartItem]);
        } catch (\Exception $e) {
            Log::error('Error adding to cart: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to add item to cart.'], 500);
        }
    }
    public function remove($itemId)
    {
        try {
          
            Log::info('Attempting to remove item with ID: ' . $itemId);
        
          
            $cartItem = Cart::findOrFail($itemId);
        
          
            $cartItem->delete();
        
          
            Log::info('Item removed successfully with ID: ' . $itemId);
        
          
            return response()->json(['success' => true, 'message' => 'Item removed from cart!']);
        } catch (\Exception $e) {
          
            Log::error('Error removing item from cart: ' . $e->getMessage());
        
           
            return response()->json(['success' => false, 'message' => 'Failed to remove item from cart.'], 500);
        }
    }
    public function clear()
    {
        try {
            $userId = auth()->id();  // Get the user ID
    
            // Delete all cart items for the user
            Cart::where('user_id', $userId)->delete();
    
            return response()->json(['success' => true, 'message' => 'All items have been removed from your cart.']);
        } catch (\Exception $e) {
            Log::error('Error clearing cart: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to clear the cart.'], 500);
        }
    }
        

}
