<?php

namespace App\Http\Controllers\Admin\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

class EcommerceProductCategory extends Controller


{

    
    
    public function index()
    {
        $categories = Category::all();
        return view('admin.content.apps.app-ecommerce-category-list', compact('categories'));
    }

    public function create()
    {
        return view('admin.content.apps.app-ecommerce-category-add');
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
            $imagePath = $request->file('image')->store('categories', 'public');
            $data['image'] = $imagePath;
            Log::info('Image stored', ['path' => $data['image']]);
        }
        
    
        try {
            $category = Category::create($data);
            Log::info('Category created successfully', ['category' => $category]);
        } catch (\Exception $e) {
            Log::error('Error inserting category', ['error' => $e->getMessage()]);
            return redirect()->back()->with('error', 'Failed to add category!');
        }
        
        return redirect()->route(app('authUser')->role . '.app-ecommerce-product-category')
    ->withSuccess('Category added successfully!');




    }
    


    public function edit(Category $category)
    {
        return view('admin.content.apps.app-ecommerce-category-edit', compact('category'));
    }

    public function update(Request $request, Category $category)
    {
        $data = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'visibility' => 'required|integer'
        ]);

        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('categories', 'public');
        }

        $category->update($data);
        return redirect()->route(app('authUser')->role . '.app-ecommerce-product-category')->with('success', 'Category updated successfully!');
    }

    public function destroy(Category $category)
    {
        $category->delete();
        return redirect()->route(app('authUser')->role . '.app-ecommerce-product-category')->with('success', 'Category deleted successfully!');
    }
}
