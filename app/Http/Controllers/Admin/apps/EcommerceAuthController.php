<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EcommerceAuthController extends Controller
{
    
    public function showLoginForm()
    {
        return view('admin.content.apps.login');
    }

   
    public function login(Request $request)
    {
        
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

       
        $credentials = $request->only('email', 'password');

        if (Auth::guard('admin')->attempt($credentials)) {
            // Regenerate session to prevent fixation
            $request->session()->regenerate();
            return redirect()->route('app-ecommerce-dashboard')->with('success', 'Welcome to the admin dashboard!');
        }

      
        return redirect()->back()->withErrors(['email' => 'Invalid email or password.'])->withInput($request->except('password'));
    }

   
    public function logout(Request $request)
    {
        // Log out the admin
        Auth::guard('admin')->logout();

        // Invalidate the session
        $request->session()->invalidate();

        // Regenerate the CSRF token
        $request->session()->regenerateToken();

        return redirect()->route('admin.login')->with('status', 'You have been logged out.');
    }
}
