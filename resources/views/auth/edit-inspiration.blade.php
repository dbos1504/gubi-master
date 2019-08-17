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
                                            <h4 class="font-serif font-bold text=xl">Enable/Disable Inspiration</h4>
                                            <hr>
                                            <form action="/home/inspiration/{{ $inspiration->location }}/status" method="POST">
                                                @csrf
                                                @method('PATCH')
                                                @if ($inspiration->status == 1)
                                                    <div class="flex justify-between items-center">
                                                        <label>
                                                            Inspiration is <span class="text-green-500">enabled</span>
                                                        </label>
                                                        <input type="hidden" value="0" name="status">
                                                        <button class="text-xs font-bold border py-1 px-2 text-red-400 uppercase" type="submit">
                                                            <i class="far fa-eye-slash"></i> &nbsp;
                                                            Disable inspiration
                                                        </button>
                                                    </div>
                                                @else
                                                    <div class="flex justify-between items-center">
                                                        <label>
                                                            Inspiration is <span class="text-red-400">disabled</span>
                                                        </label>
                                                        <input type="hidden" value="1" name="status">
                                                        <button class="text-xs font-bold border py-1 px-2 text-green-500 uppercase" type="submit">
                                                            <i class="far fa-eye"></i> &nbsp;
                                                            Enable inspiration
                                                        </button>
                                                    </div>
                                                @endif
                                            </form>
                                        </div>
                                    </div>
                                    <div class="w-full mr-3">
                                        <div class="border p-3 mb-3">
                                            <h4 class="font-serif font-bold text=xl">Enable/Disable Inspiration Gallery</h4>
                                            <hr>
                                            <form action="/home/inspiration/{{ $inspiration->location }}/gallery-status" method="POST">
                                                @csrf
                                                @method('PATCH')
                                                @if ($inspiration->gallery_status == 1)
                                                    <div class="flex justify-between items-center">
                                                        <label>
                                                            Gallery is <span class="text-green-500">enabled</span>
                                                        </label>
                                                        <input type="hidden" value="0" name="gallery_status">
                                                        <button class="text-xs font-bold border py-1 px-2 text-red-400 uppercase" type="submit">
                                                            <i class="far fa-eye-slash"></i> &nbsp;
                                                            Disable inspiration gallery
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
                                                            Enable inspiration gallery
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
                                        <h3 class="font-serif font-bold text-3xl">Breyta - {{ $inspiration->name }}</h3>
                                        <hr>
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="name">Breyta Name:</label>
                                            <input class="form-control" type="text" name="name" id="name" value="{{ $inspiration->name }}">
                                        </div>
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="description">Breyta description:</label>
                                            <textarea class="form-control" type="text" name="description" id="description">
                                                {{ $inspiration->description }}
                                            </textarea>
                                        </div>
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="body">Breyta body (optional):</label>
                                            <textarea class="form-control" type="text" name="body" id="body">
                                                {{ $inspiration->body }}
                                            </textarea>
                                        </div>
                                    </div>
                                    <div class="w-2/5 px-8">
                                        <br><br>
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="image">Breyta image:</label>
                                            <img src="/img/{{ $inspiration->image }}" alt="alt">
                                            <hr>
                                            <input type="file" name="image">
                                        </div>
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="alt">Breyta image description:</label>
                                            <input class="form-control" type="text" name="alt" id="alt" value="{{ $inspiration->alt }}">
                                        </div>
                                        <div class="form-group text-right">
                                            <button type="submit" class="text-xs uppercase text-white bg-gray-900 font-bold py-2 px-10 border">Bæta {{ $inspiration->name }}</button>
                                        </div>
                                    </div>
                                </form>
                                <hr>
                                <section class="admin-inspiration-gallery">
                                    <h3 class="font-serif font-bold text-3xl">Inspiration gallery</h3>
                                    <hr>
                                    <article class="flex">
                                        @foreach ($inspiration->images as $img)
                                            <div class="mr-3">
                                                <img src="/img/inspirations/{{ $img->image }}" alt="img">
                                                <form action="" method="POST">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button class="text-red-600"><i class="far fa-trash-alt"></i></button>
                                                </form>
                                            </div>
                                        @endforeach
                                    </article>
                                    <hr>
                                    <form action="/home/inspiration{{ $inspiration->location }}/add-inspiration-gallery-images" method="POST" enctype="multipart/form-data">
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

