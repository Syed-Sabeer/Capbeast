<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ComponentProductColor extends Model
{
    use HasFactory;

    protected $table = 'component_product_color';

    protected $fillable = [
        'color_name',
        'color_code',
    ];
}
