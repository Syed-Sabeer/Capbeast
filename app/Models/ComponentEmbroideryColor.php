<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ComponentEmbroideryColor extends Model
{
    use HasFactory;

    protected $table = 'component_embroidery_color';

    protected $fillable = [
        'color_name',
        'color_code',
    ];
}
