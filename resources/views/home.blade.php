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
                               <section class="flex border-b pb-8">
                                   <article class="w-1/2 px-4 py-6">
                                       <h3 class="font-bold font-serif text-2xl">Most viewed products</h3>
                                       <hr>
                                       <div class="flex flex-wrap">
                                           @foreach($products as $product)
                                               <div class="w-1/3 p-2 text-left">
                                                   <a href="/home/{{ $product->location }}/edit">
                                                        <img src="/img/products/{{ $product->image }}" alt="img">
                                                   </a>
                                                   <p class="mt-1 text-xs">{{ $product->headline }}</p>
                                                   <p class="mt-1 font-bold text-green-700"><i class="far fa-eye"></i> {{ $product->views }}</p>
                                               </div>
                                           @endforeach
                                       </div>
                                       <p class="text-right">
                                           <a class="text-xs font-bold" href="/home/products">View all</a>
                                       </p>
                                   </article>
                                   <article class="w-1/2 px-4 py-6">
                                       <h3 class="font-bold font-serif text-2xl">Latest Order inquiry</h3>
                                       <hr>
                                       @if (count($inquiry) == 0)
                                           No inquiry jet
                                       @else
                                       <table class="w-full">
                                           <thead>
                                           <tr class="text-center">
                                               <th class="text-xs">ID</th>
                                               <th class="text-xs">Product</th>
                                               <th class="text-xs">Qty</th>
                                           </tr>
                                           </thead>
                                           <tbody>
                                               @foreach ($inquiry as $inq)
                                                   <tr class="">
                                                       <td class="text-xs border p-2">{{ $inq->id }}</td>
                                                       <td class="text-base border p-2">
                                                           <a class="text-base" href="/home/inquiry/{{ $inq->id }}">
                                                               <img class="inline-block pr-1" src="/img/products/{{ $inq->image }}" alt="img" width="40">
                                                                {{ $inq->products }} -
                                                                {{ $inq->inq }} -
                                                                {{ $inq->variation }}
                                                           </a>
                                                       </td>
                                                       <td class="text-base border p-3">{{ $inq->qty }}</td>
                                                   </tr>
                                               @endforeach
                                               @endif
                                           </tbody>
                                       </table>
                                           <p class="text-right">
                                               <a class="text-xs font-bold" href="/home/inquiry">View all</a>
                                           </p>
                                   </article>
                               </section>
                                <section class="flex">
                                    <article class="w-1/2 px-4 py-6">
                                        <h3 class="font-bold font-serif text-2xl">Numbers</h3>
                                        <hr>
                                    </article>
                                    <article class="w-1/2 px-4 py-6">
                                        <h3 class="font-bold font-serif text-2xl">New messages</h3>
                                        <hr>
                                        @if (count($messages) == 0)
                                            No messages jet
                                        @else
                                            <table class="w-full">
                                                <thead>
                                                <tr class="text-center">
                                                    <th class="text-xs">ID</th>
                                                    <th class="text-xs">Email</th>
                                                    <th class="text-xs"></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                @foreach ($messages as $message)
                                                    <tr class="">
                                                        <td class="text-xs border p-2">{{ $message->id }}</td>
                                                        <td class="text-base border p-2">
                                                            <a class="text-base" href="/home/messages/{{ $message->id }}">
                                                            {{ $message->email }}
                                                            </a>
                                                        </td>
                                                        <td class="text-base border p-3">
                                                            <a class="text-xs" href="/home/messages/{{ $message->id }}">Read</a>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                                @endif
                                                </tbody>
                                            </table>
                                            <p class="text-right">
                                                <a class="text-xs font-bold" href="/home/messages">View all</a>
                                            </p>
                                    </article>
                                </section>
                            </main>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection






