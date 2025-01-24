@extends('main.layouts.master')

@section('main-container')

@component('main.components.breadcrumb', [
    'pageTitle' => 'Cart',
    'pageRoute' => 'cart',
    'imageURL' => asset('assetsMain/images/about.jpg') // Evaluated here
])
@endcomponent


<section class="section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="alert alert-danger text-center text-capitalize mb-4 fs-14">
                        There are <b>No Refunds</b> for any Order 
                    </div>
                </div>
            </div>
            <div class="row product-list justify-content-center">
                <div class="col-lg-8">
                    <div class="d-flex align-items-center mb-4">
                        <h5 class="mb-0 flex-grow-1 fw-medium">There are <span class="fw-bold product-count"></span> products in your cart</h5>
                        <div class="flex-shrink-0">
                            <a href="#!" class="text-decoration-underline link-secondary">Clear Cart</a>
                        </div>
                    </div>
                    @php
                    $subtotal = 0;
                @endphp

                @foreach($cart as $item)
                @php
                    $itemTotal = ($item->product_price + $item->printing_price + $item->delivery_price + $item->pompom_price) * $item->quantity;
                    $subtotal += $itemTotal;
                @endphp
                    <div class="card product">
                        <div class="card-body p-4">
                            <div class="row gy-3">
                                <div class="col-sm-auto">
                                    <div class="avatar-lg h-100 d-flex ">
                                        <div class="rounded py-3">
                                            <img src="{{ asset('storage/' . ($item->productBaseImages->first()->base_image ?? 'ProductImages/default.jpg')) }}"  alt="" class="avatar-md fixed-size-cartImage">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-sm">
                                    <a href="{{ route('product.detail', ['id' => $item->product->id]) }}">
                                        <h5 class="fs-16 lh-base mb-1">{{ $item->product->title }}</h5>
                                    </a>
                                    @php
                                    // Ensure beanie_type is checked properly
                                    $type = ($item->beanie_type === 1 || $item->beanie_type === '1') 
                                                ? "Flipped" 
                                                : (($item->beanie_type === 0 || $item->beanie_type === '0') 
                                                    ? "Unflipped" 
                                                    : "Not Specified");
                                @endphp
                                
                                    
                                    <ul class="list-inline text-muted fs-13 mb-3">
                                        <li class="list-inline-item">Color : <span class="fw-medium">{{ $item->color->componentColor->color_name }}</span></li>
                                        <br>
                                        <li class="list-inline-item">Type: <span class="fw-medium">{{ $type }}</span></li>
                                        <br>
                                        <li class="list-inline-item">Embroidery : <span class="fw-medium">{{ $item->printing->title }}</span></li>
                                        
                                    </ul>
                               
                                </div>
                                <div class="col-sm-auto">
                                    <div class="text-lg-end">
                                        <p class="text-muted mb-1 fs-12">Product Price:</p>
                                        <h5 class="fs-16">
                                            $<span class="product-price">{{ $item->product_price * $item->quantity }}</span>
                                        </h5>
                                        
                                    </div>
                                    <div class="text-lg-end">
                                        <p class="text-muted mb-1 fs-12">Customization Price:</p>
                                        <h5 class="fs-16">$<span class="product-price">{{ $item->printing_price * $item->quantity + $item->pompom_price * $item->quantity }}</span></h5>
                                    </div>
                                    <div class="text-lg-end">
                                        <p class="text-muted mb-1 fs-12">Delivery Price:</p>
                                        <h5 class="fs-16">$<span class="product-price">{{ $item->delivery_price * $item->quantity }}</span></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="row align-items-center gy-3">
                                <div class="col-sm">
                                    <div class="d-flex flex-wrap my-n1">
                                        <div>
                                            <a href="javascript:void(0);" class="d-block text-body p-1 px-2 remove-item-btn" data-item-id="{{ $item->id }}">
                                                <i class="ri-delete-bin-fill text-muted align-bottom me-1"></i> Remove
                                            </a>
                                            
                                            
                                        </div>
                                       
                                    </div>
                                </div>
                                <div class="col-sm-auto d-flex gap-3">
                                    <div class="d-flex align-items-center gap-2 text-muted">
                                        <div>Quantity :</div>
                                        <h5 class="fs-14 mb-0"><span class="product-line-price">{{ $item->quantity }}</span></h5>
                                    </div>
                                    <div class="d-flex align-items-center gap-2 text-muted">
                                        <div>Total :</div>
                                        <h5 class="fs-14 mb-0">$<span class="product-line-price">
                                            {{ ($item->product_price * $item->quantity) + ($item->printing_price * $item->quantity) + ($item->delivery_price * $item->quantity) + ($item->pompom_price * $item->quantity)  }}
                                        </span></h5>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <!-- end card footer -->
                    </div>
                    @endforeach
              
                </div>
                <!--end col-->
                <div class="col-lg-4">
                    <div class="sticky-side-div">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <h6 class="mb-3 fs-15">Have a <span class="fw-semibold">promo</span> code ?</h6>
                                </div>
                                <div class="hstack gap-3 px-3 mx-n3">
                                    <input class="form-control me-auto" type="text" placeholder="Enter coupon code" value="" aria-label="Add Promo Code here...">
                                    <button type="button" class="btn btn-primary w-xs">Apply</button>
                                </div>
                            </div>
                        </div>
                        <div class="card overflow-hidden">
                            <div class="card-header border-bottom-dashed">
                                <h5 class="card-title mb-0 fs-15">Order Summary</h5>
                            </div>
                            <div class="card-body pt-4">
                                <div class="table-responsive table-card">
                                    <table class="table table-borderless mb-0 fs-15">
                                        <tbody>
                                            <tr>
                                                <td>Sub Total :</td>
                                                <td class="text-end">${{ number_format($subtotal, 2) }}</td>
                                            </tr>
                                            <tr>
                                                <td>Discount <span class="text-muted"></span>:</td>
                                                <td class="text-end "></td>
                                            </tr>
                                       
                                            <tr class="table-active">
                                                <th>Total (CAD) :</th>
                                                <td class="text-end">
                                                    <span class="fw-semibold ">${{ number_format($subtotal, 2) }}</span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end table-responsive -->
                            </div>
                        </div>
                        <div class="hstack gap-2 justify-content-end">
                            <a href="{{ route('products') }}" class="btn btn-hover btn-danger">Continue Shopping</a>
                            <a href="{{ route('checkout') }}" class="btn btn-hover btn-success" >Check Out <i class="ri-logout-box-r-line align-bottom ms-1"></i></a>
                            {{-- <button type="button" class="btn btn-hover btn-success" id="checkoutButton">Check Out <i class="ri-logout-box-r-line align-bottom ms-1"></i></button> --}}

                        </div>
                    </div>
                    <!-- end sticky -->
                </div>
            </div>
            <!--end row-->
        </div>
        <!--end container-->
    </section>
<!-- Add jQuery if it's not included -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
document.querySelectorAll('.remove-item-btn').forEach(button => {
    button.addEventListener('click', function () {
        const cartItemId = this.getAttribute('data-item-id'); // Fetching the cart item ID

        // Confirm deletion
        if (confirm("Are you sure you want to delete this item from your cart?")) {
            // Generate the URL using the route helper
            const url = "{{ route('cart.remove', ['itemId' => '__ITEM_ID__']) }}".replace('__ITEM_ID__', cartItemId);

            // Sending a DELETE request
            fetch(url, {
                method: "DELETE", // Ensure the HTTP method is DELETE
                headers: {
                    "X-CSRF-TOKEN": "{{ csrf_token() }}", // CSRF token for security
                    "Content-Type": "application/json"
                },
            })
            .then(response => response.json())
            .then(result => {
                if (result.success) {
                    alert(result.message); // Show success message
                    location.reload(); // Reload page to update cart
                } else {
                    alert(result.message); // Show error message if deletion failed
                }
            })
            .catch(error => {
                alert("An error occurred while deleting the item. Please try again.");
                console.error("Error:", error);
            });
        }
    });
});


</script>


    @endsection
