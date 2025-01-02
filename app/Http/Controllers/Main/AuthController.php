<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    // Show Registration Form
    public function showRegistrationForm()
    {
        return view('main.pages.signup');
    }

    // Handle Registration Form Submission
    public function register(Request $request)
    {
        // Log request data for debugging
        Log::info('Register request data', $request->all());

        // Validate the request
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:8|confirmed',
            'reseller' => 'required',
            'neq_number' => 'nullable|required_if:reseller,yes',
        ]);

        // If validation fails, return back with errors
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        // Check if reseller and set values accordingly
        $isReseller = $request->reseller === 'yes' ? 1 : 0;
        $neqNumber = $isReseller ? $request->neq_number : null;

        // Log processed user data for debugging
        Log::info('Processed user data', [
            'is_reseller' => $isReseller,
            'neq_number' => $neqNumber,
        ]);

        // Create the user
        $user = User::create([
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'is_reseller' => $isReseller,
            'neq_number' => $neqNumber,
        ]);

        // Log the created user
        Log::info('Created user', ['user_id' => $user->id]);

        // Log the user in
        auth()->login($user);

        // Redirect to the home page with success message
        return redirect()->route('home')->with('success', 'Registration successful!');
    }

    // Show Login Form
    public function showLoginForm()
    {
        return view('main.pages.signin');
    }

    // Handle Login Form Submission
    public function login(Request $request)
    {
        // Validate the login form
        $validated = $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:8',
        ]);

        // Attempt to log the user in
        if (Auth::attempt($validated, $request->remember)) {
            // Redirect to the intended page or home page after successful login
            return redirect()->intended(route('home'));
        }

        // If authentication fails, redirect back with an error message
        return back()->withErrors(['email' => 'Invalid credentials. Please try again.']);
    }

    // Logout the user
    public function logout()
    {
        Auth::logout();
        return redirect()->route('user.login')->with('success', 'Successfully logged out.');
    }
}
