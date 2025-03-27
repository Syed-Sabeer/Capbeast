<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductColor;
use App\Models\ProductSEO;

use App\Models\ProductCategory;

use App\Models\ProductVolumeDiscount;
use Illuminate\Support\Facades\Log;

class EcommerceProductList extends Controller
{
  public function index()
  {
    // Fetch all products and their pricing information
    $products = Product::paginate(25);


    // Return the view with the products and their pricing
    return view('admin.content.apps.app-ecommerce-product-list', compact('products'));
  }

  public function updateVisibility($id, Request $request)
  {
   
    $request->validate([
      'visibility' => 'required|boolean',
    ]);

    
    $product = Product::findOrFail($id);
    $product->update(['visibility' => $request->visibility]);

    return response()->json(['success' => true]);
  }

  public function destroy($id)
  {

    try {
      Log::info("Attempting to delete product with ID: $id");

      $product = Product::findOrFail($id);
      if ($product) {
        $productColor = ProductColor::where('product_id', $product->id)->get();
        foreach ($productColor as $color) {
          if ($color->back_image) {
            unlink(public_path('storage/' . $color->back_image));
          }
          if ($color->right_image) {
            unlink(public_path('storage/' . $color->right_image));
          }
          if ($color->left_image) {
            unlink(public_path('storage/' . $color->left_image));
          }
          $color->back_image = null;
          $color->right_image = null;
          $color->left_image = null;
          $color->save();
        }
        $product->delete();
      } else {
        Log::error("Product not found with ID: $id");
        return redirect()->back()->with('error', 'Product not found.');
      }


      Log::info("Product deleted successfully.");
      return redirect()->back()->with('success', 'Product deleted successfully.');
    } catch (\Exception $e) {
      Log::error("Error deleting product: " . $e->getMessage());
      return redirect()->back()->with('error', 'Error deleting product: ' . $e->getMessage());
    }
  }

  public function edit($id)
  {
      $product = Product::with(['categories', 'productSEO', 'productColors', 'ProductVolumeDiscount'])
          ->findOrFail($id);
      $categories = Category::all();
      $brands = Brand::all();
      return view('admin.content.apps.app-ecommerce-product-edit', compact('product', 'categories', 'brands'));
  }
  


  public function update($id, Request $request)
  {
      try {
          $request->validate([
              'title' => 'required|string|max:255',
              'metatitle' => 'nullable|string',
              'metadescription' => 'nullable|string',
              'metakeywords' => 'nullable|string',
              'slug' => 'required|string|unique:products,slug,' . $id,
              'description' => 'required|string',
              'category_ids' => 'nullable|array',
              'quantity.*' => 'nullable|integer',
              'discount.*' => 'nullable|numeric',
          ]);
  
          DB::beginTransaction();
  
          $product = Product::findOrFail($id);
  
          $product->update([
              'brand_id' => $request->brand_id,
              'title' => $request->title,
              'slug' => $request->slug,
              'description' => $request->description,
              'cost_price' => $request->cost_price,
              'selling_price' => $request->selling_price,
          ]);
  
          ProductSEO::updateOrCreate(
              ['product_id' => $product->id],
              [
                  'metatitle' => $request->metatitle,
                  'metadescription' => $request->metadescription,
                  'metakeywords' => $request->metakeywords,
              ]
          );
  
          // Update categories: Remove old ones if not present in request
          ProductCategory::where('product_id', $product->id)->delete();
          if (!empty($request->category_ids)) {
              foreach ($request->category_ids as $category_id) {
                  ProductCategory::create([
                      'product_id' => $product->id,
                      'category_id' => $category_id,
                  ]);
              }
          }
  
          ProductVolumeDiscount::where('product_id', $product->id)->delete();
          if (isset($request->quantity) && count($request->quantity) > 0) {
              foreach ($request->quantity as $index => $qty) {
                  if (!empty($qty)) {
                      ProductVolumeDiscount::create([
                          'product_id' => $product->id,
                          'quantity' => $qty,
                          'discount' => $request->discount[$index] ?? 0,
                      ]);
                  }
              }
          }
  
          DB::commit();
  
          return redirect()->back()->with('success', 'Product updated successfully!');
      } catch (\Exception $e) {
          DB::rollBack();
          Log::error('Error occurred while updating product:', ['error' => $e->getMessage()]);
          return redirect()->back()->with('error', 'Failed to update product. Please try again.');
      }
  }


  public function deleteProductColor($id)
  {
    try {
      $productColor = ProductColor::findOrFail($id);
      if ($productColor) {
        if ($productColor->front_image) {
          unlink(public_path('storage/' . $productColor->front_image));
        }
        if ($productColor->back_image) {
          unlink(public_path('storage/' . $productColor->back_image));
        }
        if ($productColor->right_image) {
          unlink(public_path('storage/' . $productColor->right_image));
        }
        if ($productColor->left_image) {
          unlink(public_path('storage/' . $productColor->left_image));
        }
        $productColor->delete();
        return redirect()->back()->with('success', 'Product Color has been removed successfully.');
      } else {
        return redirect()->back()->with('error', 'Product Color not found.');
      }
    } catch (\Throwable $th) {
      Log::error("Error occurred while deleting product color: " . $th->getMessage());
      return redirect()->back()->with('error', 'Failed to delete product color. Please try again.');
    }
  }
}
