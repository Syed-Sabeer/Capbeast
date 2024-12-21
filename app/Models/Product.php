<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $table = 'products'; // Define the table name
    protected $fillable = ['title', 'description', 'base_images', 'visibility'];

    protected $casts = [
        'base_images' => 'array', // Automatically cast base_images as an array
    ];

    public function productColors()
    {
        return $this->hasOne(ProductColor::class, 'product_id');
    }

    // Keep the hasOne relationship if only one pricing record per product
    public function productPricing()
    {
        return $this->hasOne(ProductPricing::class, 'product_id');
    }

    // // Add accessors for min_price and max_price
    // public function getMinPriceAttribute()
    // {
    //     // Check if the pricing is an array; if not, make it an array
    //     $pricing = is_array($this->productPricing->pricing) ? $this->productPricing->pricing : [$this->productPricing->pricing];
    
    //     // Return the minimum price, or 0 if there's no valid pricing
    //     return $pricing ? (float)min($pricing) : 0;
    // }
    
    // public function getMaxPriceAttribute()
    // {
    //     // Check if the pricing is an array; if not, make it an array
    //     $pricing = is_array($this->productPricing->pricing) ? $this->productPricing->pricing : [$this->productPricing->pricing];
    
    //     // Return the maximum price, or 0 if there's no valid pricing
    //     return $pricing ? (float)max($pricing) : 0;
    // }
    
}
