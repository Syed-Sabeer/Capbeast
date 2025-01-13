<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;

class EcommerceOrderDetails extends Controller
{
    public function index($orderId)
    {
        // Fetch the order with its related data (user, items, orderArtwork, etc.)
        $order = Order::with(['user', 'items' => function ($query) {
            $query->with('orderArtwork');
        }])->findOrFail($orderId); // Find the order by ID or fail if not found

        // Return the view with the order details
        return view('admin.content.apps.app-ecommerce-order-details', compact('order'));
    }
}
