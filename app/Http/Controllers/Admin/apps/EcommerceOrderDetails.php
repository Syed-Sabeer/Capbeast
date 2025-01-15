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
        // Fetch the order with its related data (user, items, orderArtwork, etc.)
        $order = Order::with(['user', 'Order_files','ShippingDetails', 'items' => function ($query) {
            $query->with('orderArtwork');
        }])->findOrFail($orderId);// Find the order by ID or fail if not found

        // Return the view with the order details
        return view('admin.content.apps.app-ecommerce-order-details', compact('order'));
    }

    public function orderfileupload(Request $request, $id)
    {
        // Validate the incoming request
        $request->validate([
            'title' => 'required|string|max:255', // Title is required
            'file' => 'required|file|mimes:jpg,jpeg,png,pdf,doc,docx,zip|max:2048', // Adjust MIME types and size limit as needed
        ]);
    
        // Process the file upload if a file is provided
        if ($request->hasFile('file')) {
            $file = $request->file('file');
    
            // Generate a unique filename
            $fileName = time() . '_' . $file->getClientOriginalName();
    
            // Define the path to store the file inside the public directory
            $filePath = public_path('uploads/' . $fileName);
    
            // Move the uploaded file to the public folder
            $file->move(public_path('uploads'), $fileName);
    
            // Save the file details in the database
            OrderFiles::create([
                'order_id' => $id,
                'title' => $request->input('title'), // Save the title
                'file' => 'uploads/' . $fileName, // Store the relative path
            ]);
    
            $notification = [
                'message' => 'File uploaded successfully!',
                'alert-type' => 'success',
            ];
    
            return back()->with($notification);
        }
    
        // Handle the case where no file was uploaded
        $notification = [
            'message' => 'No file was uploaded.',
            'alert-type' => 'error',
        ];
    
        return back()->with($notification);
    }
    
    


}
