<ul>
    <li class="border-b py-2">
        <a class="text-sm font-bold {{ \Request::route()->getName() == 'home' ? 'text-green-700' : 'text-white' }}" href="/home">
            <i class="far fa-arrow-alt-circle-down text-white pr-2 text-sm"></i>
            Dashboard
        </a>
    </li>
    <li class="border-b py-2">
        <a class="text-white text-sm font-bold" href="/home/category">
            <i class="fas fa-align-justify text-white pr-2 text-sm"></i>
            Category
        </a> <br>
        <a class="ml-4 text-sm {{ \Request::route()->getName() == 'home-add-category' ? 'text-green-700' : 'text-white' }}" href="/home/add-category">
            <i class="fas fa-plus-circle text-white pr-2 text-sm"></i>
            Add Category
        </a>
    </li>
    <li class="border-b py-2">
        <a class="text-white text-sm font-bold" href="/home/subcategory">
            <i class="fas fa-align-left text-white pr-2 text-sm"></i>
            Sub-Category
        </a> <br>
        <a class="ml-4 text-sm {{ \Request::route()->getName() == 'home-add-subcategory' ? 'text-green-700' : 'text-white' }}" href="/home/add-subcategory">
            <i class="fas fa-plus-circle text-white pr-2 text-sm"></i>
            Add SubCategory
        </a>
    </li>
    <li class="border-b py-2">
        <a class="text-sm font-bold {{ \Request::route()->getName() == 'home-products' ? 'text-green-700' : 'text-white' }}" href="/home/products">
            <i class="far fa-address-card text-white pr-2 text-sm"></i>
            Products
        </a> <br>
        <a class="ml-4 text-sm {{ \Request::route()->getName() == 'home-add-product' ? 'text-green-700' : 'text-white' }}" href="/home/add-product">
            <i class="fas fa-plus-circle text-white pr-2 text-sm"></i>
            Add Product
        </a>
        <a class="ml-4 text-sm {{ \Request::route()->getName() == 'home-add-variation' ? 'text-green-700' : 'text-white' }}" href="/home/add-variation">
            <i class="fas fa-code-branch text-white pr-2 text-sm"></i>
            Add New Variation
        </a>
    </li>
    <li class="border-b py-2">
        <a class="text-sm font-bold {{ \Request::route()->getName() == 'home-inspiration' ? 'text-green-700' : 'text-white' }}" href="/home/inspiration">
            <i class="fas fa-magic text-white pr-2 text-sm"></i>
            Inspirations
        </a> <br>
        <a class="ml-4 text-sm {{ \Request::route()->getName() == 'home-add-inspiration' ? 'text-green-700' : 'text-white' }}" href="/home/add-inspiration">
            <i class="fas fa-plus-circle text-white pr-2 text-sm"></i>
            Add Inspiration
        </a>
    </li>
    <li class="border-b py-2">
        <a class="text-white text-sm font-bold" href="/home/designer">
            <i class="fas fa-ruler-combined text-white pr-2 text-sm"></i>
            Designer
        </a> <br>
        <a class="ml-4 text-sm {{ \Request::route()->getName() == 'home-add-designer' ? 'text-green-700' : 'text-white' }}" href="/home/add-designer">
            <i class="fas fa-plus-circle text-white pr-2 text-sm"></i>
            Add Designer
        </a>
    </li>
    <li class="border-b py-2">
        <a class="text-white text-sm font-bold" href="/home/news">
            <i class="far fa-newspaper text-white pr-2 text-sm"></i>
            News
        </a> <br>
        <a class="ml-4 text-sm {{ \Request::route()->getName() == 'home-add-news' ? 'text-green-700' : 'text-white' }}" href="/home/add-news">
            <i class="fas fa-plus-circle text-white pr-2 text-sm"></i>
            Add News
        </a>
    </li>

</ul>


