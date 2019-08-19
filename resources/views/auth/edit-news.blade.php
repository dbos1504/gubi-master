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
                                <section class="flex">
                                    <div class="w-full mr-3">
                                        <div class="border p-3 mb-3">
                                            <h4 class="font-serif font-bold text=xl">Enable/Disable News</h4>
                                            <hr>
                                            <form action="/home/news/{{ $new->location }}/status" method="POST">
                                                @csrf
                                                @method('PATCH')
                                                @if ($new->status == 1)
                                                    <div class="flex justify-between items-center">
                                                        <label>
                                                            News is <span class="text-green-500">enabled</span>
                                                        </label>
                                                        <input type="hidden" value="0" name="status">
                                                        <button class="text-xs font-bold border py-1 px-2 text-red-400 uppercase" type="submit">
                                                            <i class="far fa-eye-slash"></i> &nbsp;
                                                            Disable news
                                                        </button>
                                                    </div>
                                                @else
                                                    <div class="flex justify-between items-center">
                                                        <label>
                                                            News is <span class="text-red-400">disabled</span>
                                                        </label>
                                                        <input type="hidden" value="1" name="status">
                                                        <button class="text-xs font-bold border py-1 px-2 text-green-500 uppercase" type="submit">
                                                            <i class="far fa-eye"></i> &nbsp;
                                                            Enable news
                                                        </button>
                                                    </div>
                                                @endif
                                            </form>
                                        </div>
                                    </div>
                                    <div class="w-full mr-3">
                                        <div class="border p-3 mb-3">
                                            <h4 class="font-serif font-bold text=xl">Enable/Disable News Gallery</h4>
                                            <hr>
                                            <form action="/home/news/{{ $new->location }}/gallery-status" method="POST">
                                                @csrf
                                                @method('PATCH')
                                                @if ($new->gallery_status == 1)
                                                    <div class="flex justify-between items-center">
                                                        <label>
                                                            Gallery is <span class="text-green-500">enabled</span>
                                                        </label>
                                                        <input type="hidden" value="0" name="gallery_status">
                                                        <button class="text-xs font-bold border py-1 px-2 text-red-400 uppercase" type="submit">
                                                            <i class="far fa-eye-slash"></i> &nbsp;
                                                            Disable news gallery
                                                        </button>
                                                    </div>
                                                @else
                                                    <div class="flex justify-between items-center">
                                                        <label>
                                                            Gallery is <span class="text-red-400">disabled</span>
                                                        </label>
                                                        <input type="hidden" value="1" name="gallery_status">
                                                        <button class="text-xs font-bold border py-1 px-2 text-green-500 uppercase" type="submit">
                                                            <i class="far fa-eye"></i> &nbsp;
                                                            Enable news gallery
                                                        </button>
                                                    </div>
                                                @endif
                                            </form>
                                        </div>
                                    </div>
                                </section>
                                <form action="" method="POST" class="flex" enctype="multipart/form-data">
                                    @csrf
                                    @method('PATCH')
                                    <div class="w-3/5">
                                        <h3 class="font-serif font-bold text-3xl">Breyta - {{ $new->headline }}</h3>
                                        <hr>
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="name">Breyta Name:</label>
                                            <input class="form-control" type="text" name="name" id="name" value="{{ $new->headline }}">
                                        </div>
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="description">Breyta description:</label>
                                            <textarea class="form-control" type="text" name="description" id="description">
                                                {{ $new->description }}
                                            </textarea>
                                        </div>
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="body">Breyta body (optional):</label>
                                            <textarea class="form-control" type="text" name="body" id="body">
                                                {{ $new->body }}
                                            </textarea>
                                        </div>
                                    </div>
                                    <div class="w-2/5 px-8">
                                        <br><br>
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="image">Breyta image:</label>
                                            <img src="/img/{{ $new->image }}" alt="alt">
                                            <hr>
                                            <input type="file" name="image">
                                        </div>
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="alt">Breyta image description:</label>
                                            <input class="form-control" type="text" name="alt" id="alt" value="{{ $new->alt }}">
                                        </div>
                                        <div class="form-group text-right">
                                            <button type="submit" class="text-xs uppercase text-white bg-gray-900 font-bold py-2 px-10 border">Bæta {{ $new->name }}</button>
                                        </div>
                                    </div>
                                </form>
                                <hr>
                                <section class="admin-inspiration-gallery">
                                    <h3 class="font-serif font-bold text-3xl">News gallery</h3>
                                    <hr>
                                    <article class="flex flex-wrap">
                                        @if (count($new->images) == 0)
                                            No gallery images
                                            @else
                                            @foreach ($new->images as $img)
                                                <div class="mr-3 mb-3 w-2/12">
                                                    <img src="/img/news/{{ $img->image }}" alt="img">
                                                    <form action="" method="POST">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button class="text-red-600"><i class="far fa-trash-alt"></i></button>
                                                    </form>
                                                </div>
                                            @endforeach
                                        @endif
                                    </article>
                                    <hr>
                                    <form action="/home/news/{{ $new->location }}/add-news-gallery-images" method="POST" enctype="multipart/form-data">
                                        @csrf
                                        <label class="uppercase text-xs font-bold" for="alt">Add gallery image (you can add multiple images):</label>
                                        <input class="form-control" id="inspiration" type="file" name="image[]"  multiple/>
                                        <div>
                                            <output id="results-insp" />
                                        </div>
                                        <div class="text-right w-full border-t">
                                            <button class="uppercase mt-2 text-xs font-bold bg-gray-900 text-white py-1 px-4" type="submit">ADD gallery images</button>
                                        </div>
                                    </form>
                                </section>
                            </main>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

