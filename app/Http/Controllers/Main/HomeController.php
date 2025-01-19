<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\Product; 
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        
        $products = Product::where('visibility', 1)
        ->latest()
        ->take(8)
        ->get();
    

       
        return view('main.pages.home', compact('products'));
    }
}
