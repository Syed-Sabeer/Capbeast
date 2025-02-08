<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DiscountCoupon extends Model
{
    use HasFactory;
    protected $table = 'discount_coupon';

    protected $fillable = [
        'title',
        'code',
        'discount_type',
        'item_id',
        'percentage',
        'is_all',
        'is_expiry',
        'expiry_type',
        'expiry_value',
        'visibility',
    ];

    protected $guarded = [];
    public function discountable()
    {
        return $this->morphTo();
    }
}
