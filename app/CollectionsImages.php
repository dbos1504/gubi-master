<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CollectionsImages extends Model
{
    protected $guarded = [];

    public function collection()
    {
        return $this->belongsTo(Collections::class);
    }
}
