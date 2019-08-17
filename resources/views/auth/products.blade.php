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
                                <section class="">
                                    <h3 class="font-serif font-bold text-3xl flex justify-between items-center">
                                        Vörur
                                        <a class="font-sans uppercase text-xs bg-blue-800 font-bold text-white py-1 px-3" href="/home/add-product">
                                            <i class="fas fa-plus-circle text-white pr-2 text-sm"></i>
                                            Add product
                                        </a>
                                    </h3>
                                    <br>
                                    <table class="w-full">
                                        <thead>
                                        <tr>
                                            <th class="text-xs">ID</th>
                                            <th class="px-2 text-xs">Product</th>
                                            <th class="px-2 text-xs">Views</th>
                                            <th class="px-2 text-xs">Enable/Disable</th>
                                            <th class="px-2 text-xs">Edit</th>
                                            <th class="px-2 text-xs">Price status</th>
                                            <th class="px-2 text-xs">Delete</th>
                                        </tr>
                                        </thead>
                                        @foreach($products as $product)
                                            <tr class="border">
                                                <td class="border-r px-2 bg-gray-100">{{ $product->id }}.</td>
                                                <td class="border-r px-2 w-1/2">
                                                    <img class="inline" src="/img/products/{{ $product->image }}" alt="img" width="5%"> &nbsp;
                                                    <a href="/home/{{ $product->location }}/edit">{{ $product->headline }}</a>
                                                </td>
                                                <td class="border-r px-2 text-center">{{ $product->views }}</td>
                                                <td class="border-r px-2 text-center">
                                                    @if ($product->status == 1)
                                                        <form action="/home/{{ $product->location }}/disable" method="POST">
                                                            @csrf
                                                            @method('PATCH')
                                                            <button class="text-red-400 text-xs" type="submit">
                                                                <i class="far fa-eye-slash"></i> Disable
                                                            </button>
                                                        </form>
                                                    @else
                                                        <form action="/home/{{ $product->location }}/enable" method="POST">
                                                            @csrf
                                                            @method('PATCH')
                                                            <button class="text-green-500 text-xs" type="submit">
                                                                <i class="far fa-eye"></i> Enable
                                                            </button>
                                                        </form>
                                                    @endif
                                                </td>
                                                <td class="px-2 bg-gray-100 border-r px-2 text-center">
                                                    <a class="text-xs" href="/home/{{ $product->location }}/edit"><i class="far fa-edit"></i></a>
                                                </td>
                                                <td class="px-2 bg-gray-100 border-r px-2 text-center">
                                                    <form action="/home/{{ $product->location }}/price-status" method="POST">
                                                        @csrf
                                                        @method('PATCH')
                                                        @if ($product->price_status == 1)
                                                            <input type="hidden" value="0" name="price_status">
                                                            <button class="text-xs font-bold py-1 px-2 text-red-400 uppercase" type="submit">
                                                                <i class="far fa-eye-slash"></i>
                                                            </button>
                                                        @else
                                                            <input type="hidden" value="1" name="price_status">
                                                            <button class="text-xs font-bold py-1 px-2 text-green-500 uppercase" type="submit">
                                                                <i class="far fa-eye"></i>
                                                            </button>
                                                        @endif
                                                    </form>
                                                </td>
                                                <td class="px-2 text-center">
                                                    <form action="/home/{{ $product->location }}/destroy" method="POST">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button class="text-red-500 text-xs" type="submit">
                                                            <i class="far fa-trash-alt"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </table>
                                    <br>
                                    <p>{{ $products->links() }}</p>
                                </section>
                            </main>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection




