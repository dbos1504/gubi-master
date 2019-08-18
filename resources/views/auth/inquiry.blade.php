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
                                <h3 class="font-serif font-bold text-3xl">Inquiry</h3>
                                <br>
                                @if (count($inquiry) >= 1)
                                    <section class="admin-messages">
                                        <table class="w-full">
                                            <thead>
                                            <tr class="text-center">
                                                <th>ID</th>
                                                <th>Product</th>
                                                <th>Variation</th>
                                                <th>Qty.</th>
                                                <th>Delete</th>
                                            </tr>
                                            </thead>
                                            @foreach($inquiry as $inq)
                                                <tr class="border">
                                                    <td class="border-r px-2 text-center">{{ $inq->id }}.</td>
                                                    <td class="{{ $inq->status == 0 ? 'font-bold' : 'font-normal' }} border-r px-2 w-7/12">
                                                        <a class="text-sm" href="/home/inquiry/{{ $inq->id }}">
                                                            <img class="inline" src="/img/products/{{ $inq->image }}" alt="img" width="8%">
                                                            {{ $inq->products }}
                                                        </a>
                                                    </td>
                                                    <td class="border-r px-2 text-center">
                                                        {{ $inq->variation }} - {{ $inq->inq }}
                                                    </td>
                                                    <td class="border-r px-2 text-center">{{ $inq->qty }}</td>
                                                    <td class="px-2 text-center">

                                                        <form action="/home/inquiry/{{ $inq->id }}/destroy" method="POST">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button class="text-red-400 text-xs" type="submit"><i class="far fa-trash-alt"></i></button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </table>
                                    </section>
                                @else
                                    <h3 class="font-serif font-bold text-3xl">Það eru engin skilaboð</h3>
                                @endif

                            </main>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection



