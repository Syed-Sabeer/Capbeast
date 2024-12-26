@extends('main.layouts.master')

@section('main-container')



<section class="ecommerce-about" style="
background-image: url('../assets/images/profile-bg.jpg');
background-size: cover;
background-position: center;
">
    <div class="bg-overlay bg-primary" style="opacity: 0.85"></div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="text-center">
                    <h1 class="text-white mb-0">Products</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb breadcrumb-light justify-content-center mt-4">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                Products
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!--end col-->
        </div>
        <!--end row-->
    </div>
    <!--end container-->
</section>


<div class="position-relative section">
    <div class="container">
        <div class="ecommerce-product gap-4">
            <div class="flex-grow-1">
                <div class="d-flex align-items-center gap-2 mb-4">
                    <p class="text-muted flex-grow-1 mb-0">
                        Showing 1-12 of 84 results
                    </p>

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



                <div class="row justify-content-center">
                  @php
                      $visibleProducts = $products->filter(fn($product) => $product->visibility == 1);
                  @endphp

                  @if ($visibleProducts->isEmpty())
                      <p>No product found.</p>
                  @else
                      @foreach ($visibleProducts as $product)
                          <div class="product-card">
                              <div class="badge">HOT</div>
                              <img src="{{ '../storage/' . ($product->base_images[0] ?? 'default.jpg') }}" alt="product">
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
                      @endforeach
                  @endif
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
    </div>
    <!--end container-->
</div>

<script>
  // Get all cards
const cards = document.querySelectorAll(".product-card");

cards.forEach((card) => {
const colorSlider = card.querySelector(".color-slider");
const leftArrow = card.querySelector(".arrow.left");
const rightArrow = card.querySelector(".arrow.right");
const colorOptions = card.querySelectorAll(".color-option");
let scrollAmount = 0;

// Handle left arrow click
leftArrow.addEventListener("click", () => {
    scrollAmount -= 80;
    colorSlider.scrollTo({
        left: scrollAmount,
        behavior: "smooth",
    });
    toggleArrows();
});

// Handle right arrow click
rightArrow.addEventListener("click", () => {
    scrollAmount += 80;
    colorSlider.scrollTo({
        left: scrollAmount,
        behavior: "smooth",
    });
    toggleArrows();
});

function toggleArrows() {
    leftArrow.classList.toggle(
        "disabled",
        colorSlider.scrollLeft === 0
    );

    rightArrow.classList.toggle(
        "disabled",
        colorSlider.scrollLeft >= colorSlider.scrollWidth - colorSlider.clientWidth
    );
}

// Make color options selectable
colorOptions.forEach((color) => {
    color.addEventListener("click", () => {
        // Remove active class from all colors
        colorOptions.forEach((option) =>
            option.classList.remove("active")
        );
        // Add active class to the selected color
        color.classList.add("active");
        console.log("Selected color:", color.style.backgroundColor);
    });
});

// Initial arrow state
toggleArrows();
});

</script>

@endsection
