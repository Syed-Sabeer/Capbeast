<?php

namespace App\Http\Controllers\Admin\Components;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ComponentEmbroideryColor;

class EmbroideryColorController extends Controller
{
    // Add page
    public function index()
    {
        $colors = ComponentEmbroideryColor::all();
        return view('admin.content.component.embroideryColor', compact('colors'));
    }

    // List page
    public function list()
    {
        $colors = ComponentEmbroideryColor::all();
        return view('admin.content.component.embroideryColorList', compact('colors'));
    }

    // Store a new color
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'color_code' => 'required|string|max:7|regex:/^#[a-fA-F0-9]{6}$/',
        ]);

        ComponentEmbroideryColor::create([
            'color_name' => $validatedData['title'],
            'color_code' => $validatedData['color_code'],
        ]);

        return redirect()->route('content-embroidery-color-list')->with('success', 'Color added successfully!');
    }

    // Edit page
    public function edit($id)
    {
        $color = ComponentEmbroideryColor::findOrFail($id);
        return view('admin.content.component.embroideryColorEdit', compact('color'));
    }

    // Update color
    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'color_code' => 'required|string|max:7|regex:/^#[a-fA-F0-9]{6}$/',
        ]);

        $color = ComponentEmbroideryColor::findOrFail($id);
        $color->update([
            'color_name' => $validatedData['title'],
            'color_code' => $validatedData['color_code'],
        ]);

        return redirect()->route('content-embroidery-color-list')->with('success', 'Color updated successfully!');
    }

    // Delete color
    public function destroy($id)
    {
        $color = ComponentEmbroideryColor::findOrFail($id);
        $color->delete();

        return redirect()->route('content-embroidery-color-list')->with('success', 'Color deleted successfully!');
    }
}
