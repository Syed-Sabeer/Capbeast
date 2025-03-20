<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    use HasFactory;

    protected $table = 'brands'; 
    protected $fillable = ['title', 'description', 'image', 'visibility'];

    // Relationship with Product (One-to-Many)
    public function products()
    {
        return $this->hasMany(Product::class, 'category_id');
    }
}
