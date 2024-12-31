@extends('main.layouts.master')

@section('main-container')



<section class="position-relative">
    <div class="video-container">
        <video autoplay muted loop playsinline>
            <source src="../assetsMain/videos/1.mp4" type="video/mp4" />
            Your browser does not support the video tag.
        </video>
    </div>

</section>


      <!-- START PRODUCT -->
      <section class="section pt-0 mt-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="text-center">
                        <h3 class="mb-3">Top Picks Products Of The Week</h3>
                        <p class="text-muted fs-15 mb-0">This ranges from women and men's outfits to children's clothing, shoes, accessories, and more. People love their clothes, and fashion isn't going anywhere!</p>
                    </div>
                </div>
            </div>
    
            <div class="row mt-5">
                <div class="col-lg-12">
                    <div class="text-center">
                        <ul class="list-inline categories-filter animation-nav" id="filter">
                            <li class="list-inline-item"><a class="categories active" data-filter=".arrival">New Arrival</a></li>
                        </ul>
                    </div>
    
                    <div class="row gallery-wrapper mt-4 pt-2">
                        @php
                            $visibleProducts = $products->filter(fn($product) => $product->visibility == 1);
                        @endphp
    
                        @if ($visibleProducts->isEmpty())
                            <p>No product found.</p>
                        @else
                            @foreach ($visibleProducts as $product)
                                <div class="element-item col-xxl-4 col-xl-4 col-sm-6 seller hot arrival" data-category="hot arrival">
                                    <div class="product-card">
                                        <div class="badge">HOT</div>
                                        <img src="{{ '../storage/' . ($product->base_images[0] ?? 'default.jpg') }}" alt="product" style="max-height: 215px; max-width: 100%;">
                                        <div class="color-slider-container">
                                            <span class="arrow left">&lt;</span>
                                            <div class="color-slider" id="colorSlider">
                                                @php
                                                    $colors = is_array($product->productColors->color)
                                                              ? $product->productColors->color
                                                              : json_decode($product->productColors->color ?? '[]', true);
                                                @endphp
                                                @foreach ($colors as $color)
                                                    <div class="color-option" style="background-color: {{ $color }};"></div>
                                                @endforeach
                                            </div>
                                            <span class="arrow right">&gt;</span>
                                        </div>
    
                                        <h5 class="card-title">{{ $product->title }}</h5>
                                        <div class="stars">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
    
                                        @php
                                            if ($product->productPricing && is_array($product->productPricing->pricing)) {
                                                $minPrice = (float)min($product->productPricing->pricing);
                                                $maxPrice = (float)max($product->productPricing->pricing);
                                            } else {
                                                $minPrice = 0;
                                                $maxPrice = 0;
                                            }
                                        @endphp
    
                                        <div class="price">${{ number_format($minPrice, 2) }} ~ ${{ number_format($maxPrice, 2) }}</div>
                                        <form action="{{ route('product.detail', ['id' => $product->id]) }}" method="GET">
                                            <button type="submit" class="add-to-cart-btn font-weight-bold">
                                                <i class="fa-solid fa-pen-to-square"></i> &nbsp;&nbsp;Customize
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            @endforeach
                        @endif
                    </div>
    
                    <div class="mt-4 text-center">
                        <a href="{{ route('products') }}" class="btn btn-soft-primary btn-hover">View All Products <i class="mdi mdi-arrow-right align-middle ms-1"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- END PRODUCT -->



<!-- START INSTAGRAM -->
<section class="section pb-0">
    <div class="container">
        <div class="row justify-content-center g-0">
            <div class="col-lg-7">
                <div class="text-center">
                    <h3 class="mb-3">Follow Us In Instagram</h3>
                    <p class="text-muted fs-15">
                        The most common approach that peoples use to say
                        follow me on
                        Instagram is by sending a direct message.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="position-relative">
        <div class="row g-0 mt-5">
            <div class="col">
                <div class="insta-img">
                    <a href="#!" class="stretched-link">
                        <img src="../assetsMain/images/ecommerce/instagram/img-1.jpg" class="img-fluid" alt />
                        <i class="ri-instagram-line"></i>
                    </a>
                </div>
            </div>

            <div class="col">
                <div class="insta-img">
                    <a href="#!" class="stretched-link">
                        <img src="../assetsMain/images/ecommerce/instagram/img-2.jpg" class="img-fluid" alt />
                        <i class="ri-instagram-line"></i>
                    </a>
                </div>
            </div>

            <div class="col d-none d-md-block">
                <div class="insta-img">
                    <a href="#!" class="stretched-link">
                        <img src="../assetsMain/images/ecommerce/instagram/img-3.jpg" class="img-fluid" alt />
                        <i class="ri-instagram-line"></i>
                    </a>
                </div>
            </div>

            <div class="col d-none d-md-block">
                <div class="insta-img">
                    <a href="#!" class="stretched-link">
                        <img src="../assetsMain/images/ecommerce/instagram/img-4.jpg" class="img-fluid" alt />
                        <i class="ri-instagram-line"></i>
                    </a>
                </div>
            </div>
            <div class="col d-none d-lg-block">
                <div class="insta-img">
                    <a href="#!" class="stretched-link">
                        <img src="../assetsMain/images/ecommerce/instagram/img-5.jpg" class="img-fluid" alt />
                        <i class="ri-instagram-line"></i>
                    </a>
                </div>
            </div>
            <div class="col d-none d-lg-block">
                <div class="insta-img">
                    <a href="#!" class="stretched-link">
                        <img src="../assetsMain/images/ecommerce/instagram/img-6.jpg" class="img-fluid" alt />
                        <i class="ri-instagram-line"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="insta-lable text-center">
            <a href="#!" class="btn btn-primary btn-hover">
                <i class="ph-instagram-logo align-middle me-1"></i>
                Follow In
                Instagram
            </a>
        </div>
    </div>
</section>
<!-- END INSTAGRAM -->




@endsection
