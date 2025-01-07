<?php

namespace App\Http\Controllers\Admin\Components;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ComponentProductColor;

class ProductColorController extends Controller
{
    // Add page
    public function index()
    {
        $colors = ComponentProductColor::all();
        return view('admin.content.component.productColor', compact('colors'));
    }

    // List page
    public function list()
    {
        $colors = ComponentProductColor::all();
        return view('admin.content.component.productColorList', compact('colors'));
    }

    // Store a new color
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'color_code' => 'required|string|max:7|regex:/^#[a-fA-F0-9]{6}$/',
        ]);

        ComponentProductColor::create([
            'color_name' => $validatedData['title'],
            'color_code' => $validatedData['color_code'],
        ]);

        return redirect()->route('content-product-color-list')->with('success', 'Color added successfully!');
    }

    // Edit page
    public function edit($id)
    {
        $color = ComponentProductColor::findOrFail($id);
        return view('admin.content.component.productColorEdit', compact('color'));
    }

    // Update color
    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'color_code' => 'required|string|max:7|regex:/^#[a-fA-F0-9]{6}$/',
        ]);

        $color = ComponentProductColor::findOrFail($id);
        $color->update([
            'color_name' => $validatedData['title'],
            'color_code' => $validatedData['color_code'],
        ]);

        return redirect()->route('content-product-color-list')->with('success', 'Color updated successfully!');
    }

    // Delete color
    public function destroy($id)
    {
        $color = ComponentProductColor::findOrFail($id);
        $color->delete();

        return redirect()->route('content-product-color-list')->with('success', 'Color deleted successfully!');
    }
}
