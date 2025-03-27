<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartArtwork;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class CartController extends Controller
{

    public function index()
    {
        $userId = auth()->id(); 
    
        
        $carts = Cart::with(['product', 'color']) 
                    ->where('user_id', $userId)
                    ->get();
    
       
        return view('main.pages.cart', compact('carts'));
    }
    


    public function add(Request $request)
    {
        

        $user = Auth::user();

        Log::info('Request Data:', $request->all());

        try {
        
            $validated = $request->validate([
                'productId' => 'required|integer',
                'userId' => 'required|integer',
                'colorId' => 'required|integer',
                'quantity' => 'required|integer|min:1',
                'size' => 'nullable|string',
            ]); 
         
$cartItem = Cart::create([
    'user_id' => $user->id,
                    'product_id' => $validated['productId'],
                    'color_id' => $validated['colorId'],
                    'quantity' => $validated['quantity'],
                    'size' => $validated['size'],
]);
           
            return response()->json(['success' => true, 'message' => 'Item added to cart!', 'cartItem' => $cartItem]);
        } catch (\Exception $e) {
            Log::error('Error adding to cart: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to add item to cart.'], 500);
        }
    }
    public function remove($itemId)
    {
        try {
   
            $cartItem = Cart::findOrFail($itemId);          
            $cartItem->delete();
        
            return response()->json(['success' => true, 'message' => 'Item removed from cart!']);
        } catch (\Exception $e) {
           
            return response()->json(['success' => false, 'message' => 'Failed to remove item from cart.'], 500);
        }
    }
    public function clear()
    {
        try {
            $userId = auth()->id();  // Get the user ID
    
            Cart::where('user_id', $userId)->delete();
    
            return response()->json(['success' => true, 'message' => 'All items have been removed from your cart.']);
        } catch (\Exception $e) {
            Log::error('Error clearing cart: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to clear the cart.'], 500);
        }
    }
        

}
