<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderFiles;

class EcommerceOrderDetails extends Controller
{
    public function index($orderId)
    {
        
        $order = Order::with(['user', 'Order_files','ShippingDetails', 'items' => function ($query) {
            $query->with('orderArtwork');
        }])->findOrFail($orderId);

        
        return view('admin.content.apps.app-ecommerce-order-details', compact('order'));
    }

    public function orderfileupload(Request $request, $id)
    {
        // Validate the incoming request
        $request->validate([
            'title' => 'required|string|max:255', 
            'file' => 'required|file|mimes:jpg,jpeg,png,pdf,doc,docx,zip|max:2048', 
        ]);
    
        // Process the file upload if a file is provided
        if ($request->hasFile('file')) {
            $file = $request->file('file');
    
            // Generate a unique filename
            $fileName = time() . '_' . $file->getClientOriginalName();
    
           
            $filePath = public_path('uploads/' . $fileName);
    
           
            $file->move(public_path('uploads'), $fileName);
    
           
            OrderFiles::create([
                'order_id' => $id,
                'title' => $request->input('title'), 
                'file' => 'uploads/' . $fileName, 
            ]);
    
            $notification = [
                'message' => 'File uploaded successfully!',
                'alert-type' => 'success',
            ];
    
            return back()->with($notification);
        }
    
        
        $notification = [
            'message' => 'No file was uploaded.',
            'alert-type' => 'error',
        ];
    
        return back()->with($notification);
    }
    
    


}
