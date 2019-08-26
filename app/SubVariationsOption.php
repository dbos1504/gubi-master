<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SubVariationsOption extends Model
{
    protected $guarded = [];

    public function sub()
    {
        return $this->belongsTo(SubVariations::class);
    }
}
