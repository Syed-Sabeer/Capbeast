<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\Product; // Import the Product model
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        // Retrieve all products with their associated colors and pricing
        $products = Product::with(['productColors', 'productPricing'])->get();

        // Pass products to the view
        return view('main.pages.products', compact('products'));
    }
}