<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $table = 'order';

    protected $fillable = [
        'user_id',
        'total_price',
        'delivery_price',
        'status', // e.g., pending, completed, cancelled
        'payment_status', // e.g., paid, unpaid
        'delivery_address',
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
        return $this->hasMany(OrderItem::class, 'order_id');
    }
}
