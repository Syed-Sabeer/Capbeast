@extends('main.layouts.master')

@section('main-container')




<section class="ecommerce-about" style="
background-image: url('{{ asset('assetsMain/images/profile-bg.jpg') }}');
background-size: cover;
background-position: center;
">
<div class="bg-overlay bg-primary-about" style="opacity: 0.7"></div>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="text-center">
                <h1 class="text-white mb-0">Product Details</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-light justify-content-center mt-4">
                        <li class="breadcrumb-item"><a href="#">Product</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                          <a href="{{ route('product.detail', ['id' => $product->id]) }}">
                          {{ $product->title }}
                          </a>
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
</section>

<section class="section pt-0 pb-0">
    <h4 class="lh-base mb-1 p-3 mt-3" style="font-size: 2rem; color: #F7B708; background-color: rgba(247, 183, 8, 0.1); text-align: center">
        {{ $product->title }}
    </h4>
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-12">

            <ul class="nav nav-tabs nav-tabs-custom mb-3" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-bs-toggle="tab" href="#pricechart" role="tab">
                        Price Chart
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" href="#home1" role="tab">
                        Description
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" href="#profile1" role="tab">
                        Ratings & Reviews
                    </a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content text-muted">
                <div class="tab-pane active" id="pricechart" role="tabpanel">
                    <table class="table fs-15 align-middle table-nowrap mt-4">
                        <thead>
                            <tr>
                                <th scope="col">Qty</th>
                                @foreach($quantities as $quantity)
                                    <th scope="col" class="text-align-center" data-quantity="{{ $quantity }}">{{ $quantity }}</th>
                                @endforeach
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <a href="#" class="text-body">Price</a>
                                </td>
                                @foreach($prices as $price)
                                <td class="fw-medium text-align-center" data-price="{{ $price }}" id="pricing-{{ $price }}" >
                                    ${{ number_format($price, 2) }}
                                </td>
                            @endforeach
                            </tr>
                        </tbody>
                    </table>

                </div>

                <div class="tab-pane" id="home1" role="tabpanel">


                    <p class=" fs-15">
                        {{ $product->description }}
                    </p>
                </div>
              
            </div>
        </div>
        <!--end col-->
    </div>
    <!--end row-->
</div>
</section>

<section class="section" >
<div class="container">
            <div class="row gx-2">
                <div class="slider-container mt-3">
                    <button class="ProductSliderArrow left" onclick="changeSlide(-1)">&lt;</button>
                    
                    <!-- Display main product image (first base image) -->
                    <img src="{{ asset('storage/' . ($product->productBaseImages->first()->base_image ?? 'placeholder.png')) }}" 
                        alt="Main Product" class="main-image" id="mainImage">
                    
                    <button class="ProductSliderArrow right" onclick="changeSlide(1)">&gt;</button>
                
                    <div class="thumbnail-container">
                        <!-- Display all product base images as thumbnails -->
                        @foreach($product->productBaseImages as $image)
                            <img src="{{ asset('storage/' . $image->base_image) }}" 
                                alt="Product Thumbnail" 
                                class="thumbnail {{ $loop->first ? 'active' : '' }}" 
                                onclick="changeImage(this)">
                        @endforeach
                        
                        <!-- Display color-related images if available -->
                        @if($product->productColors && $product->productColors->isNotEmpty())
                        @foreach($product->productColors as $color)
                            <img src="{{ asset('storage/' . $color->image) }}" 
                                 alt="Color Thumbnail" 
                                 class="thumbnail" 
                                 onclick="changeImage(this)">
                        @endforeach
                    @endif                    
                    
                    </div>
            </div>
            
              
             
              
        
        <!--end col-->
        <div class="col-lg-8 ms-auto">

            <div class="container">
                <div class="customization-section bg-white border border-light" id="customization-section">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <!-- Step 1 on the left -->
                        <div class="d-flex align-items-center">
                            <div class="step me-3">
                                <strong>STEP 1</strong>
                            </div>
                            <h2 class="h4 mb-0">Enter Quantity</h2>
                        </div>

                        <!-- Total quantity and price on the right -->
                        <div class="price-details">
                            Total Qty: <span id="total-qty">0</span> | Price: <span id="total-price">$0.00</span>
                        </div>
                    </div>


                    <div>
                        <input 
                            type="number"
                            id="quantity-input"
                            placeholder="Qty"
                            class="form-control"
                            min="0"
                        >
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="customization-section bg-white border border-light">
                  <!-- Header -->
                  <div class="d-flex justify-content-between align-items-center mb-3">
                    <!-- Step 2 on the left -->
                    <div class="d-flex align-items-center">
                        <div class="step me-3">
                            <strong>STEP 2</strong>
                        </div>
                        <h2 class="h4 mb-0">Customization</h2>
                    </div>

                    <!-- Total quantity and price on the right -->
                    <div class="price-details">
                        Total Qty: <span id="total-qty2">0</span> | Price: <span id="total-price2">$0.00</span>
                    </div>
                </div>


                  <!-- Dropdown Section -->
                  <div class="form-group">
                    <label for="beanie-color" class="section-header">Select Beanies Color</label>
                    <select id="beanie-color" class="form-control">
                        <option>Select Beanies Color</option>
                        <option value="all">All Colors</option>
                        @if(!empty($colorNames))
                            @foreach($colorNames as $colorName)
                                <option value="{{ strtolower($colorName) }}">{{ ucfirst($colorName) }}</option>
                            @endforeach
                        @else
                            <option>No colors available</option>
                        @endif
                    </select>

                    <label for="beanie-color" class="section-header mt-4">Select Beanies Type</label>
