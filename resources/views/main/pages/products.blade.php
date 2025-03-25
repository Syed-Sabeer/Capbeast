@extends('main.layouts.master')


<title>Design Your Own Beanie Hat in Montreal, Canada</title>
<meta name="description"
    content="Design Your Own Beanie Hat in Montreal, Canada, with custom colors and logos. Stand out in style and comfort—Design Your Own Beanie Hat today!">
<meta name="keywords" content="Design Your Own Beanie Hat in Montreal, Design Your Own Beanie Hat in Canada">
<link rel="canonical" href="https://monkeybeanies.com/products">


@section('main-container')
    @component('main.components.breadcrumb', [
        'pageTitle' => 'Products',
        'pageRoute' => 'products',
        'imageURL' => asset('assetsMain/images/profile-bg.jpg'), // Evaluated here
    ])
    @endcomponent


    <div class="position-relative section">
        <div class="container">
            <div class="ecommerce-product gap-4">
                <div class="flex-grow-1">


                    <div class="category-container">
                        <button class="categoryarrow categoryarrow-left" onclick="scrollSlider(-200)">&#10094;</button>
                        <div class="category-slider" id="categorySlider">
                            @if($filterType === 'brand')
                                @foreach ($brands as $brand)
                                    <div class="category-card {{ request()->segment(2) == 'brand' && request()->segment(3) == Str::slug($brand->title) ? 'active' : '' }}">
                                        <a href="{{ url('products/brand/' . Str::slug($brand->title)) }}">
                                            <img src="{{ asset($brand->image ?? 'default-brand.jpg') }}" alt="{{ $brand->title }}">
                                            <p>{{ $brand->title }}</p>
                                        </a>
                                    </div>
                                @endforeach
                            @else
                                @foreach ($categories as $category)
                                    <div class="category-card {{ request()->segment(2) == 'category' && request()->segment(3) == Str::slug($category->title) ? 'active' : '' }}">
                                        <a href="{{ url('products/category/' . Str::slug($category->title)) }}">
                                            <img src="{{ asset($category->image ?? 'default-category.jpg') }}" alt="{{ $category->title }}">
                                            <p>{{ $category->title }}</p>
                                        </a>
                                    </div>
                                @endforeach
                            @endif
                        </div>
                        <button class="categoryarrow categoryarrow-right" onclick="scrollSlider(200)">&#10095;</button>
                    </div>
                    


                    <div class="row" id="pagination-element">
                        <div class="col-lg-12">
                            <div
                                class="pagination-block pagination pagination-separated justify-content-center justify-content-sm-end mb-sm-0">

                            </div>
                        </div>
                        <button class="categoryarrow categoryarrow-right" onclick="scrollSlider(200)">&#10095;</button>
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

    <div class="position-relative section">
        <div class="container">
            <div class="ecommerce-product gap-4">
                
                <div class="flex-grow-1">
                    <div class="d-flex align-items-center gap-2 mb-4">
                        <p class="text-muted flex-grow-1 mb-0">Showing 1-12 of 84 results</p>

                        <div class="flex-shrink-0">
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
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-xxl-3 col-lg-4 col-md-6">
                            <div class="card ecommerce-product-widgets border-0 rounded-0 shadow-none overflow-hidden product-card-widget">
                                <div class="bg-light bg-opacity-50 rounded py-4 position-relative">
                                    <img src="{{asset('assetsMain/images/products/img-8.png')}}" alt=""
                                        style="max-height: 200px;max-width: 100%;" class="mx-auto d-block rounded-2">
                                    <div class="action vstack gap-2">
                                        <button class="btn btn-danger avatar-xs p-0 btn-soft-warning custom-toggle product-action"
                                            data-bs-toggle="button">
                                            <span class="icon-on"><i class="ri-heart-line"></i></span>
                                            <span class="icon-off"><i class="ri-heart-fill"></i></span>
                                        </button>
                                    </div>
                                    <div class="avatar-xs label">
                                        <div class="avatar-title bg-danger rounded-circle fs-11">25%</div>
                                    </div>
                                </div>
                                <div class="pt-4">
                                    <div>
                                        <div class="color-slider-container">
                                            <span class="arrow left"><i class="fa-solid fa-circle-chevron-left"></i></span>
                                            <div class="color-slider" id="colorSlider">
        
                                                <div class="color-option" style="background-color: red;" title="Color: Red"
                                                    data-image="">
                                                </div>
                                                <div class="color-option" style="background-color: grey;" title="Color: Red"
                                                data-image="">
                                            </div>
                                            <div class="color-option" style="background-color: indigo;" title="Color: Red"
                                            data-image="">
                                        </div>
                                        <div class="color-option" style="background-color: purple;" title="Color: Red"
                                        data-image="">
                                    </div>
                                    <div class="color-option" style="background-color: brown;" title="Color: Red"
                                    data-image="">
                                </div>
                                <div class="color-option" style="background-color: pink;" title="Color: Red"
                                data-image="">
                            </div>
                            <div class="color-option" style="background-color: orange;" title="Color: Red"
                            data-image="">
                        </div>
                        <div class="color-option" style="background-color: green;" title="Color: Red"
                        data-image="">
                    </div>
                    <div class="color-option" style="background-color: yellow;" title="Color: Red"
                    data-image="">
                </div>
                <div class="color-option" style="background-color: black;" title="Color: Red"
                data-image="">
            </div>                                                
        
                                            </div>
                                            <span class="arrow right"><i class="fa-solid fa-circle-chevron-right"></i></span>
                                        </div>
            
                                        <a href="#!">
                                            <h6 class="text-capitalize fs-15 lh-base text-truncate mb-0">World's most
                                                expensive t shirt</h6>
                                        </a>
                                        <div class="mt-2">
                                            <span class="float-end">4.9 <i
                                                    class="ri-star-half-fill text-warning align-bottom"></i></span>
                                            <h5 class="text-secondary mb-0">$266.24 <span
                                                    class="text-muted fs-12"><del>$354.99</del></span></h5>
                                        </div>
                                        <div class="tn mt-3">
                                            <a href="#!" class="btn btn-primary btn-hover w-100 add-btn"> <i class="fa-solid fa-pen-to-square"></i> &nbsp;&nbsp; Customize</a>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                        </div>
                        
                    </div>


                    <div class="row" id="pagination-element">
                        <div class="col-lg-12">
                            <div
                                class="pagination-block pagination pagination-separated justify-content-center justify-content-sm-end mb-sm-0">
                                <div class="page-item">
                                    <a href="javascript:void(0);" class="page-link" id="page-prev">Previous</a>
                                </div>
                                <span id="page-num" class="pagination"></span>
                                <div class="page-item">
                                    <a href="javascript:void(0);" class="page-link" id="page-next">Next</a>
                                </div>
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
        </div><!--end container-->
    </div>

