<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $table = 'products'; // Define the table name
    protected $fillable = ['title', 'description', 'visibility', 'is_pompom'];

    public function productColors()
    {
        return $this->hasMany(ProductColor::class, 'product_id'); // Updated to hasMany for multiple colors
    }

    public function productPricing()
    {
        return $this->hasMany(ProductPricing::class, 'product_id'); // Updated to hasMany for multiple pricing options
    }

    public function productBaseImages()
    {
        return $this->hasMany(ProductBaseImage::class, 'product_id'); // Relationship with base images
    }
}
