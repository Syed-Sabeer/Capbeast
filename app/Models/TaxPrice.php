<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TaxPrice extends Model
{
    use HasFactory;

    protected $table = 'tax_price'; // Define table name

    protected $fillable = ['percentage']; // Allow mass assignment
}