<<<<<<< HEAD
<<<<<<< HEAD
    <div class="position-relative section">
        <div class="container">
            <div class="ecommerce-product gap-4">

                <div class="flex-grow-1">
                    <div class="d-flex align-items-center gap-2 mb-4">
                        <p class="text-muted flex-grow-1 mb-0">Showing 1-12 of 84 results</p>

                        <div class="flex-shrink-0">
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
                        </div>
                    </div>


                    <div class="row">
                        @forelse ($products as $product)
                        <div class="col-xxl-3 col-lg-4 col-md-6">
                            <div
                                class="card ecommerce-product-widgets border-0 rounded-0 shadow-none overflow-hidden product-card-widget">
                                <div class="bg-light bg-opacity-50 rounded py-4 position-relative">
                                    <img src="{{ asset('storage/' . (
                                        $product->productColors->first()->front_image 
                                        ?? $product->productColors->first()->right_image 
                                        ?? $product->productColors->first()->left_image 
                                        ?? $product->productColors->first()->back_image 
                                        ?? 'ProductImages/default.jpg'
                                    )) }}" alt=""
                                        style="max-height: 200px;max-width: 100%;" class="mx-auto d-block rounded-2">
                                    <div class="action vstack gap-2">
                                        <button
                                            class="btn btn-danger avatar-xs p-0 btn-soft-warning custom-toggle product-action"
                                            data-bs-toggle="button">
                                            <span class="icon-on"><i class="ri-heart-line"></i></span>
                                            <span class="icon-off"><i class="ri-heart-fill"></i></span>
                                        </button>
                                    </div>
                                    <div class="avatar-xs label">
                                        <div class="avatar-title bg-danger rounded-circle fs-11">25%</div>
                                    </div>
                                </div>
                                <div class="pt-4">
                                    <div>
                                        <div class="color-slider-container">
                                            <span class="arrow left"><i class="fa-solid fa-circle-chevron-left"></i></span>
                                            <div class="color-slider" id="colorSlider">

                                                @if($product->productColors->isNotEmpty())
                                                @foreach($product->productColors as $color)
                                                    <div class="color-option" 
                                                        style="
                                                            
                                                            position: relative;
                                                            display: inline-block; 
                                                           
                                                            overflow: hidden;
                                                            background: {{$color->color_code_1}};">
                                                        
                                                        @if($color->color_name_2)
                                                            <div style="
                                                                content: ''; 
                                                                position: absolute; 
                                                                top: 0; 
                                                                left: 0; 
                                                                width: 100%; 
                                                                height: 100%; 
                                                                background: linear-gradient(45deg, transparent 50%, {{$color->color_code_2}} 50%);
                                                            ">
                                                            </div>
                                                        @endif
                                                    </div>
                                                @endforeach
                                            @endif
                                            

                                            
                                            
                                            
                                              

                                            </div>
                                            <span class="arrow right"><i
                                                    class="fa-solid fa-circle-chevron-right"></i></span>
                                        </div>

                                        <a href="#!">
                                            <h6 class="text-capitalize fs-15 lh-base text-truncate mb-0">{{$product->title}}</h6>
                                        </a>
                                        <div class="mt-2">
                                            <span class="float-end">4.9 <i
                                                    class="ri-star-half-fill text-warning align-bottom"></i></span>
                                            <h5 class="text-secondary mb-0">${{$product->selling_price}} <span
                                                    class="text-muted fs-12"><del>$354.99</del></span></h5>
                                        </div>
                                        <div class="tn mt-3">
                                            <a href="#!" class="btn btn-primary btn-hover w-100 add-btn"> <i
                                                    class="fa-solid fa-pen-to-square"></i> &nbsp;&nbsp; Customize</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @empty
                        <p>No products found.</p>
                    @endforelse

                    </div>


                    <div class="row" id="pagination-element">
                        <div class="col-lg-12">
                            <div
                                class="pagination-block pagination pagination-separated justify-content-center justify-content-sm-end mb-sm-0">
                                <div class="page-item">
                                    <a href="javascript:void(0);" class="page-link" id="page-prev">Previous</a>
                                </div>
                                <span id="page-num" class="pagination"></span>
                                <div class="page-item">
                                    <a href="javascript:void(0);" class="page-link" id="page-next">Next</a>
                                </div>
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
        </div><!--end container-->
    </div>



    <section class="position-relative py-5">
        <div class="container">
            <div class="row gy-4 gy-lg-0">
                <div class="col-lg-3 col-sm-6">
                    <div class="d-flex align-items-center gap-3">
                        <div class="flex-shrink-0">
                            <img src="{{ asset('assetsMain/images/ecommerce/fast-delivery.png') }}" alt=""
                                class="avatar-sm">
                        </div>
                        <div class="flex-grow-1">
                            <h5 class="fs-15">Fast &amp; Secure Delivery</h5>
                            <p class="text-muted mb-0">Tell about your service.</p>
                        </div>
                    </div>
                </div><!--end col-->
                <div class="col-lg-3 col-sm-6">
                    <div class="d-flex align-items-center gap-3">
                        <div class="flex-shrink-0">
                            <img src="{{ asset('assetsMain/images/ecommerce/returns.png') }}" alt=""
                                class="avatar-sm">
                        </div>
                        <div class="flex-grow-1">
                            <h5 class="fs-15">2 Days Return Policy</h5>
                            <p class="text-muted mb-0">No question ask.</p>
                        </div>
                    </div>
                </div><!--end col-->
                <div class="col-lg-3 col-sm-6">
                    <div class="d-flex align-items-center gap-3">
                        <div class="flex-shrink-0">
                            <img src="{{ asset('assetsMain/images/ecommerce/guarantee-certificate.png') }}" alt=""
                                class="avatar-sm">
                        </div>
                        <div class="flex-grow-1">
                            <h5 class="fs-15">Money Back Guarantee</h5>
                            <p class="text-muted mb-0">Within 5 business days</p>
                        </div>
                    </div>
                </div><!--end col-->
                <div class="col-lg-3 col-sm-6">
                    <div class="d-flex align-items-center gap-3">
                        <div class="flex-shrink-0">
                            <img src="{{ asset('assetsMain/images/ecommerce/24-hours-support.png') }}" alt=""
                                class="avatar-sm">
                        </div>
                        <div class="flex-grow-1">
                            <h5 class="fs-15">24 X 7 Service</h5>
                            <p class="text-muted mb-0">Online service for customer</p>
                        </div>
                    </div>
                </div><!--end col-->
            </div><!--end row-->
        </div><!--end container-->
    </section>


    
    <script src="{{ asset('assetsMain/js/frontend/productslider.js') }}"></script>
    <script src="{{ asset('assetsMain/js/frontend/productcardcolorchange.js') }}"></script>
    <script src="{{ asset('assetsMain/js/frontend/product-grid.init.js') }}"></script>
