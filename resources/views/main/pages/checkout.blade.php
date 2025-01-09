@extends('main.layouts.master')

@section('main-container')


@component('main.components.breadcrumb', [
    'pageTitle' => 'Checkout',
    'pageRoute' => 'checkout',
    'imageURL' => asset('assetsMain/images/about.jpg') // Evaluated here
])
@endcomponent


<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="alert alert-danger alert-modern alert-dismissible fade show" role="alert">
                    <i class="bi bi-box-arrow-in-right icons"></i>No Cancellation of Orders after<a href="auth-signin-basic.html" class="link-danger"><strong> 48 hours</strong>.</a>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div><!--end col-->
        </div><!--end row-->
        <div class="row">
            <div class="col-xl-8">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive table-card">
                            <table class="table align-middle table-borderless table-nowrap text-center mb-0">
                                <thead>
                                    <tr>
                                        <th scope="col">Product</th>
                                     
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                    $subtotal = 0;
                                @endphp
                
                                @foreach($cart as $item)
                                @php
                                    $itemTotal = ($item->product_price + $item->printing_price + $item->delivery_price) * $item->quantity;
                                    $subtotal += $itemTotal;
                                @endphp
                                    <tr>
                                        <td class="text-start">
                                            <div class="d-flex align-items-center gap-2">
                                                <div class="avatar-sm flex-shrink-0">
                                                    <div class="avatar-title  rounded-3">
                                                        <img src="{{ asset('storage/' . ($item->productBaseImages->first()->base_image ?? 'ProductImages/default.jpg')) }}" alt="" class="avatar-xs">
                                                    </div>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <h6>{{ $item->product->title }}</h6>
                                                    <p class="text-muted mb-0">{{ $item->printing->title }}</p>
                                                </div>
                                            </div>
                                        </td>
                                       
                                        <td>
                                            {{ $item->quantity }}
                                        </td>
                                        <td class="text-end">${{ ($item->product_price * $item->quantity) + ($item->printing_price * $item->quantity) + ($item->delivery_price * $item->quantity) }}</td>
                                    </tr>
                                    @endforeach
              
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="mt-4 pt-2">
                    <div class="d-flex align-items-center mb-4">
                        <div class="flex-grow-1">
                            <h5 class="mb-0">Shipping Address</h5>
                        </div>
                     
                    </div>
                    <div class="row gy-3">
                        <form>
                            <!-- 2 column grid layout with text inputs for the first and last names -->
                            <div class="row mb-4">
                              <div class="col">
                                <div data-mdb-input-init class="form-outline">
                                    <label class="form-label" for="form6Example1">First name</label>
                                  <input type="text" id="form6Example1" class="form-control" />
                                  
                                </div>
                              </div>
                              <div class="col">
                                <div data-mdb-input-init class="form-outline">
                                    <label class="form-label" for="form6Example2">Last name</label>
                                  <input type="text" id="form6Example2" class="form-control" />
                                  
                                </div>
                              </div>
                            </div>
                          
                            <!-- Text input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <label class="form-label" for="form6Example3">Company name</label>
                              <input type="text" id="form6Example3" class="form-control" />
                              
                            </div>
                          
                            <!-- Text input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <label class="form-label" for="form6Example4">Address</label>
                              <input type="text" id="form6Example4" class="form-control" />
                              
                            </div>
                          
                            <!-- Email input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <label class="form-label" for="form6Example5">Email</label>
                              <input type="email" id="form6Example5" class="form-control" />
                              
                            </div>
                          
                            <!-- Number input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <label class="form-label" for="form6Example6">Phone</label>
                              <input type="number" id="form6Example6" class="form-control" />
                              
                            </div>
                          
                            <!-- Message input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                <label class="form-label" for="form6Example7">Additional information</label>
                              <textarea class="form-control" id="form6Example7" rows="4"></textarea>
                              
                            </div>
                          
                            <!-- Checkbox -->
                           
                          </form>
                    </div>
                </div>

                <div class="mt-4 pt-2">
                   
                    <div class="row gy-3">
                      
                            <h5 class="mb-0 flex-grow-1">Payment Selection</h5>
    
                            <ul class="nav nav-pills arrow-navtabs nav-success bg-light mb-3 mt-4 nav-justified custom-nav" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active py-3" data-bs-toggle="tab" href="#credit" role="tab">
                                        <span class="d-block d-sm-none"><i class="ri-bank-card-fill align-bottom"></i></span>
                                        <span class="d-none d-sm-block"> <i class="ri-bank-card-fill align-bottom pe-2"></i> Credit / Debit Card</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link  py-3" data-bs-toggle="tab" href="#paypal" role="tab">
                                        <span class="d-block d-sm-none"><i class="ri-paypal-fill align-bottom"></i></span>
                                        <span class="d-none d-sm-block"><i class="ri-paypal-fill align-bottom pe-2"></i> Paypal</span>
                                    </a>
                                </li>
    
                              
    
                              
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content text-muted">

                                <div class="tab-pane active" id="credit" role="tabpanel">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row gy-3">
                                                <div class="col-md-12">
                                                    <label for="cc-name" class="form-label">Name on card</label>
                                                    <input type="text" class="form-control" id="cc-name" placeholder="Enter name">
                                                    <small class="text-muted">Full name as displayed on card</small>
                                                </div>
                
                                                <div class="col-md-6">
                                                    <label for="cc-number" class="form-label">Credit card number</label>
                                                    <input type="text" class="form-control" id="cc-number" placeholder="xxxx xxxx xxxx xxxx">
                                                </div>
                
                                                <div class="col-md-3">
                                                    <label for="cc-expiration" class="form-label">Expiration</label>
                                                    <input type="text" class="form-control" id="cc-expiration" placeholder="MM/YY">
                                                </div>
                
                                                <div class="col-md-3">
                                                    <label for="cc-cvv" class="form-label">CVV</label>
                                                    <input type="text" class="form-control" id="cc-cvv" placeholder="xxx">
                                                </div>
                                            </div>
    
                                           
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane " id="paypal" role="tabpanel">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row gy-3">
                                                <div class="col-md-12">
                                                    <label for="buyers-name" class="form-label">Buyers First Name</label>
                                                    <input type="text" class="form-control" id="buyers-name" placeholder="Enter Name">
                                                </div>
    
                                                <div class="col-md-6">
                                                    <label for="buyers-last" class="form-label">Buyers Last Name</label>
                                                    <input type="text" class="form-control" id="buyers-last" placeholder="Enter Last Name">
                                                </div>
    
                                                <div class="col-md-6">
                                                    <label for="buyers-address" class="form-label">Email Address</label>
                                                    <input type="text" class="form-control" id="buyers-address" placeholder="Enter Email Address">
                                                </div>
    
                                                <div class="col-md-12">
                                                    <label class="form-label">Select your paypal account type</label>
                                                    <div class="d-flex gap-4 mt-1">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="formRadios"
                                                                id="formRadios1" checked>
                                                            <label class="form-check-label" for="formRadios1">
                                                                Domestic
                                                            </label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="formRadios"
                                                                id="formRadios2">
                                                            <label class="form-check-label" for="formRadios2">
                                                                International
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
    
                                         
                                        </div>
                                    </div>
                                </div>
    
                               
    
                    
                            </div>
                        
                   
                    </div>
                </div>
            </div>
            <!-- end col -->
            <div class="col-lg-4">
                <div class="sticky-side-div">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center">
                                <h6 class="mb-3 fs-14">Have a <span class="fw-semibold">promo</span> code ?</h6>
                            </div>
                            <div class="hstack gap-3 px-3 mx-n3">
                                <input class="form-control me-auto" type="text" placeholder="Enter coupon code" value="" aria-label="Add Promo Code here...">
                                <button type="button" class="btn btn-success w-xs">Apply</button>
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
                                            <td class="text-end cart-subtotal">${{ number_format($subtotal, 2) }}</td>
                                        </tr>
                                        {{-- <tr>
                                            <td>Discount <span class="text-muted">(Toner15)</span>:</td>
                                            <td class="text-end cart-discount">$18.00</td>
                                        </tr>
                                        <tr>
                                            <td>Shipping Charge :</td>
                                            <td class="text-end cart-shipping">$2.4</td>
                                        </tr>
                                        <tr>
                                            <td>Estimated Tax (12.5%) : </td>
                                            <td class="text-end cart-tax">$1.6</td>
                                        </tr> --}}
                                        <tr class="table-active">
                                            <th>Total (USD) :</th>
                                            <td class="text-end">
                                                <span class="fw-semibold cart-total">${{ number_format($subtotal, 2) }}</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- end table-responsive -->
                        </div>
                    </div>
                    <div class="hstack gap-2 justify-content-between justify-content-end">
                        <a href="shop-cart.html" class="btn btn-hover btn-soft-info w-100">Back To Cart <i class="ri-arrow-right-line label-icon align-middle ms-1"></i></a>
                                                    <button type="button" class="btn  w-100 btn-hover btn-primary" id="checkoutButton">Proceed to Pay <i class="ri-logout-box-r-line align-bottom ms-1"></i></button>
                        {{-- <a href="payment.html" class="btn btn-hover btn-primary w-100"></a> --}}
                    </div>
                    
                </div>
                <!-- end sticky -->
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section>


<script>
    document.getElementById('checkoutButton').addEventListener('click', function () {
    if (confirm('Are you sure you want to proceed to checkout?')) {
        fetch("{{ route('checkout.add') }}", {
            method: "POST",
            headers: {
                "X-CSRF-TOKEN": "{{ csrf_token() }}",
                "Content-Type": "application/json"
            },
        })
        .then(response => response.json())
        .then(result => {
            if (result.success) {
                alert(result.message);
                window.location.href = `/orders/${result.orderId}`; // Redirect to order summary
            } else {
                alert(result.message);
            }
        })
        .catch(error => {
            alert('An error occurred during checkout. Please try again.');
        });
    }
});

</script>

@endsection
