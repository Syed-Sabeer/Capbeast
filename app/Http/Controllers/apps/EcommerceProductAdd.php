<?php
namespace App\Http\Controllers\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class EcommerceProductAdd extends Controller
{
    public function index()
    {
        // Load color data from JSON file
        $colorData = json_decode(file_get_contents(resource_path('views/custom/color_api.json')), true);

        return view('content.apps.app-ecommerce-product-add', ['colors' => $colorData]);
    }

    public function store(Request $request)
    {
        try {
            // Validate incoming request
            $request->validate([
                'title' => 'required|string|max:255',
                'description' => 'required|string',
                'base_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'color.*' => 'required|string',
                'images.*.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'quantity.*' => 'required|integer',
                'pricing.*' => 'required|numeric',
            ]);

            // Store product details in 'products' table
            $productId = DB::table('products')->insertGetId([
                'title' => $request->input('title'),
                'description' => $request->input('description'),
                'base_images' => json_encode($this->uploadFiles($request->file('base_images'))),
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            // Store colors in 'product_color' table
            foreach ($request->input('color') as $index => $color) {
                DB::table('product_color')->insert([
                    'product_id' => $productId,
                    'color' => $color,
                    'images' => json_encode($this->uploadFiles($request->file('images')[$index] ?? [])),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }

            // Store pricing in 'product_pricing' table
            foreach ($request->input('quantity') as $index => $quantity) {
                DB::table('product_pricing')->insert([
                    'product_id' => $productId,
                    'pricing' => $request->input('pricing')[$index],
                    'quantity' => $quantity,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }

            return redirect()->back()->with('success', 'Product added successfully!');

        } catch (\Exception $e) {
            Log::error('Error adding product: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Failed to add product. Please try again.');
        }
    }

    private function uploadFiles($files)
    {
        $filePaths = [];
        if ($files) {
            foreach ($files as $file) {
                $filePaths[] = $file->store('uploads', 'public');
            }
        }
        return $filePaths;
    }
}