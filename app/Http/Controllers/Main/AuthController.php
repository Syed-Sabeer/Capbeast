<?php

namespace App\Http\Controllers\Main;

use App\Models\Cart;
use App\Models\CartArtwork;
use App\Models\TempCartImage;
use Illuminate\Support\Facades\Storage;

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

    if ($user) {
        auth()->login($user);

        $cartCookie = $request->cookie('cart');
        $cartFromLocalStorage = $cartCookie ? json_decode($cartCookie, true) : [];

        if ($cartFromLocalStorage) {
            foreach ($cartFromLocalStorage as $item) {
                $cartItem = Cart::create([
                    'user_id' => $user->id,
                    'product_id' => $item['productId'],
                    'color_id' => $item['colorId'],
                    'quantity' => $item['quantity'],
                    'beanie_type' => $item['beanieType'],
                    'is_pompom' => $item['PomPomOption'],
                    'printing_id' => $item['printingId'],
                    'printing_price' => $item['printingPrice'],
                    'product_price' => $item['productPrice'],
                    'delivery_price' => $item['deliveryPrice'],
                    'pompom_price' => $item['pompomPrice'],
                ]);

                if (!empty($item['artworkType']) && (!empty($item['artworkDataText']) || !empty($item['artworkDataImage']))) {
                    CartArtwork::create([
                        'cart_id' => $cartItem->id,
                        'artwork_type' => $item['artworkType'],
                        'artwork_dataText' => $item['artworkDataText'] ?? null,
                        'artwork_dataImage' => $item['artworkDataImage'] ?? null,
                        'patch_length' => $item['patchLength'] ?? null,
                        'patch_height' => $item['patchHeight'] ?? null,
                        'font_style' => $item['fontStyle'] ?? null,
                        'num_of_imprint' => $item['numOfImprint'] ?? null,
                      'imprint_color' => isset($item['imprintColors']) && is_array($item['imprintColors'])
    ? json_encode($item['imprintColors'])
    : json_encode([]),

                        'leathercolor' => $item['leathercolor'] ?? null,
                    ]);
                }
            }
            return redirect()->route('cart')->withCookie(cookie()->forget('cart'));
        }

        // 📩 Send Email Based on User Type
        // Mail::to($user->email)->send(new UserRegisteredMail($user, $isReseller));

        if ($isReseller) {
            Log::info('Sending reseller email to sales@monkeybeanies.com for:', ['email' => $user->email]);
            Mail::to('registration@monkeybeanies.com')->send(new UserRegisteredMail($user, $isReseller, true));
        }


        return redirect()->route('home')->with('success', 'Registration successful!');
    }
}

// Show Login Form
public function showLoginForm()
{
    return view('main.pages.signin');
}

