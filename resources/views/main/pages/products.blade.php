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

<style>



    .category-container {
        position: relative;
        width: 100%;
        max-width: 1200px;
        overflow: hidden;
        padding: 20px 0;
    }

    .category-slider {
        display: flex;
        gap: 15px;
        overflow-x: auto;
        scroll-behavior: smooth;
        padding: 15px;
        scrollbar-width: none;
    }

    .category-slider::-webkit-scrollbar {
        display: none;
    }

    .category-card {
        flex: 0 0 auto;
        width: 160px;
        height: 200px;
        background: white;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
        border-radius: 15px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        cursor: pointer;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        padding: 10px;
        border: 1px solid #ddd;
    }

    .category-card:hover {
        transform: scale(1.05);
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    }

    .category-card img {
        width: 90px;
        height: 90px;
        object-fit: cover;
        border-radius: 50%;
        margin-bottom: 10px;
        border: 3px solid #000;
    }

    .category-card p {
        margin: 0;
        font-size: 15px;
        font-weight: bold;
        color: black;
    }
    .categoryarrow {
position: absolute;
background: rgba(0, 0, 0, 0.5);
color: white;
border: none;
padding: 15px;
cursor: pointer;
font-size: 24px;
border-radius: 50%;
top: 50%;
transform: translateY(-50%);
z-index: 10;
transition: background 0.3s ease;
}

.categoryarrow:hover {
background: rgba(0, 0, 0, 0.7);
}



    .categoryarrow-left {
        left: 10px;
    }

    .categoryarrow-right {
        right: 10px;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .category-card {
            width: 130px;
            height: 160px;
        }
        .category-card img {
            width: 80px;
            height: 80px;
        }
        .categoryarrow {
            padding: 12px;
            font-size: 18px;
        }
    }

    .category-card.active {
    border: 2px solid black;
    background: #f0f0f0;
    transform: scale(1.1);
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
}

</style>

