<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $table = 'cart'; // Specify the correct table name

    protected $fillable = [
        'product_id',
        'user_id',
        'color_id',
        'quantity',
        'beanie_type',
        'printing_id',
        'printing_price',
        'product_price',
        'delivery_price',
    ];
}
