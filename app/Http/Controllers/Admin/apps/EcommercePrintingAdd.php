<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
// use Illuminate\Support\Facades\Log;

class EcommercePrintingAdd extends Controller
{
  public function index()
  {
      return view('admin.content.apps.app-ecommerce-printing-add');
  }
  public function store(Request $request)
  {
      try {
          // Validate incoming request
          $request->validate([
              'title' => 'required|string|max:255',
              'image' => 'nullable|image|mimes:jpeg,png,jpg,gif',
              'quantity.*' => 'required|integer',
              'price.*' => 'required|numeric',
          ]);

          // Upload image if it exists
          $imagePath = $request->hasFile('image') ? $this->uploadFile($request->file('image')) : null;

          // Insert data into the table
          DB::table('product_printing')->insertGetId([
              'title' => $request->input('title'),
              'image' => $imagePath, // Save as a single path
              'quantity' => json_encode($request->input('quantity')), // Encode the array
              'price' => json_encode($request->input('price')),       // Encode the array
              'created_at' => now(),
              'updated_at' => now(),
          ]);

          return redirect()->back()->with('success', 'Product added successfully.');
      } catch (\Exception $e) {
          // Log the error
          // \Log::error('Error adding product: ' . $e->getMessage());
          return redirect()->back()->with('error', 'Failed to add product. Please try again.');
      }
  }


  private function uploadFile($file)
  {
      if ($file) {
          return $file->store('ProductPrintingImages', 'public'); // Save file and return its path
      }
      return null;
  }


}