=======
    <section class="section bg-light bg-opacity-25" style="background-image: url('{{asset('assetsMain/images/ecommerce/bg-effect.png')}}');background-position: center; background-size: cover;">
      <div class="container">
          <div class="row align-items-center justify-content-between">
              <div class="col-lg-6">
                  <div>
                      <p class="fs-15 text-uppercase fw-medium"><span class="fw-semibold text-danger">25% Up to</span> off all Products</p>
                      <h1 class="lh-base text-capitalize mb-3">Stay home & get your daily needs from our shop</h1>
                      <p class="fs-15 mb-4 pb-2">Start You'r Daily Shopping with <a href="#!" class="link-info fw-medium">Toner</a></p>
                      <form action="#!">
                          <div class="position-relative ecommerce-subscript">
                              <input type="email" class="form-control rounded-pill" placeholder="Enter your email">
                              <button type="submit" class="btn btn-primary btn-hover rounded-pill">Subscript Now</button>
                          </div>
                      </form>
                  </div>
              </div><!--end col-->
              <div class="col-lg-4">
                  <div class="mt-4 mt-lg-0">
                      <img src="{{asset('assetsMain/images/ecommerce/subscribe.png')}}" alt="" class="img-fluid">
                  </div>
              </div><!--end col-->
          </div><!--end row-->
      </div><!--end container-->
  </section>
