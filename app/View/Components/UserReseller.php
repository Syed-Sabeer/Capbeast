<?php
// app/View/Components/UserReseller.php

namespace App\View\Components;

use Illuminate\View\Component;

class UserReseller extends Component
{
    public $isReseller;
    public $neqNumber;

    // Constructor accepts the props passed from the Blade view
    public function __construct($isReseller, $neqNumber = null)
    {
        $this->isReseller = $isReseller;
        $this->neqNumber = $neqNumber;
    }

    /**
     * The view / contents that should be rendered for the component.
     *
     * @return \Illuminate\View\View|string
     */
    public function render()
    {
        return view('components.user-reseller');
    }
}
