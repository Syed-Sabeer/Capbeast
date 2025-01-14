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

    
    
}
