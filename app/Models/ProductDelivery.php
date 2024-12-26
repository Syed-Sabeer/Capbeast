<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductDelivery extends Model
{
    use HasFactory;

    protected $table = 'product_delivery'; // Define the table name

    protected $fillable = ['quantity', 'pricing'];

    protected $casts = [
        'quantity' => 'array', // Automatically cast quantity as an array
        'pricing' => 'array',  // Automatically cast pricing as an array
    ];
}