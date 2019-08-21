@extends('welcome')

@section('content')
    <section class="container lg:flex lg:flex-wrap">
        <aside class="lg:w-1/4 border-t pr-6">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="navbar navbar-expand-lg navbar-light">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#cate" aria-controls="cate" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="cate">
                        @foreach($categories as $category)
                            <div class="panel panel-default border-b">
                                <div class="panel-heading" role="tab" id="heading{{ $category->id }}">
                                    <h4 class="panel-title py-3 text-base">
                                        <a data-toggle="{{ count($category->subcategory) == 0 ? 'collapse-nema' : 'collapse' }}"
                                           class="collapsed font-medium" data-parent="#accordion"
                                           href="{{ count($category->subcategory) == 0 ? '/category/'. $category->location : '#collapse' . $category->id}}"
                                           aria-expanded="true" aria-controls="collapse{{ $category->id }}">
                                            {{ $category->name }}
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse{{ $category->id }}"
                                     class="panel-collapse collapse in"
                                     role="tabpanel" aria-labelledby="heading{{ $category->id }}">
                                    <div class="panel-body text-sm">
                                        <ul>
                                            @foreach($category->subcategory as $sub)
                                                <li class="py-2">
                                                    <a href="/subcategories/{{ $sub->location }}">
                                                        {{ $sub->headline }}
                                                    </a>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </aside>
        <article class="lg:w-3/4 border-t">
            <h1 class="text-xl font-serif py-3 px-4 text-black">Search results for: "{{ $p }}"</h1>
            <section class="products lg:flex lg:flex-wrap px-4 py-2 -mr-4">
                <h2 class="w-full text-3xl text-center font-serif py-3 px-4 font-bold text-black">Sorry no matches, <br> please try again</h2>
            </section>
            <div class="text-center">{{ $products->links() }}</div>
        </article>
    </section>
@stop