<div class="d-flex " style="justify-content: space-between">
                    <div>
                      <input type="radio" id="beanie1" name="beanie" value="beanie1">
                      <label for="beanie1">
                        <img src="{{ asset('assetsCommon/images/flipbeanie.jpg') }}" alt="Beanie Type 1" style="width: 150px; height: auto;"> Flipped Beanies
                      </label>
                    </div>
                    
                    <div>
                      <input type="radio" id="beanie2" name="beanie" value="beanie2">
                      <label for="beanie2">
                        <img src="{{ asset('assetsCommon/images/unflipbeanie.png') }}" alt="Beanie Type 2" style="width: 150px; height: auto;"> UnFlipped Beanies
                      </label>
                    </div>
                    
                </div>




  <div class="section-header mt-4">
      Select Printing Option
  </div>

  <div class="printing-options">
      @if($productPrintings->isNotEmpty())
          @foreach($productPrintings as $printing)
              <div class="option-card printing-option"
                   data-id="{{ $printing->id }}"
                   data-title="{{ $printing->title }}"
                   data-quantities="{{ json_encode($printing->quantity) }}"
                   data-prices="{{ json_encode($printing->price) }}">
                  <img src="{{ asset('storage/' . $printing->image) }} " alt="{{ $printing->title }}">
                  <h3>{{ $printing->title }}</h3>
              </div>
          @endforeach
      @else
          <p>No printing options available.</p>
      @endif
  </div>





                      <div class="container my-5" id="artwork-upload">
                        <h2 class="text-center mb-4">Upload Your Artwork</h2>

                     <!-- Artwork Type -->
<div class="mb-3">
    <label for="artworkType" class="form-label fw-bold">Artwork Type</label>
    <select id="artworkType" class="form-select">
        <option value="upload">Upload my Artwork</option>
        <option value="message">Enter Your Message</option>
    </select>
</div>

<!-- File Upload -->
<div class="mb-3" id="fileUploadContainer">
    <label for="fileUpload" class="form-label fw-bold">Browse Files To Upload</label>
    <input type="file" id="fileUpload" class="form-control">
    <div class="form-text">
        File Accepted: JPEG, JPG, GIF, PNG, EPS, PDF, PSD, AI, BMP, TIF, TIFF<br>
        <strong>Preferred File Type for Better Quality Product:</strong> AI, EPS, PSD, PDF
    </div>
</div>

<!-- Message Input -->
<div class="mb-3" id="messageInputContainer" style="display: none;">
    <label for="messageInput" class="form-label fw-bold">Enter Your Message</label>
    <input type="text" id="messageInput" class="form-control" placeholder="Type your message here">
</div>

<script>
    document.getElementById('artworkType').addEventListener('change', function () {
        const fileUploadContainer = document.getElementById('fileUploadContainer');
        const messageInputContainer = document.getElementById('messageInputContainer');
        
        if (this.value === 'upload') {
            fileUploadContainer.style.display = 'block';
            messageInputContainer.style.display = 'none';
        } else if (this.value === 'message') {
            fileUploadContainer.style.display = 'none';
            messageInputContainer.style.display = 'block';
        }
    });
</script>


                       <!-- Patch Dimensions -->
