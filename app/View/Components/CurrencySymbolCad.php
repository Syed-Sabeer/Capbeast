<?php

namespace App\View\Components;

use Illuminate\View\Component;
use Illuminate\Support\Facades\Auth;

class CurrencySymbolCad extends Component
{
    public $country;

    public function __construct()
    {
        // Detect country based on logged-in user or session
        $user = Auth::user();
        $this->country = $user ? $user->country : (session('country') ?? 'CANADA');
    }

    public function render()
    {
        return view('components.currency-symbol-cad');
    }
}
