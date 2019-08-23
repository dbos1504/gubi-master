<?php

namespace App\Http\Controllers;

use App\Categories;
use App\Inquiry;
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

    public function inquiry(Products $product)
    {
        $podaci = request()->validate([
            'firstname' => 'required',
            'lastname' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'products' => 'required',
            'qty' => 'required',
            'message' => 'required|min:3',
            'image' => 'required',
        ]);
        $podaci['inq'] = request('inq') ? request('inq') : '';
        $podaci['variation'] = request('variation') ? request('variation') : '';

        Inquiry::create($podaci);

        return back()->with('flash', 'Thanks. Your inquiry is on the way, we will contact you as soon as possible.');
    }
}
