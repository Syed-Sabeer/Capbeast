<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ComponentProductColor extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'component_product_color';

    protected $fillable = [
        'color_name',
        'color_code',
    ];

    public function productColors()
    {
        return $this->hasMany(ProductColor::class, 'color_id');
    }
}
