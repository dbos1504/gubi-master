<?php

namespace App\Http\Controllers;


use App\Categories;
use App\Products;

class ProductsController extends Controller
{
    public function show(Products $product)
    {
        $categories = Categories::with('subcategory')->where('status', 1)->get();
        $relateds = Products::where(['sub_category_id' => $product->sub_category_id, 'status' => 1])->take(3)->get();
        $product->increment('views');

        return view('layouts.product', compact('product', 'categories', 'relateds'));
    }
}
