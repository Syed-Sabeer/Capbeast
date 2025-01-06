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
        $userId = auth()->id(); // Get the authenticated user's ID
    
        // Fetch cart items belonging to the authenticated user, including the color
        $cart = Cart::with(['product', 'color', 'printing']) // Eager load color
                    ->where('user_id', $userId)
                    ->get();
    
        // Pass the cart data to the view
        return view('main.pages.cart', compact('cart'));
    }
    
    

// For Cart and ArtWork Relation
/*
public function index()
{
    $userId = auth()->id(); // Get the authenticated user's ID

    // Fetch cart artwork items for the authenticated user
    $cart = CartArtwork::with(['cart.product', 'cart.color', 'cart.printing'])
                ->whereHas('cart', function ($query) use ($userId) {
                    $query->where('user_id', $userId);
                })
                ->get();

    // Pass the cart data to the view
    return view('main.pages.cart', compact('cart'));
}
*/
    


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
                'artworkType' => 'nullable|integer',
                'artworkDataText' => 'nullable|string',
                'artworkDataImage' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'patchLength' => 'nullable|numeric|min:1|max:4', // Ensure it's nullable
                'patchHeight' => 'nullable|numeric|max:2.5', // Ensure it's nullable
                'fontStyle' => 'nullable|string',
                'numOfImprint' => 'nullable|integer',
                'imprintColors' => 'nullable|array',
            ]);

            // Handle patchLength and patchHeight to ensure they are null if the string "null" is passed
            $patchLength = $validated['patchLength'] ?? null;
            $patchHeight = $validated['patchHeight'] ?? null;
            $numOfImprint = $validated['numOfImprint'] ?? null;
            // Create a new Cart item
          // Create a new Cart item
$cartItem = Cart::create([
    'product_id' => $validated['productId'],
    'user_id' => $validated['userId'],
    'color_id' => $validated['colorId'],
    'quantity' => $validated['quantity'],
    'beanie_type' => $validated['beanieType'],
    'printing_id' => $validated['printingId'] ?? null, // Only insert if printingId exists
    'printing_price' => $validated['printingPrice'],
    'product_price' => $validated['productPrice'],
    'delivery_price' => $validated['deliveryPrice'],
]);

// Only insert artwork data if it exists
if (!empty($validated['artworkType']) && (!empty($validated['artworkDataText']) || !empty($validated['artworkDataImage']))) {
    // Check if artwork data image is provided and save it
    if ($request->hasFile('artworkDataImage')) {
        $validated['artworkDataImage'] = $request->file('artworkDataImage')->store('CustomerArtworkImages', 'public');
    }

    // Insert artwork data into the CartArtwork table
    CartArtwork::create([
        'cart_id' => $cartItem->id,
        'artwork_type' => $validated['artworkType'],
        'artwork_dataText' => $validated['artworkDataText'] ?? null,
        'artwork_dataImage' => $validated['artworkDataImage'] ?? null,
        'patch_length' => $patchLength, // Will be null if not provided
        'patch_height' => $patchHeight, // Will be null if not provided
        'font_style' => $validated['fontStyle'] ?? null, // Will be null if not provided
        'num_of_imprint' => $numOfImprint, // Will be null if not provided
        'imprint_color' => $validated['imprintColors'] ?? [], // Will be empty array if not provided
    ]);
}
            

            // Return a success response
            return response()->json(['success' => true, 'message' => 'Item added to cart!', 'cartItem' => $cartItem]);
        } catch (\Exception $e) {
            Log::error('Error adding to cart: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to add item to cart.'], 500);
        }
    }
    public function remove($itemId)
    {
        try {
            // Log the incoming item ID
            Log::info('Attempting to remove item with ID: ' . $itemId);
        
            // Find the cart item by ID
            $cartItem = Cart::findOrFail($itemId);
        
            // Delete the cart item
            $cartItem->delete();
        
            // Log successful removal
            Log::info('Item removed successfully with ID: ' . $itemId);
        
            // Return success response
            return response()->json(['success' => true, 'message' => 'Item removed from cart!']);
        } catch (\Exception $e) {
            // Log the error
            Log::error('Error removing item from cart: ' . $e->getMessage());
        
            // Return failure response
            return response()->json(['success' => false, 'message' => 'Failed to remove item from cart.'], 500);
        }
    }
    

}
