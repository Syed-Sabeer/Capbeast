<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use App\Models\User; // Add the User model
use Illuminate\Http\Request;

class EcommerceCustomerAll extends Controller
{
    public function index()
    {
        // Fetch all users from the users table
        $users = User::all();

        // Pass the users to the view
        return view('admin.content.apps.app-ecommerce-customer-all', compact('users'));
    }

    public function updateStatus($id, Request $request)
    {
        // Validate the incoming request
        $request->validate([
            'status' => 'required|boolean',
        ]);
    
        // Get the user
        $user = User::findOrFail($id);
    
        // Update the status field directly
        $user->status = $request->status;
    
        // Attempt to save the updated user
        $user->save();
    
        // Optional: Log the updated status for debugging
        Log::info("User ID $id updated status to {$request->status}");
    
        return response()->json(['success' => true]);
    }
    
}
