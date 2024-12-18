<?php

namespace App\Http\Controllers\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class EcommercePrintingList extends Controller
{
    public function index()
    {
        return view('content.apps.app-ecommerce-printing-list');
    }
}
