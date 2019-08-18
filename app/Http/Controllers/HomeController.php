<?php

namespace App\Http\Controllers;

use App\Categories;
use App\CategoriesProducts;
use App\Contact;
use App\Designers;
use App\Inquiry;
use App\Inspirations;
use App\InspirationsImages;
use App\Products;
use App\ProductsImages;
use App\ProductsVariations;
use App\SubCategory;
use App\SubVariations;
use App\Variations;

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
        $products = Products::orderBy('views', 'DESC')->take(3)->get();
        $inquiry = Inquiry::orderBy('created_at', 'DESC')->take(4)->get();
        $messages = Contact::orderBy('created_at', 'DESC')->take(5)->get();

        return view('home', compact('products','inquiry', 'messages'));
    }
            /*  PRODUCT  */
    public function products()
    {
        $products = Products::paginate(31);

        return view('auth.products', compact('products'));
    }

    public function addProduct()
    {
        $designers = Designers::all();
        $categories = Categories::all();
        $subcategories = SubCategory::all();
//        $collections = Collections::all();
        return view('auth.add-product', compact( 'categories', 'subcategories', 'designers'));
    }

    public function productStore()
    {
        $podaci['categories_id'] = request('categories_id');
        $podaci['designers_id'] = request('designers_id');
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
        $podaci['location'] = mb_strtolower(str_replace(' ', '-', request('headline')));

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
                $img['alt'] = 'Gubi image';
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
        $designers = Designers::all();
        $categories = Categories::all();
        $subcategories = Subcategory::all();
//        $collections = Collections::all();
        $variations = Variations::all();
        $subvariations = ProductsVariations::where('products_id', $product->id)->get();

        return view('auth.edit-product', compact('product', 'categories', 'subcategories', 'variations', 'subvariations', 'designers'));
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
                  /*  PRICE  PRODUCT STATUS  */
    public function editPriceStatus(Products $product)
    {
        $product->update(['price_status' => request('price_status')]);

        return back()->with('flash', 'Success. Product price status is edited.');
    }

    public function editProductStatus(Products $product)
    {
        $product->update(['status' => request('status')]);

        return back()->with('flash', 'Success. Product status is edited.');
    }
              /*  PRODUCT IMAGES GALLERY  */
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
            $podaci['alt'] = 'Gubi-image';

            ProductsImages::create($podaci);
        }

        return back()->with('flash', 'Images are added');
    }
             /*  VARIATION  */
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
                $podaci['name'] = request('vari'.$br) ? request('vari'.$br++) : 'Gubi image';
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

    public function variations()
    {
        $variations = Variations::all();

        return view('auth.add-variations', compact('variations'));
    }

    public function variationsStore()
    {
        request()->validate([
            'name' => 'required'
        ]);

        $podaci['name'] = request('name');

        Variations::create($podaci);

        return back()->with('flash', 'New variation is added.');
    }
              /*  CATEGORY  */
    public function categories()
    {
        $categories = Categories::all();

        return view('auth.categories', compact('categories'));
    }

    public function categoriesStore()
    {
        $podaci = request()->validate([
            'name' => 'required'
        ]);

//        $podaci['name'] = request('name');
        $podaci['subcategories_id'] = 0;
        $podaci['location'] = mb_strtolower(str_replace(' ', '-', request('name')));
        $podaci['status'] = 1;

        Categories::create($podaci);

        return redirect('/home/add-category')->with('flash', 'Success. New Category added.');
    }

    public function categoriesStatus(Categories $categorie)
    {
        $categorie->update(['status' => request('status')]);

        return back()->with('flash', 'Success. Category Status is updated');
    }

    public function categoriesDestroy(Categories $categorie)
    {
        $categorie->delete();

        return back()->with('flash', 'Success. Category is deleted');
    }
              /*  SUBCATEGORY  */
    public function subCategories()
    {
        $categories = Categories::all();

        return view('auth.subcategories', compact('categories'));
    }

    public function subCategoriesStatus(SubCategory $subcategorie)
    {
        $subcategorie->update(['status' => request('status')]);

        return back()->with('flash', 'Success. Sub-Category Status is updated');
    }

    public function subCategoriesStore()
    {
        $podaci = request()->validate([
            'categories_id' => 'required',
            'headline' => 'required',
        ]);

//        $podaci['categories_id'] = request('categories_id');
//        $podaci['headline'] = request('headline');
        $podaci['designer_id'] = 0;
        $podaci['collection_id'] = 0;
        $podaci['location'] = mb_strtolower(str_replace(' ', '-', request('headline')));
        $podaci['status'] = 1;

        SubCategory::create($podaci);

        return redirect('/home/add-subcategory')->with('flash', 'Success. New Sub-Category added.');
    }

    public function subCategoriesDestroy(SubCategory $subcategorie)
    {
        $subcategorie->delete();

        return back()->with('flash', 'Success. SubCategory is deleted');
    }
              /*  MESSAGES  */
    public function messages()
    {
        $messages = Contact::all();

        return view('auth.messages', compact('messages'));
    }
    public function showMessages(Contact $message)
    {
        $message->update(['status' => 1]);

        return view('auth.message', compact('message'));
    }
    public function destroyMessages(Contact $message)
    {
        $message->delete();

        return redirect('/home/messages')->with('flash', 'Message was deleted');
    }
            /*  INQUIRY  */
    public function inquiry()
    {
        $inquiry = Inquiry::all();

        return view('auth.inquiry', compact('inquiry'));
    }

    public function singleInquiry(Inquiry $inquiry)
    {
        $inquiry->update(['status' => 1]);

        return view('auth.single-inquiry', compact('inquiry'));
    }
    public function destroyInquiry(Inquiry $inquiry)
    {
        $inquiry->delete();

        return redirect('/home/inquiry')->with('flash', 'Inquiry was deleted');
    }
          /*  INSPIRATION  */
    public function inspirations()
    {
        $inspirations = Inspirations::all();

        return view('auth.inspirations', compact('inspirations'));
    }

    public function addInspirations()
    {
        return view('auth.add-inspiration');
    }

    public function addInspirationsStore()
    {
        $podaci['name'] = request('name');
        $podaci['description'] = request('description');
        $podaci['body'] =  request('body') ? request('body') : '';
        $podaci['location'] = mb_strtolower(str_replace(' ', '-', request('name')));
        $podaci['alt'] = request('alt') ? request('alt') : 'Image';
        $podaci['status'] = 1;
        $podaci['gallery_status'] = 0;
        $image = request()->file('image');
        $new_name = request()->file('image')->getClientOriginalName();
        $image->move(public_path('img/products'), $new_name);
        $podaci['image'] = $new_name;

        $ins = Inspirations::create($podaci);

        return redirect('/home/inspiration/' . $ins->location . '/edit')->with('flash', 'Success. Inspiration is created.');
    }

    public function inspirationsEdit(Inspirations $inspiration)
    {
        return view('auth.edit-inspiration', compact('inspiration'));
    }
    /*  INSPIRATION  GALLERY */
    public function inspirationsAddGalleryImages(Inspirations $inspiration)
    {
        $images = request()->file('image');
        $br = 0;
        foreach($images as $key => $image) {
            $podaci['inspirations_id'] = $inspiration->id;
            $imagee = $image;
            $new_name = $image->getClientOriginalName();
            $imagee->move(public_path('img/inspirations'), $new_name);
            $podaci['image'] = $new_name;
            $podaci['alt'] = 'Gubi-image';

            InspirationsImages::create($podaci);
        }

        return back()->with('flash', 'Images are added');
    }

    public function galleryStatus(Inspirations $inspiration)
    {
        $inspiration->update(['gallery_status' => request('gallery_status')]);

        return back()->with('flash', 'Inspiration gallery status updated');
    }

    public function inspirationsStatus(Inspirations $inspiration)
    {
        $inspiration->update(['status' => request('status')]);

        return back()->with('flash', 'Inspiration status updated');
    }
}