<div class="row mb-3">
    <div class="col-md-6">
        <label for="patchLength" class="form-label fw-bold">Patch Length</label>
        <input type="text" id="patchLength" class="form-control" placeholder="Patch Length">
        <small class="form-text text-muted">Min Length - 1", Max Length - 4"</small>
        <div id="patchLengthError" style="color: red; display: none;">Length must be between 1 and 4 inches.</div>
    </div>
    <div class="col-md-6">
        <label for="patchHeight" class="form-label fw-bold">Patch Height</label>
        <input type="text" id="patchHeight" class="form-control" placeholder="Patch Height">
        <small class="form-text text-muted">Max Height - 2.5"</small>
        <div id="patchHeightError" style="color: red; display: none;">Height cannot exceed 2.5 inches.</div>
    </div>
</div>

<script>
    document.getElementById('patchLength').addEventListener('input', function () {
        const patchLength = parseFloat(this.value);
        const errorElement = document.getElementById('patchLengthError');
        if (isNaN(patchLength) || patchLength < 1 || patchLength > 4) {
            errorElement.style.display = 'block';
        } else {
            errorElement.style.display = 'none';
        }
    });

    document.getElementById('patchHeight').addEventListener('input', function () {
        const patchHeight = parseFloat(this.value);
        const errorElement = document.getElementById('patchHeightError');
        if (isNaN(patchHeight) || patchHeight > 2.5) {
            errorElement.style.display = 'block';
        } else {
            errorElement.style.display = 'none';
        }
    });
