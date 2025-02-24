@extends('main.layouts.master')


<title>Design Your Own Beanie Hat in Montreal, Canada</title>
<meta name="description" content="Design Your Own Beanie Hat in Montreal, Canada, with custom colors and logos. Stand out in style and comfort—Design Your Own Beanie Hat today!">
<meta name="keywords" content="Design Your Own Beanie Hat in Montreal, Design Your Own Beanie Hat in Canada">
<link rel="canonical" href="https://monkeybeanies.com/products">


@section('main-container')

@component('main.components.breadcrumb', [
    'pageTitle' => 'Products',
    'pageRoute' => 'products',
    'imageURL' => asset('assetsMain/images/productbreadcrumb.jpg') // Evaluated here
])
@endcomponent



<div class="position-relative section">
    <div class="container">
        <div class="ecommerce-product gap-4">
            <div class="flex-grow-1">
                <div class="d-flex align-items-center gap-2 mb-4">
                    <p class="text-muted flex-grow-1 mb-0">
                        Showing {{ $products->count() }} results
                    </p>

                    {{-- <div class="flex-shrink-0">
                        <div class="d-flex gap-2">
                            <div class="flex-shrink-0">
                                <label for="sort-elem" class="col-form-label">Sort By:</label>
                            </div>
                            <div class="flex-shrink-0">
                                <select class="form-select w-md" id="sort-elem">
                                    <option value="">All</option>
                                    <option value="low_to_high">Low to High</option>
                                    <option value="high_to_low">High to Low</option>
                                </select>
                            </div>
                        </div>
                    </div> --}}
                </div>

                <div class="row justify-content-center">
                  @foreach ($products as $product)
                      <div class="col-md-4 col-lg-3 mb-4">
                          <div class="product-card">
                              <div class="ProductCardBadge">HOT</div>
                              
                              {{-- Check if base_images exists and use default if not --}}
                              <img src="{{ asset('storage/' . ($product->productBaseImages->first()->base_image ?? 'ProductImages/default.jpg')) }}" 
                              alt="product" 
                              class="img-fluid" 
                              id="mainImage{{ $product->id }}">
                         
                              <div class="color-slider-container">
                                <span class="arrow left"><i class="fa-solid fa-circle-chevron-left"></i></span>
                                <div class="color-slider" id="colorSlider{{ $product->id }}">
                                    {{-- Check if colors exist before looping --}}
                                    @if ($product->productColors->isNotEmpty())
                                        @foreach ($product->productColors as $productColor)
                                            <div class="color-option"
                                                 style="background-color: {{ $productColor->componentColor->color_code }};"
                                                 title="Color: {{ $productColor->componentColor->color_name }}"
                                                 data-image="{{ asset('storage/' . $productColor->image) }}">
                                            </div>
                                        @endforeach
                                    @else
                                        <p>No colors available</p>
                                    @endif
                                </div>
                                <span class="arrow right"><i class="fa-solid fa-circle-chevron-right"></i></span>
                            </div>
                         
                            
                            

                              <h5 class="card-title">{{ $product->title }}</h5>
                              <div class="stars">
                                  @for ($i = 0; $i < 5; $i++)
                                      <i class="fas fa-star"></i>
                                  @endfor
                              </div>

                              {{-- Handle pricing --}}
                              {{-- @php
                                  $minPrice = $product->prices->min('price') ?? 0;
                                  $maxPrice = $product->prices->max('price') ?? 0;
                              @endphp
                              <div class="price">${{ number_format($minPrice, 2) }} ~ ${{ number_format($maxPrice, 2) }}</div> --}}

                              <form action="{{ route('product.detail', ['id' => $product->id]) }}" method="GET">
                                  <button type="submit" class="add-to-cart-btn font-weight-bold">
                                      <i class="fa-solid fa-pen-to-square"></i> &nbsp;&nbsp;Customize
                                  </button>
                              </form>
                          </div>
                      </div>
                  @endforeach
              </div>

                <div class="row" id="pagination-element">
                    <div class="col-lg-12">
                        <div class="pagination-block pagination pagination-separated justify-content-center justify-content-sm-end mb-sm-0">
                            {{-- {!! $products->links() !!} --}}
                        </div>
                    </div>
                </div>

                <div class="row d-none" id="search-result-elem">
                    <div class="col-lg-12">
                        <div class="text-center py-5">
                            <div class="avatar-lg mx-auto mb-4">
                                <div class="avatar-title bg-primary-subtle text-primary rounded-circle fs-24">
                                    <i class="bi bi-search"></i>
                                </div>
                            </div>
                            <h5>No matching records found</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="{{ asset('assetsMain/js/frontend/productcardcolorchange.js') }}"></script>

@endsection
