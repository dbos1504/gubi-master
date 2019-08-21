@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="">
                        @if (session('status'))
                            <div class="alert alert-success" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif

                        <section class="flex flex-wrap">
                            <aside class="w-1/6 bg-gray-900 p-6">
                                @include('auth.aside')
                            </aside>
                            <main class="w-10/12 p-6">
                                <form action="/home/add-product" method="POST" class="flex admin-product-form" enctype="multipart/form-data">
                                    <article class="w-3/5 mr-2">
                                        <h3 class="font-serif font-bold text-3xl">Bæta við vöru</h3>
                                        <br>
                                        @csrf
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="headline">Add Headline:</label>
                                            <input class="form-control" type="text" name="headline" id="headline">
                                        </div>
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="body">Add Description for product:</label>
                                            <textarea class="form-control" name="body" id="" cols="30" rows="10"></textarea>
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="price">Add price (111,111.00):</label>
                                            <input class="form-control" type="text" name="price" id="price">
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="currency">Add currency:</label>
                                            <select class="form-control" name="currency" id="currency">
                                                <option value="0">Choose currency...</option>
                                                <option value="KR.">KR.</option>
                                                <option value="€">€</option>
                                            </select>
                                        </div>
                                        <br><br>
                                        <h3 class="font-serif font-bold text-3xl">Optional:</h3>
                                        <hr>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="designers_id">Choose a designer (optional):</label>
                                            <select class="form-control" name="designers_id" id="designers_id">
                                                <option value="0">Choose designer...</option>
                                                @foreach($designers as $designer)
                                                    <option value="{{ $designer->id }}">{{ $designer->id }}. {{ $designer->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="collections_id">Choose if a product belong to a collection (optional):</label>
                                            <select class="form-control" name="collections_id" id="collections_id">
                                                <option value="0">Choose collection...</option>
                                                @foreach($collections as $collection)
                                                    @if ($collection->headline == 'No')

                                                        @else
                                                        <option value="{{ $collection->id }}">{{ $collection->id }}. {{ $collection->headline }}</option>
                                                    @endif
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="duplicate_category">Choose if a product belongs to another category (optional):</label>
                                            <select class="form-control" name="duplicate_category" id="duplicate_category">
                                                <option value="0">Choose category...</option>
                                                @foreach($categories as $categorie)
                                                    <option value="{{ $categorie->id }}">{{ $categorie->id }}. {{ $categorie->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <br>
                                    </article>
                                    <article class="ml-2 w-2/5">
                                        <img src="/img/admin-prod.jpg" alt="img">
                                        <hr><br>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="insp-image">Product image:</label>
                                            <div class="w-full text-center p-3">
                                                <img id="blah" src="#" alt="Choose image.." />
                                            </div>
                                            <input class="form-control" type="file" name="image" id="insp-image" onchange="readURL(this);">
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" >Product gallery (you can select multiple images):</label>
                                            <input id="files" type="file" name="images[]"  multiple/>
                                            <output id="result" />
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="insp-desc">Product image description (optional):</label>
                                            <input class="form-control" type="text" name="alt" id="insp-desc">
                                        </div>
                                        <hr>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="categories_id">Choose products category:</label>
                                            <select class="form-control" name="categories_id" id="categories_id" size="{{ count($categories) + 1 }}">
                                                <option value="0">Choose category...</option>
                                                @foreach($categories as $categorie)
                                                    <option value="{{ $categorie->id }}">{{ $categorie->id }}. {{ $categorie->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <hr>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="sub_category_id">Choose products subcategory (optional):</label>
                                            <select class="form-control" name="sub_category_id" id="sub_category_id" size="{{ count($categories) }}">
                                                <option value="0">Choose subcategory...</option>
                                                @foreach($subcategories as $subcategorie)
                                                    <option value="{{ $subcategorie->id }}">{{ $subcategorie->id }}. {{ $subcategorie->headline }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <hr>
                                        <div class="form-group text-right">
                                            <button type="submit" class="text-xs uppercase text-white bg-gray-900 font-bold py-2 px-16 border">Bæta við vöru</button>
                                            <br>
                                            <small class="text-xs">More options will be available after you add new product</small>
                                        </div>
                                    </article>
                                </form>
                            </main>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection




