<?php

namespace App\Http\Controllers\apps;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class EcommerceProductList extends Controller
{
    public function index()
    {
        // Fetch all products from the 'products' table along with their price range
        $products = DB::table('products')
            ->leftJoin('product_pricing', 'products.id', '=', 'product_pricing.product_id')
            ->select(
                'products.id',
                'products.title',
                'products.description',
                'products.visibility',
                'products.base_images',
                DB::raw('MIN(product_pricing.pricing) as min_price'),
                DB::raw('MAX(product_pricing.pricing) as max_price')
            )
            ->groupBy('products.id', 'products.title', 'products.description', 'products.base_images', 'products.visibility') // Include all selected columns in GROUP BY
            ->get(); // Retrieve the products with their min and max pricing

        return view('content.apps.app-ecommerce-product-list', compact('products'));
    }
    public function updateVisibility($id, Request $request)
{
    // Validate the incoming request
    $request->validate([
        'visibility' => 'required|boolean',
    ]);

    // Update the product visibility in the database
    DB::table('products')
        ->where('id', $id)
        ->update(['visibility' => $request->visibility]);

    return response()->json(['success' => true]);
}

}