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
                                    Designers
                                    <a class="font-sans uppercase text-xs bg-blue-800 font-bold text-white py-1 px-3" href="/home/add-designer">
                                        <i class="fas fa-plus-circle text-white pr-2 text-sm"></i>
                                        Add designer
                                    </a>
                                </h3>
                                <br>
                                <table class="w-full">
                                    <thead>
                                    <tr>
                                        <th class="text-xs">ID</th>
                                        <th class="px-2 text-xs">Designers</th>
                                        <th class="px-2 text-xs">Enable/Disable</th>
                                        <th class="px-2 text-xs">Edit</th>
                                        <th class="px-2 text-xs">Delete</th>
                                    </tr>
                                    </thead>
                                    @foreach($designers as $designer)
                                        <tr class="border">
                                            <td class="border-r px-2 bg-gray-100">{{ $designer->id }}.</td>
                                            <td class="border-r px-2 w-1/2">
                                                <img class="inline" src="/img/{{ $designer->image }}" alt="img" width="30%"> &nbsp;
                                                <a href="/home/designers/{{ $designer->location }}/edit">{{ $designer->name }}</a>
                                            </td>
                                            <td class="border-r px-2 text-center">
                                                <form action="/home/designers/{{ $designer->location }}/status" method="POST">
                                                    @csrf
                                                    @method('PATCH')
                                                    @if ($designer->status == 1)
                                                        <div class="flex justify-between items-center">
                                                            <input type="hidden" value="0" name="status">
                                                            <button class="text-xs font-bold py-1 px-2 text-red-400 uppercase" type="submit">
                                                                <i class="far fa-eye-slash"></i> &nbsp;
                                                                Disable
                                                            </button>
                                                        </div>
                                                    @else
                                                        <div class="flex justify-between items-center">
                                                            <input type="hidden" value="1" name="status">
                                                            <button class="text-xs font-bold py-1 px-2 text-green-500 uppercase" type="submit">
                                                                <i class="far fa-eye"></i> &nbsp;
                                                                Enable
                                                            </button>
                                                        </div>
                                                    @endif
                                                </form>
                                            </td>
                                            <td class="px-2 bg-gray-100 border-r px-2 text-center">
                                                <a class="text-xs" href="/home/designers/{{ $designer->location }}/edit"><i class="far fa-edit"></i></a>
                                            </td>
                                            <td class="px-2 text-center">
                                                <form action="/home/designers/{{ $designer->location }}/destroy" method="POST">
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
                            </main>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection




