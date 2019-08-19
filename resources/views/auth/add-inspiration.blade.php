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
                                <h3 class="font-serif font-bold text-3xl">Add Inspiration</h3>
                                <hr>
                                <br>
                                <form action="/home/add-inspiration" method="POST" class="flex" enctype="multipart/form-data">
                                    @csrf
                                    <div class="w-1/2">
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="name">Add Name:</label>
                                            <input class="form-control @error('name') is-invalid @enderror" type="text" name="name" id="name">
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="description">Add Description for inspiration:</label>
                                            <textarea class="form-control @error('description') is-invalid @enderror" name="description" id="" cols="30" rows="10"></textarea>
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="body">Add Body for inspiration (optional):</label>
                                            <textarea class="form-control" name="body" id="" cols="30" rows="10"></textarea>
                                        </div>
                                    </div>
                                    <div class="w-1/2 px-6">
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="insp-image">Inspiration image:</label>
                                            <div class="w-full text-center p-3">
                                                <img id="blah" src="#" alt="Choose image.." />
                                            </div>
                                            <input class="form-control" type="file" name="image" id="insp-image" onchange="readURL(this);">
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="alt">Inspiration image description:</label>
                                            <input class="form-control" type="text" name="alt" id="alt">
                                        </div>
                                        <div class="form-group text-right">
                                            <button type="submit" class="text-xs uppercase text-white bg-gray-900 font-bold py-2 px-16 border">ADD INSPIRATION</button>
                                        </div>
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






