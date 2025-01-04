<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductPricing extends Model
{
    use HasFactory;

    protected $table = 'product_pricing';
    protected $fillable = ['product_id', 'pricing', 'quantity'];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
