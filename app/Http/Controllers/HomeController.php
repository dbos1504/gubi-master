<?php

namespace App\Http\Controllers;

use App\Categories;
use App\CategoriesProducts;
use App\Collections;
use App\CollectionsImages;
use App\Contact;
use App\Designers;
use App\Inquiry;
use App\Inspirations;
use App\InspirationsImages;
use App\News;
use App\NewsImages;
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
        $products = Products::latest('views')->take(4)->get();
        $inquiry = Inquiry::latest('created_at')->take(5)->get();
        $messages = Contact::latest('created_at')->take(5)->get();

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
        $collections = Collections::all();
        return view('auth.add-product', compact( 'categories', 'subcategories', 'designers', 'collections'));
    }

    public function productStore()
    {
        request()->validate([
            'headline' => 'required'
        ], [
            'headline.required' => 'A Headline is required',
        ]);

        $podaci['categories_id'] = request('categories_id');
        $podaci['designers_id'] = request('designers_id');
        $podaci['sub_category_id'] = request('sub_category_id');
        $podaci['collections_id'] = request('collections_id');
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

        flash()->success('New product is added, great. Start adding variations, if product has one.');

        return redirect('/home/' . $prod->location . '/edit');
    }

    public function editProduct(Products $product)
    {
        $designers = Designers::all();
        $categories = Categories::all();
        $subcategories = SubCategory::all();
        $collections = Collections::all();
        $variations = Variations::all();
        $subvariations = ProductsVariations::where('products_id', $product->id)->get();

        return view('auth.edit-product', compact('product', 'categories', 'subcategories', 'variations', 'subvariations', 'designers', 'collections'));
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

    public function destroyProduct(Products $product)
    {
        $product->delete();

        flash()->success('Success. Product deleted');

        return back();
    }

    public function destroyProductVariation(Products $product, ProductsVariations $id)
    {
        $id->delete();

        return back()->with('flash', 'Success. Variation deleted');
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
        request()->validate([
            'slika' => 'required'
        ], [
            'slika.required' => 'A Image is required',
        ]);

        $images = request()->file('slika');

        foreach($images as $key => $image) {
            $podaci['products_id'] = $product->id;
            $imagee = $image;
            $new_name = $image->getClientOriginalName();
            $imagee->move(public_path('img/products'), $new_name);
            $podaci['image'] = $new_name;
            $podaci['alt'] = 'Gubi-image';

            ProductsImages::create($podaci);
        }

        return back()->with('flash', 'Great. New images are added.');
    }

    public function destroyProductGalleryImage(Products $product, ProductsImages $img)
    {
        $img->delete();

        return back()->with('flash', 'Success. Image is deleted.');
    }

             /*  VARIATION  */
    public function addVariation(Products $product)
    {
        request()->validate([
            'variations_id' => 'required'
        ], [
            'variations_id.required' => 'Variation is required',
        ]);

        $podaci['products_id'] = $product->id;
        $podaci['variations_id'] = request('variations_id');

        ProductsVariations::create($podaci);

        return back()->with('flash', 'Variation is added, please choose variation image in order to see your selected variation');
    }

    public function addVariationImages(Products $product)
    {
        request()->validate([
            'images' => 'required'
        ], [
            'images.required' => 'Image is required',
        ]);

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
        ], [
            'name.required' => 'A Variation Name is required',
        ]);

        $podaci['name'] = request('name');

        Variations::create($podaci);

        return back()->with('flash', 'New variation is added.');
    }

    public function variationsDestroy(Variations $id)
    {
        $id->delete();

        return back()->with('flash', 'Success. Variation deleted.');
    }

    public function destroyProductGalleryVariationImage(Products $product, SubVariations $img)
    {
        $img->delete();

        return back()->with('flash', 'Success. Variation Image is deleted.');
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
        ],[
            'name.required' => 'A Category Name is required',
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
        ],[
            'categories_id.required' => 'Please select category for subcategory.',
            'headline.required' => 'A SubCategory Name is required.',
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
        $messages = Contact::orderBy('created_at', 'DESC')->get();

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
        $inquiry = Inquiry::orderBy('created_at', 'DESC')->get();

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
        request()->validate([
            'name' => 'required',
            'description' => 'required',
            'image' => 'required'
        ],[
            'name.required' => 'A Name is required',
            'description.required'  => 'A Description is required',
            'image.required'  => 'A Inspiration Image is required',
        ]);

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

    public function destroyInspirationsGalleryImages(Inspirations $inspiration, InspirationsImages $id)
    {
        $id->delete();

        return back()->with('flash', 'Success. Gallery image deleted.');
    }

    public function inspirationsDestroy(Inspirations $inspiration)
    {
        $inspiration->delete();

        return back()->with('flash', 'Success. Inspiration deleted.');
    }
    /*  DESIGNERS  */
    public function designers()
    {
        $designers = Designers::all();

        return view('auth.designers', compact('designers'));
    }

    public function designerEdit(Designers $designer)
    {
        return view('auth.edit-designer', compact('designer'));
    }

    public function addDesigner()
    {
        return view('auth.add-designer');
    }

    public function storeDesigner()
    {
        request()->validate([
            'name' => 'required',
            'body' => 'required',
            'image' => 'required'
        ],[
            'name.required' => 'A Name is required',
            'body.required'  => 'A Designer Bio is required',
            'image.required'  => 'A Designer Image is required',
        ]);
        $podaci['name'] = request('name');
        $podaci['body'] = request('body');
        $podaci['alt'] = request('alt') ? request('alt') : 'Gubi image';

        $image = request()->file('image');
        $new_name = request()->file('image')->getClientOriginalName();
        $image->move(public_path('img/'), $new_name);
        $podaci['image'] = $new_name;

        $image = request()->file('main_image');
        $new_name = request()->file('main_image')->getClientOriginalName();
        $image->move(public_path('img/'), $new_name);
        $podaci['main_image'] = $new_name;

        $podaci['main_image_alt'] = request('alt') ? request('alt') : 'Gubi image';

        $podaci['video'] = request('video') ? request('video') : '';
        $podaci['status'] = 1;
        $podaci['location'] = mb_strtolower(str_replace(' ', '-', request('name')));
        $podaci['collections_id'] = 0;

        $des = Designers::create($podaci);

        return redirect('/home/designers/' . $des->location . '/edit')->with('flash', 'Success. New designer added');
    }

    public function designerStatus(Designers $designer)
    {
        $designer->update(['status' => request('status')]);

        return back()->with('flash', 'Success. Designer status is edited.');
    }

    public function destroyDesigner(Designers $designer)
    {
        $designer->delete();

        return back()->with('flash', 'Success. Designer is deleted.');
    }
    /*  N E W S  */
    public function news()
    {
        $news = News::all();

        return view('auth.news', compact('news'));
    }

    public function addNews()
    {
        return view('auth.add-news');
    }

    public function storeNews()
    {
        request()->validate([
            'headline' => 'required',
            'description' => 'required',
            'image' => 'required'
        ],[
            'headline.required' => 'A Name is required',
            'description.required'  => 'A Description is required',
            'image.required'  => 'A News Image is required',
        ]);

        $podaci['headline'] = request('headline');
        $podaci['description'] = request('description');
        $image = request()->file('image');
        $new_name = request()->file('image')->getClientOriginalName();
        $image->move(public_path('img/'), $new_name);
        $podaci['image'] = $new_name;
        $podaci['alt'] = request('alt') ? request('alt') : 'Gubi image';
        $podaci['location'] = mb_strtolower(str_replace(' ', '-', request('headline')));
        $podaci['body'] = request('body') ? request('body') : '';
        $podaci['status'] = 1;
        $podaci['gallery_status'] = 0;

        $new = News::create($podaci);

        return redirect('/home/news/' . $new->location . '/edit')->with('flash', 'Success. News is added');
    }

    public function newsEdit(News $new)
    {
        return view('auth.edit-news', compact('new'));
    }

    public function newsGalleryStatus(News $new)
    {
        $new->update(['gallery_status' => request('gallery_status')]);

        return back()->with('flash', 'News gallery status updated');
    }

    public function newsStatus(News $new)
    {
        $new->update(['status' => request('status')]);

        return back()->with('flash', 'News status updated');
    }

    public function destroyNews(News $new)
    {
        $new->delete();

        return back()->with('flash', 'Success. News is deleted.');
    }

    /*  NEWS  GALLERY */
    public function newsAddGalleryImages(News $new)
    {
        $images = request()->file('image');
        $br = 0;
        foreach($images as $key => $image) {
            $podaci['news_id'] = $new->id;
            $imagee = $image;
            $new_name = $image->getClientOriginalName();
            $imagee->move(public_path('img/news'), $new_name);
            $podaci['image'] = $new_name;
            $podaci['alt'] = 'Gubi-image';

            NewsImages::create($podaci);
        }

        return back()->with('flash', 'Images are added');
    }

    /*  HOME SLIDER */
    public function slider()
    {
        $collections = Collections::all();
        return view('auth.slider', compact('collections'));
    }

    public function sliderStatus(Collections $collection)
    {
        $collection->update(['gallery_status' => request('gallery_status')]);

        return back()->with('flash', 'Success. Slider status is edited.');
    }

    public function addSlider()
    {
        return view('auth.add-slider');
    }

    public function editSlider(Collections $slider)
    {
        return view('auth.edit-slider', compact('slider'));
    }

    public function storeSlider()
    {
        $podaci['designers_id'] = 0;
        $podaci['image'] = 'No';
        $podaci['alt'] = 'No';
        $podaci['headline'] = 'No';
        $podaci['collection_desc'] = 'No';
        $podaci['inspiration_desc'] = 'No';
        $podaci['location'] = 'No';
        $podaci['where_to_buy'] = 'No';
        $podaci['body'] = 'No';
        $podaci['status'] = 0;
        $podaci['gallery_status'] = 0;
        $podaci['slider_name'] = request('slider_name') ? request('slider_name') : '';

        $coll = Collections::create($podaci);

        $images = request()->file('image');
        foreach($images as $key => $image) {
            $img['collections_id'] = $coll->id;
            $imagee = $image;
            $new_name = $image->getClientOriginalName();
            $imagee->move(public_path('img/collections'), $new_name);
            $img['image'] = $new_name;
            $img['alt'] = 'Gubi-image';

            CollectionsImages::create($img);
        }

        return redirect('home/slider/' . $coll->location)->with('flash', 'Success. New slider is added.');
    }
    /* INSTAGRAM */
    public function instagram()
    {
        return view('auth.instagram');
    }
}
