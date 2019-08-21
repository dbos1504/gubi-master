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
                                <h3 class="font-serif font-bold text-3xl">Hafðu samband</h3>
                                <br>
                                @if (count($messages) >=1)
                                    <section class="admin-messages">
                                        <table class="w-full">
                                            <thead>
                                            <tr>
                                                <th class="px-2">ID</th>
                                                <th class="px-2">Email</th>
                                                <th class="px-2"></th>
                                                <th class="px-2">Sent date</th>
                                                <th class="px-2">Delete</th>
                                            </tr>
                                            </thead>
                                            @foreach($messages as $message)
                                                <tr class="border">
                                                    <td class="border-r px-2">{{ $message->id }}.</td>
                                                    <td class="{{ $message->status == 0 ? 'font-bold' : 'font-normal' }} border-r px-2">
                                                        <a class="text-sm" href="/home/messages/{{ $message->id }}">
                                                            {{ $message->email }}
                                                        </a>
                                                    </td>
                                                    <td class="px-2 border-r px-2 text-center">
                                                        <a class="text-xs" href="/home/messages/{{ $message->id }}">Read</a>
                                                    </td>
                                                    <td class="border-r px-2">{{ $message->created_at->format('m/d/Y') }}.</td>
                                                    <td class="px-2 text-center">
                                                        <form action="/home/messages/{{  $message->id }}" method="POST">
                                                            @csrf
                                                            @method('DELETE')
{{--                                                            <confirm-dialog></confirm-dialog>--}}
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



