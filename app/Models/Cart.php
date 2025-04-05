<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $table = 'cart'; // Specify the correct table name

    protected $fillable = [
        'user_id',
        'product_id',
        'color_id',
        'quantity',
        'size',
    ];

    /**
     * Optimized relationship with Product
     * Fetch only the basic product data: title, description, visibility
     */
    public function product()
{
    return $this->belongsTo(Product::class, 'product_id')
        ->select(['id', 'title', 'slug', 'description', 'visibility']);
}


    /**
     * Relationship with User
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /**
     * Relationship with Color (assuming ProductColor is used to represent colors)
     */
    public function color()
    {
        return $this->belongsTo(ProductColor::class, 'color_id');
    }

    /**
     * Relationship with ProductPrinting
     */
    public function printing()
    {
        return $this->belongsTo(ProductPrinting::class, 'printing_id');
    }

    /**
     * Relationship with ProductBaseImage (to fetch base images for the product in the cart)
     */
    public function productBaseImages()
    {
        return $this->product->productBaseImages(); // Use the product's productBaseImages method
    }

    /**
     * Relationship with CartArtwork
     * Fetch all artworks associated with this cart
     */
    public function artworks()
    {
        return $this->hasMany(CartArtwork::class, 'cart_id');
    }
}