<div class="position-relative section">
    <div class="container">
        <div class="ecommerce-product gap-4">
            <div class="flex-grow-1">
              

                <div class="category-container">
                    <button class="categoryarrow categoryarrow-left" onclick="scrollSlider(-200)">&#10094;</button>
                    <div class="category-slider" id="categorySlider">
                        <div class="category-card">
                            <img src="https://source.unsplash.com/150x150/?cap" alt="Caps">
                            <p>Caps</p>
                        </div>
                        <div class="category-card">
                            <img src="https://source.unsplash.com/150x150/?beanie" alt="Beanies">
                            <p>Beanies</p>
                        </div>
                        <div class="category-card">
                            <img src="https://source.unsplash.com/150x150/?shoes" alt="Shoes">
                            <p>Shoes</p>
                        </div>
                        <div class="category-card">
                            <img src="https://source.unsplash.com/150x150/?jacket" alt="Jackets">
                            <p>Jackets</p>
                        </div>
                        <div class="category-card">
                            <img src="https://source.unsplash.com/150x150/?watch" alt="Watches">
                            <p>Watches</p>
                        </div>
                         <div class="category-card">
                            <img src="https://source.unsplash.com/150x150/?shoes" alt="Shoes">
                            <p>Shoes</p>
                        </div>
                        <div class="category-card">
                            <img src="https://source.unsplash.com/150x150/?jacket" alt="Jackets">
                            <p>Jackets</p>
                        </div>
                        <div class="category-card">
                            <img src="https://source.unsplash.com/150x150/?watch" alt="Watches">
                            <p>Watches</p>
                        </div>
                        <div class="category-card">
                            <img src="https://source.unsplash.com/150x150/?glasses" alt="Glasses">
                            <p>Glasses</p>
                        </div>
                    </div>
                    <button class="categoryarrow categoryarrow-right" onclick="scrollSlider(200)">&#10095;</button>
                </div>
                

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
               
                      <div class="col-md-4 col-lg-3 mb-4">
                          <div class="product-card">
                              <div class="ProductCardBadge">HOT</div>
                              
                              {{-- Check if base_images exists and use default if not --}}
                              <img src="" 
                              alt="product" 
                              class="img-fluid" 
                              id="mainImage">
                         
                              <div class="color-slider-container">
                                <span class="arrow left"><i class="fa-solid fa-circle-chevron-left"></i></span>
                                <div class="color-slider" id="colorSlider">
                                    
                                            <div class="color-option"
                                                 style="background-color: red;"
                                                 title="Color: Red"
                                                 data-image="">
                                            </div>
                                        
                                </div>
                                <span class="arrow right"><i class="fa-solid fa-circle-chevron-right"></i></span>
                            </div>
                         
                            
                            

                              <h5 class="card-title">JDKDJKJKD</h5>
                              <div class="stars mb-4">
                                  @for ($i = 0; $i < 5; $i++)
                                      <i class="fas fa-star"></i>
                                  @endfor
                              </div>

                            
                            <a href="" class="add-to-cart-btn font-weight-bold" style="margin-top: 5% !important; padding-right: 40px; padding-left:40px;">
                                <i class="fa-solid fa-pen-to-square"></i> &nbsp;&nbsp;Customize
                            </a>
                            
                          </div>
                      </div>

                      <div class="col-md-4 col-lg-3 mb-4">
                        <div class="product-card">
                            <div class="ProductCardBadge">HOT</div>
                            
                            {{-- Check if base_images exists and use default if not --}}
                            <img src="" 
                            alt="product" 
                            class="img-fluid" 
                            id="mainImage">
                       
                            <div class="color-slider-container">
                              <span class="arrow left"><i class="fa-solid fa-circle-chevron-left"></i></span>
                              <div class="color-slider" id="colorSlider">
                                  
                                          <div class="color-option"
                                               style="background-color: red;"
                                               title="Color: Red"
                                               data-image="">
                                          </div>
                                      
                              </div>
                              <span class="arrow right"><i class="fa-solid fa-circle-chevron-right"></i></span>
                          </div>
                       
                          
                          

                            <h5 class="card-title">JDKDJKJKD</h5>
                            <div class="stars mb-4">
                                @for ($i = 0; $i < 5; $i++)
                                    <i class="fas fa-star"></i>
                                @endfor
                            </div>

                          
                          <a href="" class="add-to-cart-btn font-weight-bold" style="margin-top: 5% !important; padding-right: 40px; padding-left:40px;">
                              <i class="fa-solid fa-pen-to-square"></i> &nbsp;&nbsp;Customize
                          </a>
                          
                        </div>
                    </div>


                    <div class="col-md-4 col-lg-3 mb-4">
                        <div class="product-card">
                            <div class="ProductCardBadge">HOT</div>
                            
                            {{-- Check if base_images exists and use default if not --}}
                            <img src="" 
                            alt="product" 
                            class="img-fluid" 
                            id="mainImage">
                       
                            <div class="color-slider-container">
                              <span class="arrow left"><i class="fa-solid fa-circle-chevron-left"></i></span>
                              <div class="color-slider" id="colorSlider">
                                  
                                          <div class="color-option"
                                               style="background-color: red;"
                                               title="Color: Red"
                                               data-image="">
                                          </div>
                                      
                              </div>
                              <span class="arrow right"><i class="fa-solid fa-circle-chevron-right"></i></span>
                          </div>
                       
                          
                          

                            <h5 class="card-title">JDKDJKJKD</h5>
                            <div class="stars mb-4">
                                @for ($i = 0; $i < 5; $i++)
                                    <i class="fas fa-star"></i>
                                @endfor
                            </div>

                          
                          <a href="" class="add-to-cart-btn font-weight-bold" style="margin-top: 5% !important; padding-right: 40px; padding-left:40px;">
                              <i class="fa-solid fa-pen-to-square"></i> &nbsp;&nbsp;Customize
                          </a>
                          
                        </div>
                    </div>

                    <div class="col-md-4 col-lg-3 mb-4">
                        <div class="product-card">
                            <div class="ProductCardBadge">HOT</div>
                            
                            {{-- Check if base_images exists and use default if not --}}
                            <img src="" 
                            alt="product" 
                            class="img-fluid" 
                            id="mainImage">
                       
                            <div class="color-slider-container">
                              <span class="arrow left"><i class="fa-solid fa-circle-chevron-left"></i></span>
                              <div class="color-slider" id="colorSlider">
                                  
                                          <div class="color-option"
                                               style="background-color: red;"
                                               title="Color: Red"
                                               data-image="">
                                          </div>
                                      
                              </div>
                              <span class="arrow right"><i class="fa-solid fa-circle-chevron-right"></i></span>
                          </div>
                       
                          
                          

                            <h5 class="card-title">JDKDJKJKD</h5>
                            <div class="stars mb-4">
                                @for ($i = 0; $i < 5; $i++)
                                    <i class="fas fa-star"></i>
                                @endfor
                            </div>

                          
                          <a href="" class="add-to-cart-btn font-weight-bold" style="margin-top: 5% !important; padding-right: 40px; padding-left:40px;">
                              <i class="fa-solid fa-pen-to-square"></i> &nbsp;&nbsp;Customize
                          </a>
                          
                        </div>
                    </div>
               
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


<script>
      const slider = document.getElementById("categorySlider");
let autoScrollInterval;
const cards = document.querySelectorAll(".category-card");

// Function to scroll the slider
function scrollSlider(amount) {
    slider.scrollBy({ left: amount, behavior: "smooth" });
}

// Auto-scroll function
function autoScroll() {
    if (!document.querySelector(".category-card.active")) {
        if (slider.scrollLeft + slider.clientWidth >= slider.scrollWidth) {
            slider.scrollTo({ left: 0, behavior: "smooth" });
        } else {
            slider.scrollBy({ left: 200, behavior: "smooth" });
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
    slider.scrollBy({ left: offset, behavior: "smooth" });
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
@endsection
