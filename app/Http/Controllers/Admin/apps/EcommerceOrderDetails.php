<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderFiles;
use App\Models\InternalStatus;
use App\Models\OrderInternalStatus;

class EcommerceOrderDetails extends Controller
{
    public function index($orderId)
{
    // Retrieve the order with related data
    $order = Order::with(['user', 'Order_files', 'ShippingDetails', 'items' => function ($query) {
        $query->with('orderArtwork');
    }])->findOrFail($orderId);

    // Retrieve the latest internal status for this order based on updated_at
    $latestStatus = OrderInternalStatus::where('order_id', $orderId)
        ->orderBy('updated_at', 'desc')  // Order by most recent update timestamp
        ->with('internalStatus')  // Include the related internal status
        ->first();

    // Retrieve status history
    $statusHistory = OrderInternalStatus::where('order_id', $orderId)
        ->orderBy('updated_at', 'asc') // Order by ascending updated_at
        ->with('internalStatus')  // Include the related internal status
        ->get();

    // Retrieve only active (non-soft-deleted) statuses for the dropdown
    $statuses = InternalStatus::all(); // Exclude soft-deleted statuses

    return view('admin.content.apps.app-ecommerce-order-details', compact('order', 'statuses', 'latestStatus', 'statusHistory'));
}

    
    

    public function updateOrderStatus(Request $request, $orderId)
    {
        $request->validate([
            'internal_status_id' => 'required|exists:internal_status,id',
        ]);
    
        // Check if the status already exists for this order
        $existingOrderStatus = OrderInternalStatus::where('order_id', $orderId)
            ->where('internal_status_id', $request->internal_status_id)
            ->first();
    
        if ($existingOrderStatus) {
            // If the status exists and the same, just update the updated_at timestamp
            if ($existingOrderStatus->internal_status_id == $request->internal_status_id) {
                $existingOrderStatus->touch(); // This will update the updated_at field
            }
        } else {
            // If it doesn't exist, insert a new record
            OrderInternalStatus::create([
                'order_id' => $orderId,
                'internal_status_id' => $request->internal_status_id,
            ]);
        }
    
        return redirect()->route('app-ecommerce-order-detail', $orderId)->with('success', 'Order status updated successfully.');
    }
    
    

    public function orderfileupload(Request $request, $id)
    {
        // Validate the incoming request
        $request->validate([
            'title' => 'required|string|max:255', 
            'file' => 'required|file|mimes:jpg,jpeg,png,pdf,doc,docx,zip,xls,xlsm,xlsx,xltx|max:2048', 
        ]);

        // Process the file upload if a file is provided
        if ($request->hasFile('file')) {
            $file = $request->file('file');

            // Generate a unique filename
            $fileName = time() . '_' . $file->getClientOriginalName();

            // Save the file
            $file->move(public_path('uploads'), $fileName);

            // Create the order file record
            OrderFiles::create([
                'order_id' => $id,
                'title' => $request->input('title'), 
                'file' => 'uploads/' . $fileName, 
            ]);

            return back()->with('success', 'File uploaded successfully!');
        }

        return back()->with('error', 'No file was uploaded.');
    }
}
