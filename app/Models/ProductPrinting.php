<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductPrinting extends Model
{
    use HasFactory;

    // Specify the table name (optional if it follows Laravel's naming convention)
    protected $table = 'product_printing';

    // Specify the primary key (optional if it follows Laravel's naming convention)
    protected $primaryKey = 'id';

    // Allow mass assignment for these fields
    protected $fillable = [
        'title',
        'image',
        'quantity',
        'price',
        'is_leather',
    ];

    public $timestamps = true;

 
    protected $casts = [
        'quantity' => 'array', 
        'price' => 'array',    
    ];
}
