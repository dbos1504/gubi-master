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
                                <h3 class="font-serif font-bold text-3xl">Lestu skilaboð</h3>
                                <br>
                                @if ($message->count() >= 1)
                                    <section class="admin-messages">
                                        <p class="flex justify-between border-b py-2">
                                            <span class="font-medium">First Name:</span>
                                            <span class="text-2xl pl-4">{{ $message->firstname }}</span>
                                        </p>
                                        <p class="flex justify-between border-b py-2">
                                            <span class="font-medium">Last Name:</span>
                                            <span class="text-2xl pl-4"> {{ $message->lastname }}</span>
                                        </p>
                                        <p class="flex justify-between border-b py-2">
                                            <span class="font-medium">Email:</span>
                                            <span class="text-2xl pl-4"> {{ $message->email }}</span>
                                        </p>
                                        <p class="flex justify-between border-b py-2">
                                            <span class="font-medium">Subject:</span>
                                            <span class="text-2xl pl-4"> {{ $message->subject }}</span>
                                        </p>
                                        <p class="flex justify-between border-b py-2">
                                            <span class="font-medium">Message:</span>
                                            <span class="text-2xl pl-4 text-right"> {{ $message->message }}</span>
                                        </p>
                                        <p class="flex justify-between text-right py-2">
                                            <form action="/home/messages/{{  $message->id }}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                                <button class="text-red-400 text-xs" type="submit">
                                                    Delete
                                                    <i class="far fa-trash-alt"></i>
                                                </button>
                                            </form>
                                        </p>
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



