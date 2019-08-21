<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CollectionsOptions extends Model
{
    public function collection()
    {
        return $this->belongsTo(Collections::class);
    }

    public function images()
    {
        return $this->hasMany(CollectionsOptionsImages::class);
    }
}
