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
use App\Models\ProductPricing;
use App\Models\ComponentProductColor;
use App\Models\ProductBaseImage;
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
    // Validate the incoming request
    $request->validate([
      'visibility' => 'required|boolean',
    ]);

    // Update the product visibility in the database
    $product = Product::findOrFail($id);
    $product->update(['visibility' => $request->visibility]);

    return response()->json(['success' => true]);
  }

  public function destroy($id)
  {
    // dd($id);
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

      // return response()->json(['success' => true]);
      return redirect()->back()->with('success', 'Product deleted successfully.');
    } catch (\Exception $e) {
      Log::error("Error deleting product: " . $e->getMessage());
      // return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
      return redirect()->back()->with('error', 'Error deleting product: ' . $e->getMessage());
    }
  }

  public function edit($id)
  {
    // Retrieve the product with its related pricing, color images, and base images
    $product = Product::with(['productSEO', 'productColors', 'ProductVolumeDiscount'])->findOrFail($id);

    $categories = Category::all();
    $brands = Brand::all();

    // Return the edit view with the product data and color options
    return view('admin.content.apps.app-ecommerce-product-edit', compact('product', 'categories', 'brands'));
  }



  public function update($id, Request $request)
  {
    try {
      // Validate the incoming request
      $request->validate([
        'title' => 'required|string|max:255',
        'metatitle' => 'nullable|string',
        'metadescription' => 'nullable|string',
        'metakeywords' => 'nullable|string',
        'slug' => 'required|string|unique:products,slug,' . $id,
        'description' => 'required|string',
        'base_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
        'color.*' => 'required|string',
        'images.*.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
        'front_image.*.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
        'back_image.*.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
        'right_image.*.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
        'left_image.*.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
        'quantity.*' => 'nullable|integer',
        'discount.*' => 'nullable|numeric',
      ]);

      DB::beginTransaction();

      // Find the product by its ID
      $product = Product::findOrFail($id);

      // Update the product's main data
      $product->update([
        'category_id' => $request->category_id, // Get category ID
        'brand_id' => $request->brand_id,       // Get brand ID
        'title' => $request->title,
        'slug' => $request->slug,
        'description' => $request->description,
        'cost_price' => $request->cost_price,
        'selling_price' => $request->selling_price,
      ]);

      // Update or create Product SEO data
      ProductSEO::updateOrCreate(
        ['product_id' => $product->id],
        [
          'metatitle' => $request->metatitle,
          'metadescription' => $request->metadescription,
          'metakeywords' => $request->metakeywords,
        ]
      );

      //Delete existing pricing data
      ProductVolumeDiscount::where('product_id', $product->id)->delete();
      // Process and store discount
      if (isset($request->quantity) && count($request->quantity) > 0) {
        foreach ($request->quantity as $index => $qty) {
          if (!empty($qty)) { // Skip empty entries
            ProductVolumeDiscount::create([
              'product_id' => $product->id,
              'quantity' => $qty,
              'discount' => $request->discount[$index] ?? 0, // Default discount to 0 if missing
            ]);
          }
        }
      }

      // Process and store images
      if (is_array($request->colorname1)) {
        foreach ($request->colorname1 as $index => $colorName1) {
          $colorName2 = $request->colorname2[$index] ?? null;
          $colorCode1 = $request->colorcode1[$index] ?? null;
          $colorCode2 = $request->colorcode2[$index] ?? null;

          // Ensure each file input is correctly retrieved
          $frontImagePath = $request->hasFile("frontimage.$index") ? $request->file("frontimage")[$index]->store('ProductImages/FrontImage', 'public') : null;
          $backImagePath = $request->hasFile("backimage.$index") ? $request->file("backimage")[$index]->store('ProductImages/BackImage', 'public') : null;
          $rightImagePath = $request->hasFile("rightimage.$index") ? $request->file("rightimage")[$index]->store('ProductImages/RightImage', 'public') : null;
          $leftImagePath = $request->hasFile("leftimage.$index") ? $request->file("leftimage")[$index]->store('ProductImages/LeftImage', 'public') : null;

          Log::info("Image paths", compact('frontImagePath', 'backImagePath', 'rightImagePath', 'leftImagePath'));

          // Create the product color entry if any image or color exists
          if ($colorName1 || $colorName2 || $frontImagePath || $backImagePath || $rightImagePath || $leftImagePath) {
            $productColor = ProductColor::create([
              'product_id' => $product->id,
              'color_name_1' => $colorName1,
              'color_code_1' => $colorCode1,
              'color_name_2' => $colorName2,
              'color_code_2' => $colorCode2,
              'front_image' => $frontImagePath,
              'back_image' => $backImagePath,
              'right_image' => $rightImagePath,
              'left_image' => $leftImagePath,
            ]);

            if ($productColor) {
              Log::info("Product color entry created successfully", ['product_color_id' => $productColor->id]);
            } else {
              Log::error("Failed to create product color entry", ['product_id' => $product->id]);
            }
          } else {
            Log::warning("Skipping color entry due to missing data", ['index' => $index]);
          }
        }
      } else {
        Log::error("colorname1 is not an array", ['colorname1' => $request->colorname1]);
      }

      DB::commit();
      return redirect()->back()->with('success', 'Product updated successfully!');
    } catch (\Exception $e) {
      DB::rollBack();
      Log::error("Error occurred while updating product: " . $e->getMessage());
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
      //throw $th;
      Log::error("Error occurred while deleting product color: " . $th->getMessage());
      return redirect()->back()->with('error', 'Failed to delete product color. Please try again.');
    }
  }
}
