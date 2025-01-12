<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;

    protected $table = 'order_items';

    protected $fillable = [
        'order_id',
        'product_id',
        'quantity',
        'beanie_type',
        'printing_price',
        'product_price',
        'delivery_price',
        'price',
        'color_id',
        'printing_id',
    ];

    /**
     * Relationship with Order
     */
    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }

    /**
     * Relationship with Product
     */
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id')
            ->select(['id', 'title', 'description']);
    }
    public function productBaseImages()
    {
        return $this->hasMany(ProductBaseImage::class, 'product_id'); 
    }

    /**
     * Relationship with Color
     */
    public function color()
    {
        return $this->belongsTo(ProductColor::class, 'color_id');
    }

    /**
     * Relationship with Printing
     */
    public function printing()
    {
        return $this->belongsTo(ProductPrinting::class, 'printing_id');
    }
}
