<?php

namespace App\Http\Controllers;

use App\Categories;
use App\SubCategory;

class SubCategoryController extends Controller
{
    public  function show(SubCategory $subcategory)
    {
        $categories = Categories::with('subcategory')->where('status', 1)->get();

        return view('layouts.subcategories', compact('categories', 'subcategory'));
    }
}
