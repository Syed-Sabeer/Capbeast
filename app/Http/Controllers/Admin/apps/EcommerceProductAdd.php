<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductColor;
use App\Models\ProductPricing;

class EcommerceProductAdd extends Controller
{
    public function index()
    {
        $colorData = json_decode(file_get_contents(public_path('color_api.json')), true);
        return view('admin.content.apps.app-ecommerce-product-add', ['colors' => $colorData]);
    }

    public function store(Request $request)
    {
        try {
            $request->validate([
                'title' => 'required|string|max:255',
                'description' => 'required|string',
                'base_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'color.*' => 'required|string',
                'images.*.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'quantity.*' => 'required|integer',
                'pricing.*' => 'required|numeric',
            ]);

            // Save product
            $product = Product::create([
                'title' => $request->title,
                'description' => $request->description,
                'base_images' => $this->uploadFiles($request->file('base_images'), 'ProductImages'),
            ]);

            // Process colors and images
            $colors = [];
            $images = [];
            foreach ($request->color as $index => $color) {
                $colors[] = $color;
                $images = array_merge($images, $this->uploadFiles($request->file('images')[$index] ?? [], 'ProductImages/ColorVariations'));
            }

            // Save product colors
            ProductColor::create([
                'product_id' => $product->id,
                'color' => $colors,
                'images' => $images,
            ]);

            // Save product pricing
            ProductPricing::create([
                'product_id' => $product->id,
                'quantity' => $request->quantity,
                'pricing' => $request->pricing,
            ]);

            return redirect()->back()->with('success', 'Product added successfully!');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to add product. Please try again.');
        }
    }

    private function uploadFiles($files, $directory)
    {
        $filePaths = [];
        if ($files) {
            foreach ($files as $file) {
                $filePaths[] = $file->store($directory, 'public');
            }
        }
        return $filePaths;
    }

    public function edit($id)
    {
        $product = Product::findOrFail($id);
        $productColors = ProductColor::where('product_id', $id)->get();
        $productPricing = ProductPricing::where('product_id', $id)->get();
        $colorData = json_decode(file_get_contents(public_path('color_api.json')), true);

        // Ensure 'base_images' is an array, decode if it's a string
        $product->base_images = is_array($product->base_images) ? $product->base_images : json_decode($product->base_images, true);

        return view('admin.content.apps.app-ecommerce-product-edit', [
            'product' => $product,
            'productColors' => $productColors,
            'productPricing' => $productPricing,
            'colors' => $colorData
        ]);
    }

    public function update(Request $request, $id)
    {
        try {
            $request->validate([
                'title' => 'required|string|max:255',
                'description' => 'required|string',
                'base_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'color.*' => 'required|string',
                'images.*.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'quantity.*' => 'required|integer',
                'pricing.*' => 'required|numeric',
            ]);

            $product = Product::findOrFail($id);
            $product->update([
                'title' => $request->title,
                'description' => $request->description,
                'base_images' => $this->uploadFiles($request->file('base_images'), 'ProductImages'),
            ]);

            // Update colors and images
            $colors = [];
            $images = [];
            foreach ($request->color as $index => $color) {
                $colors[] = $color;
                $images = array_merge($images, $this->uploadFiles($request->file('images')[$index] ?? [], 'ProductImages/ColorVariations'));
            }

            ProductColor::where('product_id', $id)->update([
                'color' => $colors,
                'images' => $images,
            ]);

            // Update pricing
            ProductPricing::where('product_id', $id)->update([
                'quantity' => $request->quantity,
                'pricing' => $request->pricing,
            ]);

            return redirect()->route('admin.content.apps.app-ecommerce-product-list')->with('success', 'Product updated successfully!');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to update product. Please try again.');
        }
    }
}
