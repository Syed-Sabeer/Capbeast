<?php

namespace App\Http\Controllers\Apps;

use App\Http\Controllers\Controller;
use App\Models\ProductPrinting;

class EcommercePrintingList extends Controller
{
    public function index()
    {
        // Fetch all records using the model
        $printing = ProductPrinting::all();

        // Pass the data to the view
        return view('content.apps.app-ecommerce-printing-list', compact('printing'));
    }
}
