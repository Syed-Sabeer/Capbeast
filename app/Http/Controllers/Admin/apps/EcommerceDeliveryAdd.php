<?php

namespace App\Http\Controllers\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class EcommerceDeliveryAdd extends Controller
{
  public function index()
  {
      return view('content.apps.app-ecommerce-delivery-add');
  }

    public function store(Request $request)
    {
        try {
            $request->validate([
              
                'quantity.*' => 'required|integer',
                'pricing.*' => 'required|numeric',
            ]);

      
            // Process colors and images
            $colors = [];
            $images = [];
            foreach ($request->color as $index => $color) {
                $colors[] = $color;
                $images = array_merge($images, $this->uploadFiles($request->file('images')[$index] ?? [], 'ProductImages/ColorVariations'));
            }

            ProductColor::create([
              'product_id' => $product->id,
              'color' => $colors,
              'images' => $images,
          ]);

       

            return redirect()->back()->with('success', 'Product added successfully!');
        } catch (\Exception $e) {
            Log::error('Error adding product: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Failed to add product. Please try again.');
        }
    }

}
