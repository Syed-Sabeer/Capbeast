<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductPrinting;
use App\Models\ProductDelivery;
use Illuminate\Http\Request;

class ProductDetailController extends Controller
{
  public function index($id)
  {
      // Fetch product details using Eloquent
      $product = Product::findOrFail($id);

      // Fetch related product colors
      $productColor = $product->productColors;
      $productColors = $productColor ? $productColor->color : []; // Already an array due to casts

      // Load the color_api.json file
      $colorApi = json_decode(file_get_contents(public_path('color_api.json')), true);

      // Map hex codes to names
      $colorNames = [];
      foreach ($productColors as $hexCode) {
          foreach ($colorApi as $color) {
              if (strtolower($color['hex']) === strtolower($hexCode)) {
                  $colorNames[] = $color['name'];
                  break;
              }
          }
      }

      // Fetch all product printing options
      $productPrintings = ProductPrinting::all();
      $latestProductDelivery = ProductDelivery::latest('id')->first();
      // Fetch product pricing
      $pricing = $product->productPricing;
      $quantities = $pricing ? $pricing->quantity : []; // Already an array due to casts
      $prices = $pricing ? $pricing->pricing : []; // Already an array due to casts

      // Pass all data to the view
      return view('main.pages.productDetail', [
          'product'          => $product,
          'colors'           => $productColor,
          'colorNames'       => $colorNames, // List of color names
          'quantities'       => $quantities,
          'prices'           => $prices,
          'productPrintings' => $productPrintings, // Pass printing options
          'latestProductDelivery' => $latestProductDelivery,
      ]);
  }

    }