@extends('main.layouts.master')

@section('main-container')
    @component('main.components.breadcrumb', [
        'pageTitle' => 'Checkout',
        'pageRoute' => 'checkout',
        'imageURL' => asset('assetsMain/images/about.jpg'), // Evaluated here
    ])
    @endcomponent

    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="alert alert-danger alert-modern alert-dismissible fade show" role="alert">
                        <i class="bi bi-box-arrow-in-right icons"></i>No Cancellation of Orders after<a
                            href="auth-signin-basic.html" class="link-danger"><strong> 48 hours</strong>.</a>
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

                                        @foreach ($cart as $item)
                                            @php
                                                $itemTotal =
                                                    ($item->product_price +
                                                        $item->printing_price +
                                                        $item->delivery_price +
                                                        $item->pompom_price) *
                                                    $item->quantity;
                                                $subtotal += $itemTotal;
                                            @endphp
                                            <tr>
                                                <td class="text-start">
                                                    <div class="d-flex align-items-center gap-2">
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <div class="avatar-title  rounded-3">
                                                                <img src="{{ asset('storage/' . ($item->productBaseImages->first()->base_image ?? 'ProductImages/default.jpg')) }}"
                                                                    alt="" class="avatar-xs">
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
                                                <td class="text-end">
                                                    ${{ $item->product_price * $item->quantity + $item->printing_price * $item->quantity + $item->delivery_price * $item->quantity + $item->pompom_price * $item->quantity }}
                                                </td>
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
                                            <label class="form-label" for="form6Example1">First name *</label>
                                            <input type="text" id="firstname" name="firstname" class="form-control" required/>

                                        </div>
                                    </div>
                                    <div class="col">
                                        <div data-mdb-input-init class="form-outline">
                                            <label class="form-label" for="form6Example2">Last name *</label>
                                            <input type="text" id="lastname" name="lastname" class="form-control" required/>

                                        </div>
                                    </div>
                                </div>

                                <!-- Text input -->
                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="form6Example3">Company name *</label>
                                    <input type="text" id="companyname" name="companyname" class="form-control" required/>

                                </div>

                                <!-- Text input -->
                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="form6Example4">Address *</label>
                                    <input type="text" id="address" name="address" class="form-control" required/>

                                </div>

                                <!-- Email input -->
                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="form6Example5">Email *</label>
                                    <input type="email" id="email" name="email" class="form-control" required/>

                                </div>

                                <!-- Number input -->
                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="form6Example6">Phone *</label>
                                    <input type="number" id="phone" name="phone" class="form-control" required/>

                                </div>

                                <!-- Message input -->
                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="form6Example7">Additional information</label>
                                    <textarea class="form-control" id="additional_info" name="additional_info" rows="4"></textarea>

                                </div>

                                <!-- Checkbox -->

                            </form>
                        </div>
                    </div>


                    <div class="mt-4 pt-2">
                        <div class="row gy-3">
                            <h5 class="mb-0 flex-grow-1">Payment Selection</h5>
                    
                            <!-- PayPal Option -->
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethod" id="paypalOption" value="paypal" checked>
                                <label class="form-check-label" for="paypalOption">
                                    Pay with PayPal
                                </label>
                            </div>
                    
                            <!-- Authorize.Net Option -->
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethod" id="authorizeNetOption" value="authorize_net">
                                <label class="form-check-label" for="authorizeNetOption">
                                    Pay with Authorize.Net
                                </label>
                            </div>
                        </div>
                    
                        <!-- Authorize.Net Card Details -->
                        <div id="authorizeNetCardDetails" class="mt-3" style="display: none;">
                            <h6 class="mb-3">Enter Card Details</h6>
                            <div class="row gy-3">
                                <div class="col-md-6">
                                    <label class="form-label" for="cardNumber">Card Number</label>
                                    <input type="text" id="cardNumber" name="cardNumber" class="form-control" placeholder="1234 5678 9012 3456">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="cardName">Cardholder Name</label>
                                    <input type="text" id="cardName" name="cardName" class="form-control" placeholder="John Doe">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="expiryDate">Expiry Date</label>
                                    <input type="text" id="expiryDate" name="expiryDate" class="form-control" placeholder="MM/YY">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="cvv">CVV</label>
                                    <input type="text" id="cvv" name="cvv" class="form-control" placeholder="123">
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        document.addEventListener('DOMContentLoaded', () => {
                            const paypalOption = document.getElementById('paypalOption');
                            const authorizeNetOption = document.getElementById('authorizeNetOption');
                            const authorizeNetCardDetails = document.getElementById('authorizeNetCardDetails');
                    
                            // Toggle card details visibility based on the selected payment method
                            function toggleCardDetails() {
                                if (authorizeNetOption.checked) {
                                    authorizeNetCardDetails.style.display = 'block';
                                } else {
                                    authorizeNetCardDetails.style.display = 'none';
                                }
                            }
                    
                            // Add event listeners
                            paypalOption.addEventListener('change', toggleCardDetails);
                            authorizeNetOption.addEventListener('change', toggleCardDetails);
                    
                            // Initialize the visibility
                            toggleCardDetails();
                        });
                    </script>
                                        


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
                                    <input class="form-control me-auto" type="text" placeholder="Enter coupon code"
                                        value="" aria-label="Add Promo Code here...">
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
                                          
                                            <tr class="table-active">
                                                <th>Total (USD) :</th>
                                                <td class="text-end">
                                                    <span
                                                        class="fw-semibold cart-total">${{ number_format($subtotal, 2) }}</span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- end table-responsive -->
                            </div>
                        </div>
                        <div class="hstack gap-2 justify-content-between justify-content-end">
                            <a href="{{ route('cart') }}" class="btn btn-hover btn-soft-info w-100">Back To Cart <i
                                    class="ri-arrow-right-line label-icon align-middle ms-1"></i></a>
                                    <button type="button" class="btn w-100 btn-hover btn-primary" id="checkoutButton" 
                                    {{ count($cart) == 0 ? 'disabled' : '' }} 
                                    onclick="proceedToCheckout()">
                                    Proceed to Pay <i class="ri-logout-box-r-line align-bottom ms-1"></i>
                                </button>
                        </div>

                    </div>
                    <!-- end sticky -->
                </div><!--end col-->
            </div><!--end row-->
        </div><!--end container-->
    </section>

    <script>
       function proceedToCheckout() {
    if (confirm('Are you sure you want to proceed to checkout?')) {
        // Gather form data
        const formData = {
            firstname: document.getElementById('firstname').value,
            lastname: document.getElementById('lastname').value,
            companyname: document.getElementById('companyname').value,
            address: document.getElementById('address').value,
            email: document.getElementById('email').value,
            phone: document.getElementById('phone').value,
            additional_info: document.getElementById('additional_info').value,
            paymentMethod: document.querySelector('input[name="paymentMethod"]:checked')?.value // Get selected payment method
        };

        if (!formData.paymentMethod) {
            alert('Please select a payment method.');
            return;
        }

        // Send data via fetch
        fetch("{{ route('checkout.add') }}", {
                method: "POST",
                headers: {
                    "X-CSRF-TOKEN": "{{ csrf_token() }}",
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(formData),
            })
            .then(response => response.json())
            .then(result => {
                if (result.success) {
                    alert(result.message);

                    if (formData.paymentMethod === 'paypal') {
                        // Redirect to PayPal payment
                        window.location.href = result.paypalUrl; // Assuming you have PayPal URL in the response
                    } else {
                        // Redirect with the order ID
                        const url = "{{ route('main.pages.success') }}?orderId=" + result.orderId;
                        window.location.href = url;
                    }
                } else {
                    alert(result.message);
                }
            })
            .catch(error => {
                alert('An error occurred during checkout. Please try again.');
            });
    }
}

    </script>
@endsection
