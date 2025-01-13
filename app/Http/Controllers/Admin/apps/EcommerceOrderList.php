<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
class EcommerceOrderList extends Controller
{
  public function index()
  {
    

    $orders = Order::with(['user', 'items' => function ($query) {
      $query->with('orderArtwork');
  }])->get();



    return view('admin.content.apps.app-ecommerce-order-list', compact('orders'));
  }

 
}
