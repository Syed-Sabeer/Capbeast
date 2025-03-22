<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ProductSEO;

class Product extends Model
{
    use HasFactory;

    protected $table = 'products'; // Define the table name
    protected $fillable = ['category_id', 'brand_id', 'title','slug', 'description','cost_price','selling_price', 'visibility'];

    public function productColors()
    {
        return $this->hasMany(ProductColor::class, 'product_id');
    }



    public function productSEO()
    {
        return $this->hasOne(ProductSEO::class, 'product_id');
    }
 
  // Product.php (Model)
public function productBrand()
{
    return $this->belongsTo(Brand::class, 'brand_id');
}

public function productCategory()
{
    return $this->belongsTo(Category::class, 'category_id');
}

    
    public function componentColors()
    {
        return $this->hasManyThrough(
            ComponentProductColor::class,   // Final model
            ProductColor::class,           // Intermediate model
            'product_id',                  // Foreign key on ProductColor
            'id',                          // Foreign key on ComponentProductColor
            'id',                          // Local key on Product
            'color_id'                     // Local key on ProductColor
        );
    }

    public function ProductVolumeDiscount()
    {
        return $this->hasMany(ProductVolumeDiscount::class, 'product_id'); // Updated to hasMany for multiple pricing options
    }

    public function productBaseImages()
    {
        return $this->hasMany(ProductBaseImage::class, 'product_id'); // Relationship with base images
    }
    public function discountCoupons()
    {
        return $this->morphMany(DiscountCoupon::class, 'discountable');
    }
}
