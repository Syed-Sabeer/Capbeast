@extends('main.layouts.master')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="{{ asset('assetsMain/js/frontend/owl.carousel.min.js')}}"></script>
<link href="{{ asset('assetsMain/css/owl.carousel.min.css')}}" rel="stylesheet" type="text/css" />

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
                    <p class="text-muted fs-15 mb-0">
                        This ranges from women and men's outfits to children's clothing, shoes, accessories, and more. People love their clothes, and fashion isn't going anywhere!
                    </p>
                </div>
            </div>
        </div>

        <div class="row justify-content-center mt-5">
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
                    <span class="arrow left"><i class="fa-solid fa-circle-chevron-left" ></i></span>
                       <div class="color-slider" id="colorSlider{{ $product->id }}">
                           {{-- Check if colors exist before looping --}}
                           @if ($product->productColors->isNotEmpty())
                               @foreach ($product->productColors as $color)
                                   <div class="color-option" 
                                        style="background-color: {{ $color->color }};" 
                                        title="Color: {{ $color->color }}" 
                                        data-image="{{ asset('storage/' . $color->image) }}">
                                   </div>
                               @endforeach
                           @else
                               <p>No colors available</p>
                           @endif
                       </div>
                       <span class="arrow right"><i class="fa-solid fa-circle-chevron-right" ></i></span>
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

        <div class="mt-4 text-center">
            <a href="{{ route('products') }}" class="btn btn-soft-primary btn-hover">View All Products <i class="mdi mdi-arrow-right align-middle ms-1"></i></a>
        </div>
    </div>
</section>
<!-- END PRODUCT -->



<div class="container">
    <div class="row justify-content-center g-0">
        <div class="col-lg-7">
            <div class="text-center">
                <h3 class="mb-3">Our Valuable Partners</h3>
                <p class="text-muted fs-15">
                    The most common approach that peoples use to say follow me on Instagram is by sending a direct message.
                </p>
            </div>
        </div>
    </div>
</div>

<div class="logo_wrapper mt-5">
    
    <div class="container">
        <div class="owl-carousel logo_active">
            <img class="img-fluid brand-logo" src="{{ asset('img/capbeast.png')}}" alt="logo">
            {{-- <img class="img-fluid brand-logo" src="{{ asset('img/47.png')}}" alt="logo"> --}}
            
            {{-- <img class="img-fluid brand-logo" src="{{ asset('img/adidas.png')}}" alt="logo"> --}}
            <img class="img-fluid brand-logo" src="{{ asset('img/flexfit.png')}}" alt="logo">
            <img class="img-fluid brand-logo" src="{{ asset('img/oaklay.png')}}" alt="logo">
            {{-- <img class="img-fluid brand-logo" src="{{ asset('img/carhartt.png')}}" alt="logo"> --}}
            <img class="img-fluid brand-logo" src="{{ asset('img/the-north-face.png')}}" alt="logo">
            <img class="img-fluid brand-logo" src="{{ asset('img/yapoong.png')}}" alt="logo">
        </div>
    </div>
</div>


    
    
  
<!-- START INSTAGRAM -->
<section class="section pb-0">
    <div class="container">
        <div class="row justify-content-center g-0">
            <div class="col-lg-7">
                <div class="text-center">
                    <h3 class="mb-3">Follow Us In Instagram</h3>
                    <p class="text-muted fs-15">
                        The most common approach that peoples use to say follow me on Instagram is by sending a direct message.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="position-relative">
        <div class="row g-0 mt-5">
            @for ($i = 1; $i <= 6; $i++)
                <div class="col {{ $i > 2 ? 'd-none d-lg-block' : '' }}">
                    <div class="insta-img">
                        <a href="#!" class="stretched-link">
                            <img src="../assetsMain/images/ecommerce/instagram/img-{{ $i }}.png" class="img-fluid ig-img" alt />
                            <i class="ri-instagram-line"></i>
                        </a>
                    </div>
                </div>
            @endfor
        </div>

        <div class="insta-lable text-center">
            <a href="https://www.instagram.com/monkey_beanies/" class="btn btn-primary btn-hover">
                <i class="ph-instagram-logo align-middle me-1"></i>
                Follow In Instagram
            </a>
        </div>
    </div>
</section>
<!-- END INSTAGRAM -->

<script src="{{ asset('assetsMain/js/frontend/productcardcolorchange.js') }}"></script>
<script type="text/javascript">
        
    function logo_carouselInit() {
        $('.owl-carousel.logo_active').owlCarousel({
            dots: false,
            loop: true,
            margin: 30,
            stagePadding: 2,
            smartSpeed: 1000,
            autoplay: true,
            autoplayTimeout: 1500,
            autoplayHoverPause: true,
            responsive: {
                0: {
                    items: 2
                },
                576: {
                    items: 3,
                },
                768: {
                    items: 4,
                },
                992: {
                    items: 5
                }
            }
        });
    }
    logo_carouselInit();

</script>
@endsection
