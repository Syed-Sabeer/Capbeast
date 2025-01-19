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
        
        $users = User::all();

       
        return view('admin.content.apps.app-ecommerce-customer-all', compact('users'));
    }

    public function updateStatus($id, Request $request)
    {
        
        $request->validate([
            'status' => 'required|boolean',
        ]);
    
      
        $user = User::findOrFail($id);
    
        // Update the status field directly
        $user->status = $request->status;
    
        // Attempt to save the updated user
        $user->save();
    
        
        Log::info("User ID $id updated status to {$request->status}");
    
        return response()->json(['success' => true]);
    }
    
}