</script>

                        

                        <!-- Font Style -->
                        <div class="mb-3">
                            <label for="fontStyle" class="form-label fw-bold">Select Font Style</label>
                            <select id="fontStyle" class="form-select">
                                <option value="arial">Arial</option>
                                <option value="times">Times New Roman</option>
                                <option value="courier">Courier New</option>
                            </select>
                        </div>

                        <!-- Imprint Colors -->
                        <div class="mb-3">
                            <label for="imprintColors" class="form-label fw-bold">Select Number Of Imprint Colors</label>
                            <select id="imprintColors" class="form-select">
                                <option value="0">Full Color Imprint</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>
                        </div>
                        
                        <div id="additionalDropdowns"></div>
                        
                        <script>
                            const imprintColors = document.getElementById('imprintColors');
                            const additionalDropdowns = document.getElementById('additionalDropdowns');
                        
                            imprintColors.addEventListener('change', function() {
                                const numColors = parseInt(imprintColors.value);
                                additionalDropdowns.innerHTML = ''; // Clear previous dropdowns
                        
                                if (numColors !== 0) { // Exclude Full Color Imprint (value = 0)
                                    for (let i = 1; i <= numColors; i++) {
                                        const newSelect = document.createElement('div');
                                        newSelect.classList.add('mb-3');
                                        newSelect.innerHTML = `
                                            <label for="color${i}" class="form-label fw-bold">Select Color ${i}</label>
                                            <select id="color${i}" class="form-select">
                                                <option value="color${i}">Color ${i}</option>
                                            </select>
                                        `;
                                        additionalDropdowns.appendChild(newSelect);
                                    }
                                }
                            });
                        </script>
                        
                        

                  </div>
                </div>
              </div>





                </div>


                <div class="container">
                  <div class="customization-section bg-white border border-light">

                      <div class="d-flex justify-content-between align-items-center mb-3">
                          <div class="step">
                              STEP 3
                          </div>
                          <h2 class="h4 mb-0 ml-2">Shipping</h2>
                          <div class="price-details">
                              Total Qty: <span id="total-qty3"></span> | Price: <span id="total-price3">$168.12</span>
                          </div>
                      </div>
                      <div class="radio-options">
                          <label>
                              <input type="radio" name="shippingOption" value="pickYourself" checked onchange="toggleOptions()"> Pick Yourself
                          </label>
                          <label>
                              <input type="radio" name="shippingOption" value="viewBundle" onchange="toggleOptions()"> View Shipping Bundle
                          </label>
                      </div>
                      <div id="pickYourselfBox" class="option-box">
                          <ul class="dselects">
                              <li>
                                  <span class="check">

                                      <i class="fa-solid fa-truck"></i>
                                  </span>
                                  <div class="delivery_date w3_bg">Pick Yourself


                                  </div>
                                  <div class="delivery_price w3_bg">
                                      <span class="delivery_price_number text-danger"
                                          style="font-weight:700">FREE</span>
                                  </div>
                              </li>
                                  </ul>
                      </div>
                      <div id="viewBundleBox" class="option-box" style="display: none;">

                        @if ($latestProductDelivery)

                        <ul class="dselects">
                            @php
                                $quantitiesdelivery = json_decode($latestProductDelivery->quantity, true);
                                $pricesDelivery = json_decode($latestProductDelivery->pricing, true);
                            @endphp

                            @if ($quantitiesdelivery && $pricesDelivery && count($quantitiesdelivery) === count($pricesDelivery))
                                @foreach ($quantitiesdelivery as $index => $quantitydelivery)
                                    <li>
                                        <span class="check"><i class="fa-solid fa-truck"></i></span>
                                        <div class="delivery_date w3_bg">Qty: {{ $quantitydelivery }}</div>
                                        <div class="delivery_price w3_bg">Price: ${{ number_format($pricesDelivery[$index], 2) }}</div>
                                    </li>
                                @endforeach
                            @else
                                <li>
                                    <div class="delivery_date w3_bg">Data mismatch or incomplete</div>
                                </li>
                            @endif
                        </ul>
                    @else
                        <p>No delivery records found.</p>
                    @endif

                      </div>





                      <div class="col-md-12 content-outer delivery-outer-box review-order-detail mt-2 w3_bg">
                          <div class="review_order w3_bg">
                              <div class="order_details_review order-detail w3_bg">
                                  <div class="row w3_bg">
                                      <div class="col-md-5 my-1 col-4 pr-0 px-md-1 w3_bg">
                                          <p class="order-overview-selected-product"> Product:</p>
                                          <p></p>
                                      </div>
                                      <div class="col-md-7 col-8 my-1 pr-0 pr-md-1 w3_bg">
                                          <p><span class="s3-total-product-name">  {{ $product->title }}</span>
                                          </p>
                                      </div>
                                      <div class="col-md-5 my-1 col-4 pr-0 px-md-1 w3_bg">
                                          <p> Total Quantity: </p>
                                      </div>
                                      <div class="col-md-7 col-8 my-1 pr-0 pr-md-1 w3_bg">
                                          <p><span class="s3-total-qty">12</span><span
                                                  class="get_free_offer_qty text-warning text_theme_color"></span><span
                                                  class="amount" style="display: none;"></span></p>
                                      </div>
                                      <div style="display:none"
                                          class="s3-increment-on-total-parent col-md-5 my-1 col-4 pr-0 px-md-1 w3_bg">
                                          <p> Setup Charge: </p>
                                          <p></p>
                                      </div>
                                      <div style="display:none"
                                          class="s3-increment-on-total-parent col-md-7 col-8 my-1 pr-0 pr-md-1 w3_bg">
                                          <p><span class="dollar_sign">$</span><span
                                                  class="amount s3-increment-on-total">0.00</span><span
                                                  class="dollar_sign"></span></p>
                                      </div>
                                      <div class="col-md-5 my-1 col-4 pr-0 px-md-1 w3_bg">
                                        <p> Amount Calculaion: </p>
                                        <p></p>
                                    </div>
                                    <div class="col-md-7 col-8 my-1 pr-0 pr-md-1 w3_bg">
                                        <p><span class="amount s3-total-price">Product Price: &nbsp;</span>
                                          <span class="dollar_sign">$</span><span id="product_price">2430.32</span></p>

                                          <p><span class="amount s3-total-price">Customization: &nbsp;</span>
                                            <span class="dollar_sign">$</span><span id="customization_price">2430.32</span></p>


                                          <p><span class="amount s3-total-price">Delivery Price: &nbsp;</span>
                                            <span class="dollar_sign">$</span><span id="delivery_price">2430.32</span></p>

                                    </div>
                                      <div class="col-md-5 my-1 col-4 pr-0 px-md-1 w3_bg">
                                          <p> Total Amount: </p>
                                          <p></p>
                                      </div>
                                      <div class="col-md-7 col-8 my-1 pr-0 pr-md-1 w3_bg">
                                          <p><span class="dollar_sign">$</span><span
                                                  class="amount s3-total-price">130.32</span><span
                                                  class="dollar_sign"></span> (All Inclusive)</p>
                                      </div>


                                  </div>


                                  <div class="form-group w3_bg" id="other_reason_div" style="display: none">
                                      <div class="text-left mb-1 mt-3 w3_bg">
                                          <input type="text" class="form-control" name="other_reason"
                                              onchange="selectOrderFor(this,'input')" id="other_reason"
                                              placeholder="Enter details...." value="">
                                      </div>
                                  </div>

                              </div>
                          </div>
                          <input type="radio" class="d-none" name="product_id" checked="" value="716">
                          <input type="hidden" name="action" value="addToCart">
                          <input type="hidden" name="sample" value="true" class="d-none smp-contents">
                          <div class="order-button-box w3_bg">
                              <div class="order-button-payment text-center w3_bg">
                                <button type="button" class="btn btn-success btnAddToCart" aria-hidden="true">
                                    <svg style="margin-right: 10px; margin-bottom: 5px;" width="23" height="22"
                                         viewBox="0 0 23 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M1 1H4.81818L7.37636 13.7524C7.46365 14.1909 7.70273 14.5847 8.05175 14.865C8.40077 15.1454 8.83748 15.2943 9.28545 15.2857H18.5636C19.0116 15.2943 19.4483 15.1454 19.7973 14.865C20.1464 14.5847 20.3854 14.1909 20.4727 13.7524L22 5.7619H5.77273M9.59091 20.0476C9.59091 20.5736 9.16354 21 8.63636 21C8.10918 21 7.68182 20.5736 7.68182 20.0476C7.68182 19.5216 8.10918 19.0952 8.63636 19.0952C9.16354 19.0952 9.59091 19.5216 9.59091 20.0476ZM20.0909 20.0476C20.0909 20.5736 19.6635 21 19.1364 21C18.6092 21 18.1818 20.5736 18.1818 20.0476C18.1818 19.5216 18.6092 19.0952 19.1364 19.0952C19.6635 19.0952 20.0909 19.5216 20.0909 20.0476Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                    Add To Cart
                                </button>
                                
                                  <div class="cartLoad ximgLoading w3_bg" style="display:none;"><img
                                          data-class="LazyLoad" src="https://www.imprintnow.ca/cache/blank.png"
                                          data-src="https://d3ngdnua5h1yvk.cloudfront.net/images/mload.gif"></div>
                              </div>
                          </div>
                      </div>

                  </div>
                  </div>





            </div>
        </div>
        <!--end col-->





    </div>
    <!--end row-->
