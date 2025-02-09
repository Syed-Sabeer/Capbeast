<?php

namespace App\Http\Controllers\Admin\Components;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\TaxPrice;

class TaxPricingController extends Controller
{
    public function index()
    {
        $taxPercentage = TaxPrice::first(); // Get the first record
        return view('admin.content.component.taxPriceList', compact('taxPercentage'));
    }

    public function create()
    {
        return view('admin.content.component.taxPriceAdd');
    }

    public function store(Request $request)
    {
        $request->validate([
            'taxpercentage' => 'required|numeric|min:0|max:100',
        ]);
    
        TaxPrice::create([
            'percentage' => $request->taxpercentage,
        ]);
    
        return redirect()->route('tax_price.index')->with('success', 'Tax Percentage Added');
    }

    public function edit($id)
    {
        $taxPercentage = TaxPrice::findOrFail($id);
        return view('admin.content.component.taxPriceEdit', compact('taxPercentage'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'taxpercentage' => 'required|numeric|min:0|max:100',
        ]);
    
        $taxPercentage = TaxPrice::findOrFail($id);
        $taxPercentage->update([
            'percentage' => $request->taxpercentage,
        ]);
    
        return redirect()->route('tax_price.index')->with('success', 'Tax Percentage Updated');
    }

    public function destroy($id)
{
    $taxPercentage = TaxPrice::findOrFail($id);
    $taxPercentage->delete();

    return redirect()->route('tax_price.index')->with('success', 'Tax Percentage Deleted');
}

}
