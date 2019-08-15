<?php

namespace App\Http\Controllers;

use App\Categories;
use App\CategoriesProducts;
use App\Products;
use App\ProductsImages;
use App\ProductsVariations;
use App\SubCategory;
use App\SubVariations;
use App\Variations;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function products()
    {
        $products = Products::paginate(31);

        return view('auth.products', compact('products'));
    }

    public function addProduct()
    {
//        $designers = Designers::all();
        $categories = Categories::all();
        $subcategories = SubCategory::all();
//        $collections = Collections::all();
        return view('auth.add-product', compact( 'categories', 'subcategories'));
    }

    public function productStore()
    {
        $podaci['categories_id'] = request('categories_id');
        $podaci['sub_category_id'] = request('sub_category_id');
        $podaci['headline'] =  request('headline');
        $podaci['price'] =  request('price') ;
        $podaci['currency'] =  request('currency');
        $podaci['body'] =  request('body');
        $image = request()->file('image');
        $new_name = request()->file('image')->getClientOriginalName();
        $image->move(public_path('img/products'), $new_name);
        $podaci['image'] = $new_name ? $new_name : 'no-image.jpg';
        $podaci['alt'] = request('alt') ? request('alt') : 'Image';
        $podaci['price_status'] = 0;
        $podaci['status'] = 1;
        $podaci['location'] = strtolower(str_replace(' ', '-', request('headline')));

        $prod = Products::create($podaci);

        CategoriesProducts::create([
            'categories_id' => request('categories_id'),
            'products_id' => $prod->id
        ]);

        if (request('duplicate_category')) {
            CategoriesProducts::create([
                'categories_id' => request('duplicate_category'),
                'products_id' => $prod->id
            ]);
        }

        $images = request()->file('images');

        if($images) {
            $br = 0;
            foreach($images as $key => $image) {
                $img['products_id'] = $prod->id;
                $img['alt'] = request('name_var' . $br++);
                $imagee = $image;
                $new_name = $image->getClientOriginalName();
                $imagee->move(public_path('img/products'), $new_name);
                $img['image'] = $new_name;

                ProductsImages::create($img);
            }
        }

        return redirect('/home/' . $prod->location . '/edit')->with('flash', 'New product is added, great');
    }

    public function editProduct(Products $product)
    {
//        $designers = Designers::all();
        $categories = Categories::all();
        $subcategories = Subcategory::all();
//        $collections = Collections::all();
        $variations = Variations::all();
        $subvariations = ProductsVariations::where('products_id', $product->id)->get();

        return view('auth.edit-product', compact('product', 'categories', 'subcategories', 'variations', 'subvariations'));
    }

    public function editProductStore(Products $product)
    {
        $podaci['designers_id'] = request('designers_id') ? request('designers_id') :  $product->designers_id;
        $podaci['categories_id'] = request('categories_id') ? request('categories_id') :  $product->categories_id;
        $podaci['sub_category_id'] = request('sub_category_id') ? request('sub_category_id') :  $product->sub_category_id;
        $podaci['collections_id'] = request('collections_id') ? request('collections_id') :  $product->collections_id;
        $podaci['headline'] = request('headline') ? request('headline') :  $product->headline;
        $podaci['price'] = request('price') ? request('price') :  $product->price;
        $podaci['currency'] = request('currency') ? request('currency') :  $product->currency;
        $podaci['body'] = request('body') ? request('body') :  $product->body;

        if (request('image')) {
            $image = request()->file('image');
            $new_name = request()->file('image')->getClientOriginalName();
            $image->move(public_path('img/products'), $new_name);
            $podaci['image'] = $new_name;
        } else {
            $podaci['image'] = $product->image;
        }

        $podaci['alt'] = request('alt') ? request('alt') :  $product->alt;
        $podaci['price_status'] = request('price_status')? request('price_status') : $product->price_status;
        $podaci['status'] = request('status')? request('status') : $product->status;
        $podaci['location'] = $product->location;
        $podaci['views'] = $product->views;

        $product->update($podaci);

        return back()->with('flash', 'Success. Product edited.');
    }

    public function editPriceStatus(Products $product)
    {
        $product->update(['price_status' => request('price_status')]);

        return back()->with('flash', 'Success. Product price status is edited.');
    }

    public function addImages(Products $product)
    {
        $images = request()->file('slika');
        $br = 0;
        foreach($images as $key => $image) {
            $podaci['products_id'] = $product->id;
            $imagee = $image;
            $new_name = $image->getClientOriginalName();
            $imagee->move(public_path('img/products'), $new_name);
            $podaci['image'] = $new_name;
            $podaci['alt'] = request('name_var' . $br++) ? request('name_var' . $br++) : 'Gubi image';

            ProductsImages::create($podaci);
        }

        return back()->with('flash', 'Images are added');
    }

    public function addVariation(Products $product)
    {
        $podaci['products_id'] = $product->id;
        $podaci['variations_id'] = request('variations_id');

        ProductsVariations::create($podaci);

        return back()->with('flash', 'Variation is added, please choose variation image in order to see your selected variation');
    }

    public function addVariationImages(Products $product)
    {
        $images = request()->file('images');
        if ($images) {
            $br = 0;
            foreach($images as $key => $image) {
                $podaci['products_id'] = $product->id;
                $podaci['variations_id'] = request('variations_id');
                $imagee = $image;
                $new_name = $image->getClientOriginalName();
                $imagee->move(public_path('img/products'), $new_name);
                $podaci['image'] = $new_name ? $new_name : '';
                $podaci['name'] = request('name_var' . $br++);
                $podaci['variation_name'] = request('variation_name') ? request('variation_name') : '';

                SubVariations::create($podaci);
            }
        } else {
            $podaci['products_id'] = $product->id;
            $podaci['variations_id'] = request('variations_id');
            $podaci['image'] = '';
            $podaci['name'] = request('variation_name');
            $podaci['variation_name'] = request('variation_name');

            SubVariations::create($podaci);
        }
        return back()->with('flash', 'You added variation images');
    }
}
