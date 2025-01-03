<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EcommerceAuthController extends Controller
{
    /**
     * Show the login form for the admin.
     */
    public function showLoginForm()
    {
        return view('admin.content.apps.login');
    }

    /**
     * Handle login request for admin.
     */
    public function login(Request $request)
    {
        // Validate input fields
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        // Attempt to log in the admin
        $credentials = $request->only('email', 'password');

        if (Auth::guard('admin')->attempt($credentials)) {
            // Regenerate session to prevent fixation
            $request->session()->regenerate();
            return redirect()->route('app-ecommerce-delivery-add')->with('success', 'Welcome to the admin dashboard!');
        }

        // Redirect back with error message
        return redirect()->back()->withErrors(['email' => 'Invalid email or password.'])->withInput($request->except('password'));
    }

    /**
     * Handle logout request for admin.
     */
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
