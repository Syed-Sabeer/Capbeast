<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\Product; // Import the Product model
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        // Retrieve the 6 latest added products
        $products = Product::where('visibility', 1)
        ->latest()
        ->take(8)
        ->get();
    

        // Pass products to the view
        return view('main.pages.home', compact('products'));
    }
}
