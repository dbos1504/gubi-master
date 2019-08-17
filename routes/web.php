<?php

Route::get('/', 'ProjectController@index');

Route::get('/vorur', 'CategoriesController@index');

Route::get('/product/{product}', 'ProductsController@show');
Route::post('/product/{product}/inquiry', 'ProductsController@inquiry');

Route::get('/category/{cat}', 'CategoriesController@show');

Route::get('/subcategories/{subcategory}', 'SubcategoryController@show');

Route::get('/innblastur', 'InspirationsController@index');
Route::get('/innblastur/{inspiration}', 'InspirationsController@show');

Route::get('/heimilid', 'InspirationsController@heimilid');

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
Route::get('/home/inspiration', 'HomeController@inspirations');
Route::get('/home/inspiration/{inspiration}/edit', 'HomeController@inspirationsEdit');
Route::post('/home/inspiration{inspiration}/add-inspiration-gallery-images', 'HomeController@inspirationsAddGalleryImages');
Route::patch('/home/inspiration/{inspiration}/gallery-status', 'HomeController@galleryStatus');