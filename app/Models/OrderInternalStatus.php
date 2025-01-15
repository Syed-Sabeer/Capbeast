<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrderInternalStatus extends Model
{
    use HasFactory, SoftDeletes;

    // Specify the table name explicitly
    protected $table = 'order_internal_status';

    // Fields that can be mass-assigned
    protected $fillable = ['title','description'];
}
