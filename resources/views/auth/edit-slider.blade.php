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
                                <h3 class="font-serif font-bold text-3xl">Edit Slider</h3>
                                <hr>
                                <br>
                                <form action="/home/add-slider" method="POST" enctype="multipart/form-data">
                                    @csrf
                                    <div class="flex">
                                        <div class="form-group w-full border p-3 mr-4">
                                            <label class="text-xs font-bold uppercase" for="slider_name">Headline text (optional):</label>
                                            <input class="border p-1 w-full @error('slider_name') is-invalid @enderror"
                                                   type="text"
                                                   name="slider_name"
                                                   value="{{ $slider->slider_name }}"
                                                   id="slider_name"
                                                   placeholder="Headline text..">
                                            <small class="text-xs">( e.g BAT DINING CHAIR COLLECTION - see image )</small>
                                        </div>
                                        <div class="form-group w-full border p-3">
                                            <img src="/img/admin-slider.jpg" alt="img">
                                        </div>
                                    </div>
                                    <div class="form-group p-3 text-right">
                                        <button class="text-xs font-bold py-2 px-10 uppercase bg-black text-white">Edit Slider</button>
                                    </div>
                                </form>
                               <div class="form-group border p-3">
                                   <label class="text-xs font-bold uppercase" for="">Enable/Disable slider</label>
                                   <form action="/home/slider/{{ $slider->location }}/gallery-status" method="POST">
                                       @csrf
                                       @method('PATCH')
                                       @if ($slider->gallery_status == 1)
                                           <input type="hidden" value="0" name="gallery_status">
                                            <span>Slider is currently <span class="text-green-600">enabled</span></span> &nbsp; &nbsp;
                                           <button class="border text-xs font-bold py-1 px-2 text-red-400 uppercase" type="submit">
                                               <i class="far fa-eye-slash"></i> &nbsp;
                                               Disable
                                           </button>
                                       @else
                                           <input type="hidden" value="1" name="gallery_status">
                                           <span>Slider is currently <span class="text-red-600">disabled</span></span> &nbsp; &nbsp;
                                           <button class="border text-xs font-bold py-1 px-2 text-green-500 uppercase" type="submit">
                                               <i class="far fa-eye"></i> &nbsp;
                                               Enable
                                           </button>
                                       @endif
                                   </form>
                               </div>
                                <div class="form-group border p-3">
                                    <label class="text-xs font-bold uppercase" for="image">Current gallery images:</label>
                                    <div class="flex flex-wrap">
                                    @foreach($slider->images as $img)
                                        <div class="mr-3 mb-3 w-2/12">
                                            <img src="/img/collections/{{ $img->image }}" alt="img">
                                            <form action="/home/slider/{{ $slider->location }}/destroy-slider-gallery-images/{{ $img->id }}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                                <button class="text-red-600"><i class="far fa-trash-alt"></i></button>
                                            </form>
                                        </div>
                                    @endforeach
                                    </div>
                                </div>
                                <div class="form-group border p-3">
                                    <form action="" method="POST" enctype="multipart/form-data">
                                        <label class="text-xs font-bold uppercase" for="image">Select images for gallery (you can select multiple images):</label>
                                        <input class="form-control" id="files" type="file" name="image[]"  multiple/>
                                        <div>
                                            <output class="result-add" id="result" />
                                        </div>
                                            <div class="form-group p-3 text-right">
                                                <button class="text-xs font-bold py-2 px-10 uppercase bg-black text-white">Add slider images</button>
                                            </div>
                                    </form>
                                </div>
                            </main>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection









