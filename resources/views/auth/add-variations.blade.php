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
                                <h3 class="font-serif font-bold text-3xl">Add variation</h3>
                                <hr>
                                <br>
                                <section class="p-4">
                                    <h6 class="font-serif font-bold text-xl mb-6">Current variations:</h6>
                                    <ul class="w-1/2 mr-auto">
                                        @foreach($variations as $variation)
                                            <li class="flex justify-between border-b py-2">
                                                - {{ $variation->name }} &nbsp; &nbsp;
                                                <form action="/home/add-new-variation/{{ $variation->id }}/destroy" method="POST">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit"><i class="far fa-trash-alt"></i></button>
                                                </form>
                                            </li>
                                        @endforeach
                                    </ul>
                                </section>
                                <form action="/home/add-new-variation" method="POST">
                                    @csrf
                                    <div class="form-group border p-3">
                                        <label class="text-xs font-bold uppercase" for="variation">Variation name:</label>
                                        <input class="border p-1 w-full @error('name') is-invalid @enderror" type="text" name="name" id="variation" placeholder="Variation name..">
                                    </div>
                                    <div class="form-group p-3 text-right">
                                        <button class="text-xs font-bold py-2 px-10 uppercase bg-black text-white">Add variation</button>
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





