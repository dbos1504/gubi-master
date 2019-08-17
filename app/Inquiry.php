<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Inquiry extends Model
{
    protected $fillable = [
        'firstname',
        'lastname',
        'email',
        'phone',
        'products',
        'variation',
        'inq',
        'qty',
        'message',
        'image',
        'status',
    ];
}
