<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $table = 'orders';

    protected $fillable = [
        'user_id',
        'order_id',
        'discount_id',
        'total_price',
        'subtotal_price',
        'discount_price',
        'status',
    ];

    /**
     * Relationship with User
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /**
     * Relationship with Order Items
     */
    public function items()
    {
        return $this->hasMany(OrderItem::class, 'order_id')
            ->with(['product', 'color', 'productBaseImages', 'printing', 'orderArtwork']);
    }

    public function Order_files()
    {
        return $this->hasMany(OrderFiles::class, 'order_id');
    }
    public function ShippingDetails()
    {
        return $this->hasOne(OrderShippingDetail::class, 'order_id');
    }
  
}
