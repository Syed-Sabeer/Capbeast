<?php

namespace App\Http\Controllers\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class EcommerceProductList extends Controller
{
    public function index()
    {
        // Fetch all products from the 'products' table along with their price range from 'product_pricing'
        $products = DB::table('products')
            ->leftJoin('product_pricing', 'products.id', '=', 'product_pricing.product_id')
            ->select(
                'products.id',
                'products.title',
                'products.description',
                'products.visibility',
                'products.base_images',
                DB::raw('GROUP_CONCAT(product_pricing.pricing) as all_pricing') // Concatenate all pricing values into a single string
            )
            ->groupBy('products.id', 'products.title', 'products.description', 'products.base_images', 'products.visibility') // Include all selected columns in GROUP BY
            ->get(); // Retrieve the products with their associated pricing

        // Format pricing for each product
        foreach ($products as $product) {
            // Decode the concatenated pricing string into an array
            $pricingArray = json_decode("[" . $product->all_pricing . "]", true);

            // Ensure that pricing is an array and calculate min/max
            if (is_array($pricingArray) && !empty($pricingArray)) {
                // Get the min and max values from the array and ensure they are floats
                $product->min_price = (float)min($pricingArray);
                $product->max_price = (float)max($pricingArray);
            } else {
                // Default to 0 if no valid pricing data
                $product->min_price = 0;
                $product->max_price = 0;
            }
        }

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
