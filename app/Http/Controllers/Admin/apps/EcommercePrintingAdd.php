<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ProductPrinting;
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
          
          $request->validate([
              'title' => 'required|string|max:255',
              'image' => 'nullable|image|mimes:jpeg,png,jpg,gif',
              'quantity.*' => 'required|integer',
              'price.*' => 'required|numeric',
          ]);

          
          $imagePath = $request->hasFile('image') ? $this->uploadFile($request->file('image')) : null;

         
          ProductPrinting::table('product_printing')->insertGetId([
              'title' => $request->input('title'),
              'image' => $imagePath, 
              'quantity' => json_encode($request->input('quantity')), 
              'price' => json_encode($request->input('price')),      
              'created_at' => now(),
              'updated_at' => now(),
          ]);

          return redirect()->back()->with('success', 'Product added successfully.');
      } catch (\Exception $e) {
         
          return redirect()->back()->with('error', 'Failed to add product. Please try again.');
      }
  }


  private function uploadFile($file)
  {
      if ($file) {
          return $file->store('ProductPrintingImages', 'public'); 
      }
      return null;
  }


}
