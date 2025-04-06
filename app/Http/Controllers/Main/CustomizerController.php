<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductColor;
use App\Models\UserCustomization;
use Illuminate\Http\Request;

class CustomizerController extends Controller
{
    public function index()
    {
        return view('main.customizer');
    }

    public function add(Request $request)
    {
      dd(auth()->id());
        $request->validate([
            'productId' => 'required|exists:products,id',
            'colorId' => 'required|exists:product_color,id',
        ]);

        $product = Product::findOrFail($request->productId);
        $productColor = ProductColor::findOrFail($request->colorId);


        $userCustomization = UserCustomization::where('user_id', auth()->id())
            ->where('product_color_id', $request->colorId)
            ->first();

        if(!$userCustomization){
          $userCustomization = new UserCustomization();
          $userCustomization->user_id = auth()->id();
          $userCustomization->product_color_id = $request->colorId;
          $userCustomization->save();
        }

        return redirect()->back()->with('success', 'Customizer settings updated successfully');
    }
}
