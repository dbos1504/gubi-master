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
                                <h3 class="font-serif font-bold text-3xl">Inquiry for: <br><br>
                                    {{ $inquiry->products }}
                                </h3>
                                <br><br>
                                <section class="flex flex-wrap">
                                    <article class="w-1/2 pr-10">
                                        <p class="flex justify-between border-b py-2">
                                            <span class="font-medium">Name:</span>
                                            <span class="text-2xl pl-4">{{ $inquiry->firstname }}</span>
                                        </p>
                                        <p class="flex justify-between border-b py-2">
                                            <span class="font-medium">LastName:</span>
                                            <span class="text-2xl pl-4">{{ $inquiry->lastname }}</span>
                                        </p>
                                        <p class="flex justify-between border-b py-2">
                                            <span class="font-medium">Email:</span>
                                            <span class="text-2xl pl-4">{{ $inquiry->email }}</span>
                                        </p>
                                        <p class="flex justify-between border-b py-2">
                                            <span class="font-medium">Phone:</span>
                                            <span class="text-2xl pl-4">{{ $inquiry->phone }}</span>
                                        </p>
                                        <p class="flex justify-between border-b py-2">
                                            <span class="font-medium">Variation:</span>
                                            <span class="text-2xl pl-4">{{ $inquiry->variation }} - {{ $inquiry->inq }}</span>
                                        </p>
                                        <p class="flex justify-between border-b py-2">
                                            <span class="font-medium">Quantity:</span>
                                            <span class="text-2xl pl-4">{{ $inquiry->qty }}</span>
                                        </p>
                                        <p class="flex justify-between py-2">
                                            <span class="font-medium">Message:</span>
                                            <span class="text-2xl pl-4 text-right">{{ $inquiry->message }}</span>
                                        </p>
                                    </article>
                                    <article class="w-1/2 px-8">
                                        <img src="/img/products/{{ $inquiry->image }}" alt="img">
                                    </article>
                                </section>
                                <hr>
                                <p>
                                    <a class="btn text-xs bg-gray-800 text-white" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                        Reply to {{ $inquiry->firstname }}
                                    </a>
                                </p>
                                <div class="collapse" id="collapseExample">
                                    <div class="card card-body">
                                        <form action="" method="POST">
                                            <div class="form-group">
                                                <label class="uppercase text-xs font-bold" for="email">Customer Email:</label>
                                                <input class="form-control" type="email" name="email" id="email" value="{{ $inquiry->email }}">
                                            </div>
                                            <div class="form-group">
                                                <label class="uppercase text-xs font-bold" for="subject">Subject:</label>
                                                <input class="form-control" type="email" name="subject" id="subject" value="{{ $inquiry->products }} - Gubi">
                                            </div>
                                            <div class="form-group">
                                                <label class="uppercase text-xs font-bold" for="body">Message:</label>
                                                <textarea class="form-control" name="body" id="" cols="30" rows="10"></textarea>
                                            </div>
                                            <div class="form-group text-right">
                                                <button type="submit"
                                                        class="text-xs uppercase text-white bg-gray-900 font-bold py-2 px-16 border">
                                                    Send Response
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </main>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection




