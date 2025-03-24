<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\Product; 
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        
        // $products = Product::with(['productColors', 'productPricing', 'productBaseImages'])
        // ->where('visibility', 1)
        // ->get();

       
        // return view('main.pages.products', compact('products'));
        return view('main.pages.products');
    }
}