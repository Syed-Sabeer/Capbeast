<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartArtwork extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'cart_artwork';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'cart_id',
        'artwork_type',
        'artwork_dataText',
        'artwork_dataImage',
        'patch_length',
        'patch_height',
        'font_style',
        'num_of_imprint',
        'imprint_color',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'imprint_color' => 'array',
        'patch_length' => 'float',
        'patch_height' => 'float',
    ];

   
    public function cart()
    {
        return $this->belongsTo(Cart::class);
    }
}
