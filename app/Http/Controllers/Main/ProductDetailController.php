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
      
        $product = Product::findOrFail($id);
    
       
        $productColors = $product->productColors ?? [];  
    
      
        $colorApi = json_decode(file_get_contents(public_path('assetsCommon/api/color_api.json')), true);
    
        
        $colorNames = [];
        foreach ($productColors as $color) {
            foreach ($colorApi as $colorApiItem) {
                if (strtolower($colorApiItem['hex']) === strtolower($color->color)) {
                    $colorNames[] = $colorApiItem['name'];
                    break;
                }
            }
        }
    
        
        $productPrintings = ProductPrinting::all();
        $latestProductDelivery = ProductDelivery::latest('id')->first();
    
        
        $pricing = $product->productPricing;
        $quantities = $pricing->pluck('quantity');
        $prices = $pricing->pluck('pricing');
    
        
        $baseImages = $product->productBaseImages;
    
        
        $quantitiesdelivery = [];
        $pricesDelivery = [];
        if ($latestProductDelivery) {
            $quantitiesdelivery = json_decode($latestProductDelivery->quantity, true);
            $pricesDelivery = json_decode($latestProductDelivery->pricing, true);
        }
    
        
        return view('main.pages.productDetail', [
            'product' => $product,
            'colors' => $productColors, 
            'colorNames' => $colorNames,
            'quantities' => $quantities,
            'prices' => $prices,
            'productPrintings' => $productPrintings,
            'latestProductDelivery' => $latestProductDelivery,
            'baseImages' => $baseImages,
            'quantitiesdelivery' => $quantitiesdelivery, 
            'pricesDelivery' => $pricesDelivery,  
            
        ]);
    }
}
