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
                                <h3 class="font-serif font-bold text-3xl">Add SubCategories</h3>
                                <hr>
                                <br>
                                <section class="p-4 flex justify-between">
                                    <article class="w-1/2">
                                        <h6 class="font-serif font-bold text-xl mb-6">Current SubCategories:</h6>
                                        <ul>
                                            @foreach($categories as $categorie)
                                                <li class="py-2">
                                                <span class="flex justify-between items-center font-bold">
                                                - {{ $categorie->name }} &nbsp
                                                </span>
                                                    <br>
                                                    <ul class="ml-6">
                                                        @foreach (\App\SubCategory::where('categories_id', $categorie->id)->get() as $sub)
                                                            <li class="flex justify-between items-center border-b py-1">
                                                                - {{ $sub->headline }}
                                                                <form action="/home/add-subcategory/{{ $sub->location }}/subcategories-status" method="POST">
                                                                    @csrf
                                                                    @method('PATCH')
                                                                    @if ($sub->status == 1)
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
                                                                <form action="/home/add-subcategory/{{ $sub->location }}/subcategories-destroy" method="POST">
                                                                    @csrf
                                                                    @method('DELETE')
                                                                    <button class="text-red-400 text-xs" type="submit"><i class="far fa-trash-alt"></i></button>
                                                                </form>
                                                            </li>
                                                        @endforeach
                                                    </ul>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </article>
                                    <article class="w-1/2 p-8">
                                        <img src="/img/admin-sub.png" alt="img">
                                    </article>
                                </section>
                                <form action="/home/add-subcategory" method="POST">
                                    @csrf
                                    <div class="form-group border p-3">
                                        <label class="text-xs font-bold uppercase" for="headline">Sub-Categories name:</label>
                                        <input class="border p-1 w-full @error('headline') is-invalid @enderror" type="text" name="headline" id="headline" placeholder="SubCategories name..">
                                        <label class="text-xs font-bold uppercase mt-6" for="categories_id">SubCategories belongs to category:</label>
                                        <select class="border p-1 w-full @error('categories_id') is-invalid @enderror" name="categories_id" id="categories_id">
                                            <option value="">Choose..</option>
                                            @foreach ($categories as $categorie)
                                                <option value="{{ $categorie->id }}">
                                                    {{ $categorie->id }}.
                                                    {{ $categorie->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group p-3 text-right">
                                        <button class="text-xs font-bold py-2 px-10 uppercase bg-black text-white">Add Subcategories</button>
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







