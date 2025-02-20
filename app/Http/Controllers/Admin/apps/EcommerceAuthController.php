<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

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
            $request->session()->regenerate();

            // Get the authenticated admin user
            $user = Auth::guard('admin')->user();
            Log::info('Admin Login:', ['role' => $user->role]);

            // Ensure the role is mapped to the correct prefix
            $validRoles = ['admin', 'sale', 'marketing'];
            $prefix = in_array($user->role, $validRoles) ? $user->role : 'admin';

            return redirect()->intended(route(prefixedRouteName($prefix, 'app-ecommerce-dashboard')))
    ->with('success', "Welcome to the {$user->role} dashboard!");

        
        }

        return redirect()->back()->withErrors(['email' => 'Invalid email or password.'])->withInput($request->except('password'));
    }

    public function logout(Request $request)
    {
        $guards = ['admin', 'marketing', 'sale'];

        foreach ($guards as $guard) {
            if (Auth::guard($guard)->check()) {
                Auth::guard($guard)->logout();
                break;
            }
        }

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('admin.login')->with('status', 'You have been logged out.');
    }
}
