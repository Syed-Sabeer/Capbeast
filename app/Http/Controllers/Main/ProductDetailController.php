<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\ComponentEmbroideryColor;
use App\Models\Product;
use App\Models\ProductPrinting;
use App\Models\ProductDelivery;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;

class ProductDetailController extends Controller
{
    public function showColorBook()
{
    $file = public_path('assetsMain/pdf/ColorBook.pdf');
    return Response::make(file_get_contents($file), 200, [
        'Content-Type' => 'application/pdf',
        'Content-Disposition' => 'inline; filename="ColorBook.pdf"',
    ]);
}


    public function index($id)
    {
        // Fetch product details using Eloquent
        $product = Product::findOrFail($id);
    
        // $embroideryColors = ComponentEmbroideryColor::get(['color_name', 'color_code']);


        // Fetch related product colors
        $productColors = $product->productColors ?? [];  // Ensure it's initialized as an array
    
        // Load the color_api.json file
        $colorApi = json_decode(file_get_contents(public_path('assetsCommon/api/color_api.json')), true);
    
        // Map hex codes to names
        $colorNames = [];
        foreach ($productColors as $color) {
            foreach ($colorApi as $colorApiItem) {
                if (strtolower($colorApiItem['hex']) === strtolower($color->color)) {
                    $colorNames[] = $colorApiItem['name'];
                    break;
                }
            }
        }
    
        // Fetch all product printing options
        $productPrintings = ProductPrinting::all();
        $latestProductDelivery = ProductDelivery::latest('id')->first();
    
        // Fetch product pricing, iterate over the collection to get quantity and pricing
        $pricing = $product->productPricing;
        $quantities = $pricing->pluck('quantity');
        $prices = $pricing->pluck('pricing');
    
        // Fetch base images
        $baseImages = $product->productBaseImages;
    
        // Fetch delivery details (quantities and pricing)
        $quantitiesdelivery = [];
        $pricesDelivery = [];
        if ($latestProductDelivery) {
            $quantitiesdelivery = json_decode($latestProductDelivery->quantity, true);
            $pricesDelivery = json_decode($latestProductDelivery->pricing, true);
        }
    
        // Pass all data to the view
        return view('main.pages.productDetail', [
            'product' => $product,
            'colors' => $productColors,  // Use correct variable name here
            'colorNames' => $colorNames,
            'quantities' => $quantities,
            'prices' => $prices,
            'productPrintings' => $productPrintings,
            'latestProductDelivery' => $latestProductDelivery,
            'baseImages' => $baseImages,
            'quantitiesdelivery' => $quantitiesdelivery,  // Pass quantitiesdelivery
            'pricesDelivery' => $pricesDelivery,  // Pass pricesDelivery
            // 'embroideryColors' => $embroideryColors,
        ]);
    }
}
