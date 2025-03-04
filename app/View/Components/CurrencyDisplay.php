<?php

namespace App\View\Components;

use Illuminate\View\Component;
use Illuminate\Support\Facades\Auth;

class CurrencyDisplay extends Component
{
    public $country;

    public function __construct()
    {
        // Get logged-in user or session value for country
        $user = Auth::user();
        $this->country = $user ? $user->country : (session('country') ?? 'USA');
    }

    public function render()
    {
        return view('components.currency-display');
    }
}
