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
                                <h3 class="font-serif font-bold text-3xl flex justify-between items-center">
                                    Home page slider
                                    <a class="font-sans uppercase text-xs bg-blue-800 font-bold text-white py-1 px-3" href="/home/add-slider">
                                        <i class="fas fa-plus-circle text-white pr-2 text-sm"></i>
                                        Add slider
                                    </a>
                                </h3>
                                <hr>
                                <section class="admin-sliders">
                                    <table class="w-full">
                                        <thead>
                                        <tr>
                                            <th class="px-2">ID</th>
                                            <th class="px-2">Name</th>
                                            <th class="px-2">Enable/Disable slider</th>
                                            <th class="px-2">Edit</th>
                                        </tr>
                                        </thead>
                                        @foreach($collections as $collection)
                                            <tr class="border">
                                                <td class="border-r px-2">{{ $collection->id }}.</td>
                                                <td class="border-r px-2">
                                                    <a class="text-sm" href="/home/slider/{{ $collection->location }}">
                                                        @if ($collection->slider_name == '')
                                                            No name
                                                            @else
                                                            {{ $collection->slider_name }}
                                                        @endif
                                                    </a>
                                                </td>
                                                <td class="border-r px-2">
                                                    <form action="/home/slider/{{ $collection->location }}/gallery-status" method="POST">
                                                        @csrf
                                                        @method('PATCH')
                                                        @if ($collection->gallery_status == 1)
                                                            <input type="hidden" value="0" name="gallery_status">
                                                            <button class="text-xs font-bold py-1 px-2 text-red-400 uppercase" type="submit">
                                                                <i class="far fa-eye-slash"></i> &nbsp;
                                                                Disable
                                                            </button>
                                                        @else
                                                            <input type="hidden" value="1" name="gallery_status">
                                                            <button class="text-xs font-bold py-1 px-2 text-green-500 uppercase" type="submit">
                                                                <i class="far fa-eye"></i> &nbsp;
                                                                Enable
                                                            </button>
                                                        @endif
                                                    </form>
                                                </td>
                                                <td class="border-r px-2">
                                                    <a class="text-sm" href="/home/slider/{{ $collection->location }}">
                                                        <i class="far fa-edit"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </table>
                                </section>
                            </main>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection







