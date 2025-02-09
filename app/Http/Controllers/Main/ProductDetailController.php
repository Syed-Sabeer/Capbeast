<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
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
        // Fetch the product by ID
        $product = Product::findOrFail($id);

        // Fetch the product colors (with associated component color and image)
        $productColors = $product->productColors->load('componentColor');  

        // Prepare color names and images
        $colorNames = [];
        $colorImages = [];
        foreach ($productColors as $productColor) {
            $colorNames[] = $productColor->componentColor->color_name;
            $colorImages[] = asset('storage/' . $productColor->image);  // Assuming the image is stored in storage folder
        }

        // Fetch product printings and delivery details
        $productPrintings = ProductPrinting::where('visibility', 1)
        ->get();
    
        $latestProductDelivery = ProductDelivery::latest('id')->first();

        // Fetch product pricing and quantities
        $pricing = $product->productPricing;
        $quantities = $pricing->pluck('quantity');
        $prices = $pricing->pluck('pricing');
        $USAprices = $pricing->pluck('usa_pricing');

        // Fetch base images
        $baseImages = $product->productBaseImages;

        // Fetch latest delivery quantities and prices
        $quantitiesdelivery = [];
        $pricesDelivery = [];
        if ($latestProductDelivery) {
            $quantitiesdelivery = json_decode($latestProductDelivery->quantity, true);
            $pricesDelivery = json_decode($latestProductDelivery->pricing, true);
        }

        // Return view with data
        return view('main.pages.productDetail', [
            'product' => $product,
            'colors' => $productColors, 
            'colorNames' => $colorNames,
            'colorImages' => $colorImages,
            'quantities' => $quantities,
            'prices' => $prices,
            'USAprices' => $USAprices,
            'productPrintings' => $productPrintings,
            'latestProductDelivery' => $latestProductDelivery,
            'baseImages' => $baseImages,
            'quantitiesdelivery' => $quantitiesdelivery, 
            'pricesDelivery' => $pricesDelivery,
        ]);
    }
}
