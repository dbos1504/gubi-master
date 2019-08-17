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
                                <h3 class="font-serif font-bold text-3xl">Add Categories</h3>
                                <hr>
                                <br>
                                <section class="p-4 flex justify-between">
                                    <article class="w-1/2">
                                        <h6 class="font-serif font-bold text-xl mb-6">Current Categories:</h6>
                                        <ul>
                                            @foreach($categories as $categorie)
                                                <li class="border-b py-2">
                                                <span class="font-bold flex justify-between items-center border-b pb-2">
                                                - {{ $categorie->name }} &nbsp;&nbsp;
                                                     <form action="/home/add-category/{{ $categorie->location }}/categories-status"  method="POST">
                                                        @csrf
                                                         @method('PATCH')
                                                         @if ($categorie->status == 1)
                                                             <input type="hidden" value="0" name="status">
                                                             <button title="Disable" class="text-xs font-bold py-1 px-2 text-red-400 uppercase" type="submit">
                                                                <i class="far fa-eye-slash"></i>
                                                            </button>
                                                         @else
                                                             <input type="hidden" value="1" name="status">
                                                             <button title="Enable" class="text-xs font-bold py-1 px-2 text-green-500 uppercase" type="submit">
                                                                <i class="far fa-eye"></i>
                                                            </button>
                                                         @endif
                                                    </form>
                                                    <form action="/home/add-category/{{ $categorie->location }}/categories-destroy" method="POST">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button class="text-red-400 text-xs" type="submit"><i class="far fa-trash-alt"></i></button>
                                                    </form>
                                                </span>
                                                    <br>
                                                    <ul class="ml-6">
                                                        @foreach ($categorie->subcategory as $sub)
                                                            <li>- {{ $sub->headline }}</li>
                                                        @endforeach
                                                    </ul>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </article>
                                    <article class="w-1/2 p-8">
                                        <img src="/img/admin-cat.jpg" alt="img">
                                    </article>
                                </section>
                                <form action="/home/add-category" method="POST">
                                    @csrf
                                    <div class="form-group border p-3">
                                        <label class="text-xs font-bold uppercase" for="variation">Categories name:</label>
                                        <input class="border p-1 w-full" type="text" name="name" id="variation" placeholder="Category name..">
                                    </div>
                                    <div class="form-group p-3 text-right">
                                        <button class="text-xs font-bold py-2 px-10 uppercase bg-black text-white">Add categories</button>
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






