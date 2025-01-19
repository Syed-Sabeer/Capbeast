<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductColor;
use App\Models\ProductPricing;
use App\Models\ProductBaseImage;
use Illuminate\Support\Facades\Log;

class EcommerceProductAdd extends Controller
{
    public function index()
    {
        $colorData = json_decode(file_get_contents(public_path('assetsCommon/api/color_api.json')), true);
        return view('admin.content.apps.app-ecommerce-product-add', ['colors' => $colorData]);
    }

    public function store(Request $request)
    {
        try {
            // Log the incoming request data
            Log::info('Incoming request data:', $request->all());

            $request->validate([
                'title' => 'required|string|max:255',
                'description' => 'required|string',
                'is_pompom' => 'required|integer',
                'base_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'color.*' => 'required|string',
                'images.*.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'quantity.*' => 'required|integer',
                'pricing.*' => 'required|numeric',
            ]);
    
            // Save the product
            $product = Product::create([
                'title' => $request->title,
                'description' => $request->description,
                'is_pompom' => $request->is_pompom,
            ]);

            // Process and store base images
            if ($request->hasFile('base_images')) {
                foreach ($request->file('base_images') as $baseImage) {
                    Log::info('Processing base image: ', [$baseImage->getClientOriginalName()]);
                    $baseImagePath = $baseImage->store('ProductImages', 'public');
                    if ($baseImagePath) {
                        ProductBaseImage::create([
                            'product_id' => $product->id,
                            'base_image' => $baseImagePath,
                        ]);
                    } else {
                        Log::error('Base image upload failed for file: ', [$baseImage->getClientOriginalName()]);
                        return redirect()->back()->with('error', 'Base image upload failed.');
                    }
                }
            }

            // Process and store color images
            foreach ($request->color as $index => $color) {
                Log::info("Processing color $color with images:");
                if ($request->hasFile("images.$index")) {
                    foreach ($request->file("images.$index") as $colorImage) {
                        Log::info('Processing color image: ', [$colorImage->getClientOriginalName()]);
                        $colorImagePath = $colorImage->store('ProductImages/ColorVariations', 'public');
                        if ($colorImagePath) {
                            ProductColor::create([
                                'product_id' => $product->id,
                                'color' => $color,
                                'image' => $colorImagePath,
                            ]);
                        } else {
                            return redirect()->back()->with('error', 'Color image upload failed.');
                        }
                    }
                }
            }

            // Save product pricing in separate rows
            foreach ($request->quantity as $index => $quantity) {
                Log::info("Processing pricing: Quantity = $quantity, Price = " . $request->pricing[$index]);
                ProductPricing::create([
                    'product_id' => $product->id,
                    'quantity' => $quantity,
                    'pricing' => $request->pricing[$index],
                ]);
            }

            return redirect()->back()->with('success', 'Product added successfully!');
        } catch (\Exception $e) {
            Log::error('Error occurred while adding product:', ['error' => $e->getMessage()]);
            return redirect()->back()->with('error', 'Failed to add product. Please try again.');
        }
    }

    public function edit($id)
    {
        try {
            // Fetch product with pricing and base images eagerly loaded
            $product = Product::with(['productColors', 'productPricing', 'productBaseImages'])->findOrFail($id);

            $colorData = json_decode(file_get_contents(public_path('assetsCommon/api/color_api.json')), true);

            return view('admin.content.apps.app-ecommerce-product-edit', [
                'product' => $product,
                'colors' => $colorData,
            ]);
        } catch (\Exception $e) {
            Log::error('Error in edit method:', ['error' => $e->getMessage()]);
            return redirect()->route('app-ecommerce-product-list')->with('error', 'Failed to load product details.');
        }
    }

 

  
}
