<?php

namespace App\Http\Controllers;

use App\Collections;
use App\Products;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CollectionsController extends Controller
{
    public function show(Collections $collection)
    {
        $products = Products::where(['status' => 1, 'collections_id' => $collection->id])->get();

        return view('layouts.collection', compact('collection', 'products'));
    }
}
