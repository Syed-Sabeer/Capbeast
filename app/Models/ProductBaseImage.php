<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductBaseImage extends Model
{
    use HasFactory;

    protected $table = 'product_baseimages';
    protected $fillable = ['product_id', 'base_image'];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