// Handle Login Form Submission
public function login(Request $request)
{
    Log::info('Login request received', $request->all());

    $credentials = $request->validate([
        'email' => 'required|email',
        'password' => 'required'
    ]);

    if (Auth::attempt($credentials)) {
        $user = Auth::user();
        Log::info('User authenticated successfully', ['user_id' => $user->id]);

        $sessionCountry = session('country', 'USA');
        Log::info('Session country:', ['sessionCountry' => $sessionCountry]);

        $cartCookie = request()->cookie('cart') ?? $_COOKIE['cart'] ?? null;
        Log::info('Cart cookie received:', ['cartCookie' => $cartCookie]);

        $cartFromLocalStorage = json_decode($cartCookie, true) ?? [];
        if (!$cartFromLocalStorage) {
            Log::error('Cart cookie is empty or not received properly!');
        }

        Log::info('Cart from cookie before processing:', ['cart' => $cartFromLocalStorage]);

        if ($user->country === $sessionCountry) {
            foreach ($cartFromLocalStorage as $item) {
                $cartItem = Cart::create([
                    'user_id' => $user->id,
                    'product_id' => $item['productId'],
                    'color_id' => $item['colorId'],
                    'quantity' => $item['quantity'],
                    'beanie_type' => $item['beanieType'],
                    'is_pompom' => $item['PomPomOption'],
                    'printing_id' => $item['printingId'],
                    'printing_price' => $item['printingPrice'],
                    'product_price' => $item['productPrice'],
                    'delivery_price' => $item['deliveryPrice'],
                    'pompom_price' => $item['pompomPrice'],
                ]);

                if (!empty($item['artworkType']) && (!empty($item['artworkDataText']) || !empty($item['artworkDataImage']))) {
                    $originalSessionId = $request->cookie('original_session_id', session()->getId());
                    $tempImage = TempCartImage::where('session_id', $originalSessionId)->first();
                    
                    if (!$tempImage) {
                        Log::error('No temp image found for session', ['session_id' => session()->getId()]);
                    } else {
                        Log::info('Temp image found', ['tempImage' => $tempImage]);
                    }
                    
                    if ($tempImage && empty($item['artworkDataImage'])) {
                        Log::info('Migrating temp image to permanent storage', ['tempImage' => $tempImage]);
                    
                        $relativePath = $tempImage->artwork_dataImage;
                        $oldPath = public_path('storage/' . $relativePath);
                        $newRelativePath = 'CustomerArtworkImages/' . basename($relativePath);
                        $newPath = public_path('storage/' . $newRelativePath);
                    
                        if (file_exists($oldPath)) {
                            $moved = rename($oldPath, $newPath);
                            if ($moved) {
                                $item['artworkDataImage'] = $newRelativePath;
                                Log::info('Image migration successful', [
                                    'oldPath' => $oldPath,
                                    'newPath' => $newPath,
                                    'storedPath' => $item['artworkDataImage']
                                ]);
                            } else {
                                Log::error('Failed to move image', ['oldPath' => $oldPath, 'newPath' => $newPath]);
                            }
                        } else {
                            Log::error('Temp image not found for migration', ['path' => $oldPath]);
                        }
                    }
                    

                    if ($request->hasFile('artworkDataImage')) {
                        if ($request->hasFile('artworkDataImage')) {
                            $file = $request->file('artworkDataImage');
                            $fileName = time() . '_' . $file->getClientOriginalName();
                            $path = 'storage/CustomerArtworkImages/' . $fileName;
                            $file->move(public_path('storage/CustomerArtworkImages'), $fileName);
                            
                            $item['artworkDataImage'] = $path;
                        }
                        
                    }

                    // 🖼️ Save artwork data to cart_artwork
                    CartArtwork::create([
                        'cart_id' => $cartItem->id,
                        'artwork_type' => $item['artworkType'],
                        'artwork_dataText' => $item['artworkDataText'] ?? null,
                        'artwork_dataImage' => !empty($item['artworkDataImage']) ? $item['artworkDataImage'] : null,
                        'patch_length' => $item['patchLength'] ?? null,
                        'patch_height' => $item['patchHeight'] ?? null,
                        'font_style' => $item['fontStyle'] ?? null,
                        'num_of_imprint' => $item['numOfImprint'] ?? null,
                        'imprint_color' => isset($item['imprintColors']) && is_array($item['imprintColors'])
                            ? json_encode($item['imprintColors'])
                            : json_encode([]),
                            'leathercolor' => !empty($item['leathercolor']) ? $item['leathercolor'] : null,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);

                    // 🗑️ Delete temp image from temp_cart_images
                    if ($tempImage) {
                        $oldPath = public_path('storage/' . $relativePath);
                        if (file_exists($oldPath)) {
                            unlink($oldPath);
                            Log::info('Temp image file deleted successfully', ['path' => $oldPath]);
                        } else {
                            Log::error('Temp image file not found for deletion', ['path' => $oldPath]);
                        }
                    
                        if ($tempImage->delete()) {
                            Log::info('Temp image record deleted successfully', ['tempImageId' => $tempImage->id]);
                        } else {
                            Log::error('Failed to delete temp image record', ['tempImageId' => $tempImage->id]);
                        }
                    }
                    
                }
            }

            Log::info('Cart & Artwork migrated, clearing cookie');
            return redirect()->route('cart')->withCookie(cookie()->forget('cart'));
        } else {
            Log::warning('Country mismatch, cart not saved', ['user_country' => $user->country]);
            return redirect()->route('home')->with('error', 'Country mismatch! Cart not saved.');
        }
    }

    Log::error('Invalid login attempt', ['email' => $request->email]);
    return back()->withErrors(['email' => 'Invalid credentials']);
}
public function uploadTempCartImage(Request $request)
{
    $sessionId = session()->getId();
    Log::info('uploadTempCartImage called', ['session_id' => $sessionId]);

    if ($request->hasFile('artworkDataImage')) {
        $file = $request->file('artworkDataImage');
        $fileName = time() . '_' . $file->getClientOriginalName();
        $relativePath = 'TempCartImages/' . $fileName;
        $absolutePath = public_path('storage/' . $relativePath);
        $file->move(dirname($absolutePath), $fileName);

        Log::info('Image uploaded successfully', ['path' => $relativePath]);

        TempCartImage::create([
            'session_id' => $sessionId,
            'artwork_dataImage' => $relativePath  // Store relative path in the database
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Image uploaded successfully',
            'path' => $relativePath
        ])->withCookie(cookie('original_session_id', $sessionId, 60));
    }

    Log::error('No image uploaded or file missing');
    return response()->json(['success' => false, 'message' => 'No image uploaded']);
}

// Logout the user
public function logout()
{
    Auth::logout();
    return redirect()->route('user.login')->with('status', 'You have been logged out.');
}
}
