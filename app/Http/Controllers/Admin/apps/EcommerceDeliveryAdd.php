<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use App\Models\ProductDelivery;
use Illuminate\Http\Request;

class EcommerceDeliveryAdd extends Controller
{
    public function index()
    {
        return view('admin.content.apps.app-ecommerce-delivery-add');
    }

    public function store(Request $request)
    {
        try {
            // Validate incoming request
            $request->validate([
                'quantity.*' => 'required|integer',
                'pricing.*' => 'required|numeric',
            ]);

            // Create a new ProductDelivery instance and save it
            ProductDelivery::create([
                
                'quantity' => json_encode($request->input('quantity')), // Encode the array
                'pricing' => json_encode($request->input('pricing')),
            ]);

            return redirect()->back()->with('success', 'Product delivery added successfully.');
        } catch (\Exception $e) {
            // Log the error
            // \Log::error('Error adding product delivery: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Failed to add product delivery. Please try again.');
        }
    }
}