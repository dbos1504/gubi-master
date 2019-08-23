<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SubVariationsOption extends Model
{
    public function sub()
    {
        return $this->belongsTo(SubVariations::class);
    }
}
