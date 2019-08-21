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
                                <h3 class="font-serif font-bold text-3xl">Add Slider</h3>
                                <hr>
                                <br>
                                <form action="/home/add-slider" method="POST" enctype="multipart/form-data">
                                    @csrf
                                    <div class="flex">
                                        <div class="form-group w-full border p-3 mr-4">
                                            <label class="text-xs font-bold uppercase" for="slider_name">Headline text (optional):</label>
                                            <input class="border p-1 w-full @error('slider_name') is-invalid @enderror" type="text" name="slider_name" id="slider_name" placeholder="Headline text..">
                                            <small class="text-xs">( e.g BAT DINING CHAIR COLLECTION - see image )</small>
                                        </div>
                                        <div class="form-group w-full border p-3">
                                            <img src="/img/admin-slider.jpg" alt="img">
                                        </div>
                                    </div>
                                    <div class="form-group border p-3">
                                        <label class="text-xs font-bold uppercase" for="image">Add images for gallery (you can select multiple images):</label>
                                        <input class="form-control" id="variations" type="file" name="image[]"  multiple/>
                                        <div>
                                            <output class="result-add" id="results-var" />
                                        </div>
                                    </div>
                                    <div class="form-group p-3 text-right">
                                        <button class="text-xs font-bold py-2 px-10 uppercase bg-black text-white">Add Slider</button>
                                    </div>
                                </form>
                            </main>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection








