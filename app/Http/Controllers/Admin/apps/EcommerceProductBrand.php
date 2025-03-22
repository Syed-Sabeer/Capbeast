<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Brand;
use Illuminate\Support\Facades\Log;

class EcommerceProductBrand extends Controller
{
    public function index()
    {
        $brands = Brand::paginate(25);
        return view('admin.content.apps.app-ecommerce-brand-list', compact('brands'));
    }

    public function create()
    {
        return view('admin.content.apps.app-ecommerce-brand-add');
    }

    public function updateBrandVisibility($id, Request $request)
    {
        $request->validate([
            'visibility' => 'required|boolean',
        ]);
    
        $brand = Brand::findOrFail($id);
        $brand->update(['visibility' => $request->visibility]);
    
        return response()->json(['success' => true]);
    }

    public function store(Request $request)
    {
        Log::info('Store method called', ['request_data' => $request->all()]);
    
        try {
            $data = $request->validate([
                'title' => 'required|string|max:255',
                'description' => 'nullable|string',
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'visibility' => 'nullable|integer'
            ]);
        } catch (\Illuminate\Validation\ValidationException $e) {
            Log::error('Validation failed', ['errors' => $e->errors()]);
            return redirect()->back()->withErrors($e->errors())->withInput();
        }
    
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('brands', 'public');
            $data['image'] = $imagePath;
            Log::info('Image stored', ['path' => $data['image']]);
        }
    
        try {
            $brands = Brand::create($data);
            Log::info('Brand created successfully', ['brand' => $brands]);
        } catch (\Exception $e) {
            Log::error('Error inserting brand', ['error' => $e->getMessage()]);
            return redirect()->back()->with('error', 'Failed to add brand!');
        }
    
        return redirect()->route(app('authUser')->role . '.app-ecommerce-product-brand')->withSuccess('Brand added successfully!');



    }
    


    public function edit(Brand $brands)
    {
        return view('admin.content.apps.app-ecommerce-brand-edit', compact('brands'));
    }

    public function update(Request $request, Brand $brands)
    {
        $data = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'visibility' => 'required|integer'
        ]);

        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('brands', 'public');
        }

        $brands->update($data);
        return redirect()->route(app('authUser')->role . '.app-ecommerce-product-brand')->with('success', 'Brand updated successfully!');
    }

    public function destroy(Brand $brands)
    {
        $brands->delete();
        return redirect()->route(app('authUser')->role . '.app-ecommerce-product-brand')->with('success', 'Brand deleted successfully!');
    }
}
