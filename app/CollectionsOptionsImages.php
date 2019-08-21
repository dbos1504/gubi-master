<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CollectionsOptionsImages extends Model
{
    public function option()
    {
        return $this->belongsTo(CollectionsOptions::class);
    }
}
