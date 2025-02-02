<?php

namespace App\Http\Controllers\Admin\Components;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\InternalStatus;
use App\Models\Product;
use App\Models\DiscountCoupon;
use App\Models\ProductPrinting;
use Exception;
use Illuminate\Support\Facades\Log;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Validation\ValidationException;

class DiscountCouponsController extends Controller
{
    public function index()
    {
        return view('admin.content.component.discountCouponAdd');
    }

    public function getItems(Request $request)
    {
        try {
            if ($request->type == 1) {
                $items = Product::select('id', 'title')->get();
            } elseif ($request->type == 3) {
                $items = ProductPrinting::select('id', 'title')->get();
            } else {
                return response()->json([], 400);
            }

            return response()->json($items);
        } catch (Exception $e) {
            return response()->json(['error' => 'Something went wrong!'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            // Log request data to debug
            Log::info('Form data:', $request->all());  // Log all form data to check
    
            $request->validate([
                'title' => 'required|string',
                'code' => 'required|string|unique:discount_coupon',
                'discount_type' => 'required|integer|in:1,3',
                'item_id' => 'required|integer',
                'percentage' => 'required|numeric|min:0|max:100',
                // Validation for expiry fields
                'is_expiry' => 'required|boolean', // For expiry switch
                'expiry_type' => 'nullable|in:time_limit,duration', // Expiry type (time limit or duration)
                'count' => 'nullable|integer|min:1', // If time limit is selected
                'duration' => 'nullable|integer|min:1', // If duration is selected
            ]);
    
            $discountCoupon = new DiscountCoupon();
            $discountCoupon->title = $request->title;
            $discountCoupon->code = $request->code;
            $discountCoupon->discount_type = $request->discount_type;
            $discountCoupon->percentage = $request->percentage;
    
            // Handle expiry functionality
            $discountCoupon->is_expiry = $request->is_expiry ? 1 : 0; // Set expiry status (1 if on, 0 if off)
            
            if ($request->is_expiry) { // If expiry switch is on
                $expiryType = $request->expiry_type;
    
                // Handle expiry type (time limit or duration)
                if ($expiryType == 'time_limit') {
                    $discountCoupon->expiry_type = 1; // Time limit
                    $discountCoupon->expiry_value = $request->count; // Set the count for the time limit
                } elseif ($expiryType == 'duration') {
                    $discountCoupon->expiry_type = 2; // Duration
                    $discountCoupon->expiry_value = $request->duration; // Set the duration in days
                }
            }
    
            // Handle the "Select All" case for item_id
            if ($request->item_id == 0) {
                // Log and skip saving the coupon for specific items
                Log::info("Select All is chosen, skipping saving for specific items.");
            } else {
                if ($request->discount_type == 1) {
                    $product = Product::findOrFail($request->item_id);
                    $product->discountCoupons()->save($discountCoupon);
                } elseif ($request->discount_type == 3) {
                    $printing = ProductPrinting::findOrFail($request->item_id);
                    $printing->discountCoupons()->save($discountCoupon);
                }
            }
    
            return redirect()->back()->with('success', 'Discount coupon added successfully!');
        } catch (ValidationException $e) {
            Log::error(['error' => $e->getMessage()]);
            return redirect()->back()->withErrors($e->errors())->withInput();
        } catch (ModelNotFoundException $e) {
            Log::error(['error' => $e->getMessage()]);
            return redirect()->back()->with('error', 'Selected item not found!')->withInput();
        } catch (Exception $e) {
            Log::error(['error' => $e->getMessage()]);
            return redirect()->back()->with('error', 'Something went wrong! Please try again later.')->withInput();
        }
    }
    

    public function list()
    {
        $discountCoupons = DiscountCoupon::with(['discountable'])->get(); // eager load discountable relationship
        return view('admin.content.component.discountCouponList', compact('discountCoupons'));
    }

    // Edit coupon
    public function edit($id)
    {
        $discountCoupon = DiscountCoupon::findOrFail($id);
        return view('admin.content.component.discountCouponEdit', compact('discountCoupon'));
    }

    // Update coupon
    public function update(Request $request, $id)
    {
        try {
            $request->validate([
                'title' => 'required|string',
                'code' => 'required|string|unique:discount_coupon,code,' . $id,
                'discount_type' => 'required|integer|in:1,3',
                'item_id' => 'required|integer',
                'percentage' => 'required|numeric|min:0|max:100',
            ]);

            $discountCoupon = DiscountCoupon::findOrFail($id);
            $discountCoupon->title = $request->title;
            $discountCoupon->code = $request->code;
            $discountCoupon->discount_type = $request->discount_type;
            $discountCoupon->percentage = $request->percentage;

            if ($request->discount_type == 1) {
                $product = Product::findOrFail($request->item_id);
                $product->discountCoupons()->save($discountCoupon);
            } elseif ($request->discount_type == 3) {
                $printing = ProductPrinting::findOrFail($request->item_id);
                $printing->discountCoupons()->save($discountCoupon);
            }

            return redirect()->route('content-discount-coupon-list')->with('success', 'Discount coupon updated successfully!');
        } catch (Exception $e) {
            Log::error(['error' => $e->getMessage()]);
            return redirect()->back()->with('error', 'Something went wrong! Please try again later.');
        }
    }

    // Delete coupon
    public function destroy($id)
    {
        try {
            $discountCoupon = DiscountCoupon::findOrFail($id);
            $discountCoupon->delete();

            return redirect()->route('content-discount-coupon-list')->with('success', 'Discount coupon deleted successfully!');
        } catch (Exception $e) {
            Log::error(['error' => $e->getMessage()]);
            return redirect()->back()->with('error', 'Something went wrong! Please try again later.');
        }
    }
}
