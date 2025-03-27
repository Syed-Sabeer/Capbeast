<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ProductSEO;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'products'; // Define the table name
    protected $fillable = ['brand_id','mlb_id', 'title','slug', 'description','cost_price','selling_price', 'visibility'];

    public function productColors()
    {
        return $this->hasMany(ProductColor::class, 'product_id');
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'product_categories', 'product_id', 'category_id');
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
  


    public function ProductVolumeDiscount()
    {
        return $this->hasMany(ProductVolumeDiscount::class, 'product_id'); // Updated to hasMany for multiple pricing options
    }

    public function discountCoupons()
    {
        return $this->morphMany(DiscountCoupon::class, 'discountable');
    }
}
