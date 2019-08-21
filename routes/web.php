<?php

use App\Categories;
use App\Products;

Route::get('/', 'ProjectController@index');

Route::any('/search', function () {
    if (request()->has('search')) {
        $p = request('search');

        $categories = Categories::with('subcategory')->where('status', 1)->get();
        $products = Products::where('headline', 'like', '%' . $p . '%')->paginate(21);

        if (count($products) > 0) {
            return view('layouts.pretraga', compact('products', 'categories', 'p'));
        } else {
            return view('layouts.pretraga-prazno', compact('products', 'categories', 'p'));
        }
    }
});

Route::get('/vorur', 'CategoriesController@index');

Route::get('/collections/{collection}', 'CollectionsController@show');

Route::get('/product/{product}', 'ProductsController@show');
Route::post('/product/{product}/inquiry', 'ProductsController@inquiry');

Route::get('/category/{cat}', 'CategoriesController@show');

Route::get('/subcategories/{subcategory}', 'SubCategoryController@show');

Route::get('/innblastur', 'InspirationsController@index');
Route::get('/innblastur/{inspiration}', 'InspirationsController@show');

/* Inspiration single page*/
Route::get('/heimilid', 'InspirationsController@heimilid');
Route::get('/vinnusvodi', 'InspirationsController@vinnusvodi');
Route::get('/ur-boklingum', 'InspirationsController@urboklingum');
/* End Inspiration single page*/

Route::get('/honnudir', 'DesignersController@index');
Route::get('/honnudir/{designer}', 'DesignersController@show');

Route::get('/frettir', 'NewsController@index');
Route::get('/frettir/{news}', 'NewsController@show');

Route::get('/um-okkur', 'AboutController@index');

Route::get('/hafdu-samband', 'ContactController@index');
Route::post('/hafdu-samband', 'ContactController@store');


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
/* ADD CATEGORY */
Route::get('/home/add-category', 'HomeController@categories')->name('home-add-categories');
Route::post('/home/add-category', 'HomeController@categoriesStore');
Route::patch('/home/add-category/{categorie}/categories-status', 'HomeController@categoriesStatus');
Route::delete('/home/add-category/{categorie}/categories-destroy', 'HomeController@categoriesDestroy');
/* ADD SUBCATEGORY */
Route::get('/home/add-subcategory', 'HomeController@subCategories')->name('home-add-subcategories');
Route::post('/home/add-subcategory', 'HomeController@subCategoriesStore');
Route::patch('/home/add-subcategory/{subcategorie}/subcategories-status', 'HomeController@subCategoriesStatus');
Route::delete('/home/add-subcategory/{subcategorie}/subcategories-destroy', 'HomeController@subCategoriesDestroy');
/* PRODUCT */
Route::get('/home/products', 'HomeController@products')->name('home-products');
Route::get('/home/add-product', 'HomeController@addProduct')->name('home-add-product');
Route::post('/home/add-product', 'HomeController@productStore');
Route::get('/home/{product}/edit', 'HomeController@editProduct');
Route::post('/home/{product}/edit', 'HomeController@editProductStore');
Route::patch('/home/{product}/price-status', 'HomeController@editPriceStatus');
Route::patch('/home/{product}/product-status', 'HomeController@editProductStatus');
/* BIND PRODUCT VARIATION - ADD IMAGE */
Route::post('/home/{product}/add-variation', 'HomeController@addVariation');
Route::post('/home/{product}/add-variation-images', 'HomeController@addVariationImages');
Route::post('/home/{product}/add-images', 'HomeController@addImages');
Route::delete('/home/{product}/destroy-image/{img}', 'HomeController@destroyProductGalleryImage');
Route::delete('/home/{product}/destroy-variation-image/{img}', 'HomeController@destroyProductGalleryVariationImage');
/* ADD NEW PRODUCT VARIATION */
Route::get('/home/add-new-variation', 'HomeController@variations')->name('home-add-new-variations');
Route::post('/home/add-new-variation', 'HomeController@variationsStore');
/* MESSAGES */
Route::get('/home/messages', 'HomeController@messages')->name('home-messages');
Route::get('/home/messages/{message}', 'HomeController@showMessages');
Route::delete('/home/messages/{message}', 'HomeController@destroyMessages');
/* ORDERS - INQUIRY */
Route::get('/home/inquiry', 'HomeController@inquiry')->name('home-inquiry');
Route::get('/home/inquiry/{inquiry}', 'HomeController@singleInquiry')->name('home-single-inquiry');
Route::delete('/home/inquiry/{inquiry}/destroy', 'HomeController@destroyInquiry');
/* INSPIRATIONS */
Route::get('/home/inspiration', 'HomeController@inspirations')->name('home-inspiration');
Route::get('/home/add-inspiration', 'HomeController@addInspirations')->name('home-add-inspiration');
Route::post('/home/add-inspiration', 'HomeController@addInspirationsStore');
Route::get('/home/inspiration/{inspiration}/edit', 'HomeController@inspirationsEdit');
Route::post('/home/inspiration/{inspiration}/add-inspiration-gallery-images', 'HomeController@inspirationsAddGalleryImages');
Route::patch('/home/inspiration/{inspiration}/gallery-status', 'HomeController@galleryStatus');
Route::patch('/home/inspiration/{inspiration}/status', 'HomeController@inspirationsStatus');
Route::delete('/home/inspiration/{inspiration}/destroy-inspiration-gallery-images/{id}', 'HomeController@destroyInspirationsGalleryImages');
/* DESIGNERS */
Route::get('/home/designers', 'HomeController@designers')->name('home-designers');
Route::get('/home/add-designer', 'HomeController@addDesigner')->name('home-add-designer');
Route::post('/home/add-designer', 'HomeController@storeDesigner');
Route::get('/home/designers/{designer}/edit', 'HomeController@designerEdit');
Route::patch('/home/designers/{designer}/status', 'HomeController@designerStatus');
Route::delete('/home/designers/{designer}/destroy', 'HomeController@destroyDesigner');
/* NEWS */
Route::get('/home/news', 'HomeController@news')->name('home-news');
Route::get('/home/add-news', 'HomeController@addNews')->name('home-add-news');
Route::post('/home/add-news', 'HomeController@storeNews');
Route::get('/home/news/{new}/edit', 'HomeController@newsEdit');
Route::patch('/home/news/{new}/gallery-status', 'HomeController@newsGalleryStatus');
Route::post('/home/news/{new}/add-news-gallery-images', 'HomeController@newsAddGalleryImages');
Route::patch('/home/news/{new}/status', 'HomeController@newsStatus');
Route::delete('/home/news/{new}/destroy', 'HomeController@destroyNews');
/* HOME PAGE SLIDER */
Route::get('/home/home-slider', 'HomeController@slider')->name('home-slider');
Route::get('/home/add-slider', 'HomeController@addSlider');
Route::post('/home/add-slider', 'HomeController@storeSlider');
Route::patch('/home/slider/{collection}/gallery-status', 'HomeController@sliderStatus');
Route::get('/home/slider/{slider}', 'HomeController@editSlider');
/* INSTAGRAM */
Route::get('/home/instagram', 'HomeController@instagram')->name('home-instagram');