</div>
<!--end container-->
</section>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const quantityInput = document.getElementById("quantity-input");
        const totalQty = document.getElementById("total-qty");
        const totalQtyCustomization = document.getElementById("total-qty2");
        const totalQtyDelivery = document.getElementById("total-qty3");
        const totalPrice = document.getElementById("total-price");
        const totalPriceCustomization = document.getElementById("total-price2");
        const totalPriceDelivery = document.getElementById("total-price3");
        const printingOptions = document.querySelectorAll(".printing-option");
        const shippingOptions = document.querySelectorAll('input[name="shippingOption"]');
        const pickYourselfBox = document.getElementById('pickYourselfBox');
        const viewBundleBox = document.getElementById('viewBundleBox');
        const artworkSelection = document.getElementById("artwork-upload");

        let selectedPrintingPrice = 0;
        let selectedPrintingQuantities = [];
        let pricesForSelectedPrinting = [];

        // Quantities and prices from server (ensure they are numbers)
        const quantities = @json($quantities).map(Number);
        const prices = @json($prices).map(Number);
        const quantitiesDelivery = @json($quantitiesdelivery).map(Number); // Pass quantitiesdelivery here
        const pricesDelivery = @json($pricesDelivery).map(Number); // Pass pricesDelivery here

        // Handle printing option selection
        printingOptions.forEach(option => {
            option.addEventListener("click", function () {
                printingOptions.forEach(opt => opt.classList.remove("active"));
                this.classList.add("active");

                try {
                    selectedPrintingQuantities = JSON.parse(this.dataset.quantities).map(Number);
                    pricesForSelectedPrinting = JSON.parse(this.dataset.prices).map(Number);
                    updatePrintingPriceAndTotal();
                } catch (error) {
                    console.error("Error parsing quantities or prices data:", error);
                }
            });
        });

        // Function to calculate printing price based on quantity
        function calculatePrice(quantity, quantities, prices) {
            quantity = parseInt(quantity);
            if (isNaN(quantity)) return 0;

            let price = 0;
            for (let i = quantities.length - 1; i >= 0; i--) {
                if (quantity >= quantities[i]) {
                    price = prices[i];
                    break;
                }
            }
            return price;
        }

        // Update printing price and total price
        function updatePrintingPriceAndTotal() {
            const enteredQty = parseInt(quantityInput.value) || 0;
            totalQty.textContent = enteredQty;
            totalQtyCustomization.textContent = enteredQty;
            totalQtyDelivery.textContent = enteredQty;

            selectedPrintingPrice = calculatePrice(enteredQty, selectedPrintingQuantities, pricesForSelectedPrinting);
            calculateTotalPrice();
        }

        // Update total price based on quantity and selected printing option
        function calculateTotalPrice() {
            const enteredQty = parseInt(quantityInput.value) || 0;
            let calculatedPrice = calculatePrice(enteredQty, quantities, prices);
            const total = calculatedPrice * enteredQty;

            totalPrice.textContent = `$${total.toFixed(2)}`;
            totalPriceCustomization.textContent = `$${(selectedPrintingPrice * enteredQty).toFixed(2)}`;

            if (selectedPrintingPrice === 0 && total >= 1) {
                artworkSelection.style.display = "none";
            } else {
                artworkSelection.style.display = "block";
            }

            // Update background color based on calculated price
            document.querySelectorAll('[id^="pricing-"]').forEach(function(priceElement) {
                const priceValue = parseFloat(priceElement.getAttribute('data-price'));

                if (priceValue === calculatedPrice) {
                    priceElement.style.backgroundColor = "#F7B708";
                    priceElement.style.color = "#fff";
                } else {
                    priceElement.style.backgroundColor = "";
                    priceElement.style.color = "black";
                }
            });
        }

        // Update delivery price and total cost for "View Shipping Bundle"
        function updateDeliveryPriceAndTotal() {
            const enteredQty = parseInt(quantityInput.value) || 0;
            const deliveryPrice = calculatePrice(enteredQty, quantitiesDelivery, pricesDelivery);
            const totalDelivery = deliveryPrice * enteredQty;
            totalPriceDelivery.textContent = `$${totalDelivery.toFixed(2)}`;
        }

        // Toggle between "Pick Yourself" and "View Shipping Bundle"
        function toggleOptions() {
            const selectedOption = document.querySelector('input[name="shippingOption"]:checked').value;

            if (selectedOption === 'pickYourself') {
                pickYourselfBox.style.display = 'block';
                viewBundleBox.style.display = 'none';
                totalPriceDelivery.textContent = '$0.00';
                resetTotalPrice();
            } else {
                pickYourselfBox.style.display = 'none';
                viewBundleBox.style.display = 'block';
                updateDeliveryPriceAndTotal();
            }
        }

        // Reset the total price to $0 for "Pick Yourself"
        function resetTotalPrice() {
            totalPrice.textContent = "$0.00";
            totalPriceCustomization.textContent = "$0.00";
        }

        // Listen to changes in shipping options and update the view
        shippingOptions.forEach(option => {
            option.addEventListener('change', toggleOptions);
        });

        // Recalculate total price and update view on quantity change
        quantityInput.addEventListener("input", function () {
            const selectedOption = document.querySelector('input[name="shippingOption"]:checked').value;
            
            if (selectedOption === 'pickYourself') {
                totalPriceDelivery.textContent = '$0.00';
                resetTotalPrice();
            } else {
                updateDeliveryPriceAndTotal();
            }

            updatePrintingPriceAndTotal();
        });

        // Ensure correct view on page load
        toggleOptions();

        // Prevent entering a value below the minimum quantity and update the UI accordingly
        quantityInput.addEventListener("blur", function () {
            const enteredQty = parseInt(quantityInput.value) || 0;
            const minQty = Math.min(...quantities);
            
            if (enteredQty < minQty) {
                quantityInput.value = minQty;
                calculateTotalPrice();
            }

            // Ensure the total quantity and price are updated
            totalQty.textContent = quantityInput.value;
            totalQtyCustomization.textContent = quantityInput.value;
            totalQtyDelivery.textContent = quantityInput.value;
        });
    });
</script>

<script>
    let currentIndex = 0;
    const thumbnails = document.querySelectorAll('.thumbnail');
  
    function changeImage(element) {
      const mainImage = document.getElementById('mainImage');
      mainImage.src = element.src;
      thumbnails.forEach(thumbnail => thumbnail.classList.remove('active'));
      element.classList.add('active');
      currentIndex = Array.from(thumbnails).indexOf(element);
    }
    function changeSlide(direction) {
      currentIndex += direction;
       if (currentIndex < 0) {
        currentIndex = thumbnails.length - 1;
      } else if (currentIndex >= thumbnails.length) {
        currentIndex = 0;
      }
  changeImage(thumbnails[currentIndex]);
    }
  </script>

@endsection
