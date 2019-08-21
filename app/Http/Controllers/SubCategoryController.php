<?php

namespace App\Http\Controllers;

use App\Categories;
use App\Products;
use App\SubCategory;

class SubCategoryController extends Controller
{
    public  function show(SubCategory $subcategory)
    {
        $categories = Categories::with('subcategory')->where('status', 1)->get();

        if ($subcategory->headline == 'GamFratesi') {
              $paginate = Products::where('designers_id', 6)->paginate(21);
        } else
        if ($subcategory->headline == 'Bat Collection') {
             $paginate = Products::where('collections_id', 1)->paginate(21);
        } else
        if ($subcategory->headline == 'Beetle Collection') {
             $paginate = Products::where('collections_id', 2)->paginate(21);
        } else
             $paginate = $subcategory->products()->paginate(21);

        return view('layouts.subcategories', compact('categories', 'subcategory', 'paginate'));
    }
}