=======

>>>>>>> d2d5016 (working on front end for products pages)

  <section class="position-relative py-5">
      <div class="container">
          <div class="row gy-4 gy-lg-0">
              <div class="col-lg-3 col-sm-6">
                  <div class="d-flex align-items-center gap-3">
                      <div class="flex-shrink-0">
                          <img src="{{asset('assetsMain/images/ecommerce/fast-delivery.png')}}" alt="" class="avatar-sm">
                      </div>
                      <div class="flex-grow-1">
                          <h5 class="fs-15">Fast &amp; Secure Delivery</h5>
                          <p class="text-muted mb-0">Tell about your service.</p>
                      </div>
                  </div>
              </div><!--end col-->
              <div class="col-lg-3 col-sm-6">
                  <div class="d-flex align-items-center gap-3">
                      <div class="flex-shrink-0">
                          <img src="{{asset('assetsMain/images/ecommerce/returns.png')}}" alt="" class="avatar-sm">
                      </div>
                      <div class="flex-grow-1">
                          <h5 class="fs-15">2 Days Return Policy</h5>
                          <p class="text-muted mb-0">No question ask.</p>
                      </div>
                  </div>
              </div><!--end col-->
              <div class="col-lg-3 col-sm-6">
                  <div class="d-flex align-items-center gap-3">
                      <div class="flex-shrink-0">
                          <img src="{{asset('assetsMain/images/ecommerce/guarantee-certificate.png')}}" alt="" class="avatar-sm">
                      </div>
                      <div class="flex-grow-1">
                          <h5 class="fs-15">Money Back Guarantee</h5>
                          <p class="text-muted mb-0">Within 5 business days</p>
                      </div>
                  </div>
              </div><!--end col-->
              <div class="col-lg-3 col-sm-6">
                  <div class="d-flex align-items-center gap-3">
                      <div class="flex-shrink-0">
                          <img src="{{asset('assetsMain/images/ecommerce/24-hours-support.png')}}" alt="" class="avatar-sm">
                      </div>
                      <div class="flex-grow-1">
                          <h5 class="fs-15">24 X 7 Service</h5>
                          <p class="text-muted mb-0">Online service for customer</p>
                      </div>
                  </div>
              </div><!--end col-->
          </div><!--end row-->
      </div><!--end container-->
  </section>


 <script>
        const slider = document.getElementById("categorySlider");
        let autoScrollInterval;
        const cards = document.querySelectorAll(".category-card");

        // Function to scroll the slider
        function scrollSlider(amount) {
            slider.scrollBy({
                left: amount,
                behavior: "smooth"
            });
        }

        // Auto-scroll function
        function autoScroll() {
            if (!document.querySelector(".category-card.active")) {
                if (slider.scrollLeft + slider.clientWidth >= slider.scrollWidth) {
                    slider.scrollTo({
                        left: 0,
                        behavior: "smooth"
                    });
                } else {
                    slider.scrollBy({
                        left: 200,
                        behavior: "smooth"
                    });
                }
            }
        }

        // Start auto-scroll
        autoScrollInterval = setInterval(autoScroll, 4000);

        // Function to center the active card
        function centerActiveCard(card) {
            const cardRect = card.getBoundingClientRect();
            const sliderRect = slider.getBoundingClientRect();
            const offset = cardRect.left - sliderRect.left - (sliderRect.width / 2) + (cardRect.width / 2);
            slider.scrollBy({
                left: offset,
                behavior: "smooth"
            });
        }

        // Handle card selection
        cards.forEach(card => {
            card.addEventListener("click", () => {
                document.querySelector(".category-card.active")?.classList.remove("active");
                card.classList.add("active");

                // Stop auto-scroll when a card is active
                clearInterval(autoScrollInterval);

                // Center the selected card
                centerActiveCard(card);
            });
        });
    </script>

    <script src="{{ asset('assetsMain/js/frontend/productcardcolorchange.js') }}"></script>
    <!-- Product-grid init js -->
<<<<<<< HEAD
    {{-- <script src="{{ asset('assetsMain/js/frontend/product-grid.init.js') }}"></script> --}}
>>>>>>> e5cafc9 (many frontend changes)
=======
    <script src="{{ asset('assetsMain/js/frontend/product-grid.init.js') }}"></script>
>>>>>>> d2d5016 (working on front end for products pages)
@endsection
