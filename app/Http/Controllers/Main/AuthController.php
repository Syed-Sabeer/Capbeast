<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use App\Mail\UserRegisteredMail;
use Illuminate\Support\Facades\Mail;

class AuthController extends Controller
{
    // Show Registration Form
    public function showRegistrationForm()
    {
        return view('main.pages.signup');
    }

 
public function register(Request $request)
{
    Log::info('Register request data', $request->all());

    $validator = Validator::make($request->all(), [
        'firstname' => 'required|string|max:255',
        'lastname' => 'required|string|max:255',
        'contact_number' => 'required|string|max:20',
        'language' => 'required|string|in:en,fr,es,pt-PT',
        'email' => 'required|email|unique:users,email',
        'password' => 'required|min:8|confirmed',
        'reseller' => 'required',
        'neq_number' => 'nullable|required_if:reseller,yes',
        'country' => 'required|in:USA,CANADA',
    ]);
    

    if ($validator->fails()) {
        return redirect()->back()->withErrors($validator)->withInput();
    }

    $isReseller = $request->reseller === 'yes' ? 1 : 0;
    $neqNumber = $isReseller ? $request->neq_number : null;
    $status = $isReseller ? 0 : 1;

    $user = User::create([
        'first_name' => $request->firstname,
        'last_name' => $request->lastname,
        'contact_number' => $request->contact_number,
        'language' => $request->language,
        'email' => $request->email,
        'password' => Hash::make($request->password),
        'is_reseller' => $isReseller,
        'neq_number' => $neqNumber,
        'status' => $status,
        'country' => $request->country,
    ]);

    auth()->login($user);

    // 📩 Send Email Based on User Type
    // Mail::to($user->email)->send(new UserRegisteredMail($user, $isReseller));

    // if ($isReseller) {
    //     Log::info('Sending reseller email to sales@monkeybeanies.com for:', ['email' => $user->email]);
    //     Mail::to('sales@monkeybeanies.com')->send(new UserRegisteredMail($user, $isReseller, true));
    // }
    

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
        return redirect()->route('user.login')->with('status', 'You have been logged out.');
    }
}
