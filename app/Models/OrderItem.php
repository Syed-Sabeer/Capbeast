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
        'color_id',
        'size',
        'quantity',
        'product_price',
        
    ];

    /**
     * Relationship with Order
     */
    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }

    /**
     * Relationship with Artwork
     */
    // In OrderItem model
    public function orderArtwork()
    {
        return $this->hasOne(OrderArtwork::class);
    }



    /**
     * Relationship with Product
     */
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id')
            ->select(['id', 'title', 'description']);
    }

    

    /**
     * Relationship with Color
     */
    public function color()
    {
        return $this->belongsTo(ProductColor::class, 'color_id')
            ->with('componentColor'); // Eager-load componentColor
    }
    
    
    /**
     * Relationship with Printing
     */
    public function printing()
    {
        return $this->belongsTo(ProductPrinting::class, 'printing_id');
    }
}
