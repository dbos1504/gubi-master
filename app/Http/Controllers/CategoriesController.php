<?php

namespace App\Http\Controllers;

use App\Categories;
use App\Products;

class CategoriesController extends Controller
{
    public function index()
    {
        $categories = Categories::with('subcategory')->where('status', 1)->get();
        $products = Products::where(['categories_id' => 1, 'status' => 1])->get();

        return view('layouts.shop', compact('categories', 'products'));
    }

    public function show(Categories $cat)
    {
        $categories = Categories::with('subcategory')->where('status', 1)->get();

        return view('layouts.category', compact('categories', 'cat'));
    }
}
