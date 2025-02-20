@extends('admin.layouts.layoutMaster')

@section('title', 'Edit Coupon')
@section('vendor-style')
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/select2/select2.css') }}" />    
@endsection

@section('vendor-script')
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="{{ asset('assets/vendor/libs/select2/select2.js') }}"></script>
@endsection

@section('page-script')
    <script src="{{ asset('assets/js/modal-add-new-address.js') }}"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            if (typeof $ === "undefined") {
                console.error("jQuery is not loaded!");
                return;
            }

            $('#couponFor').on('change', function() {
                let selectedType = $(this).val();
                let itemSelect = $('#itemSelect');
                itemSelect.html('<option value="0">Select All</option>'); // Reset dropdown

                if (selectedType == "1" || selectedType == "3") {
                    $.ajax({
                        url: "{{ route($prefix .'.get-items') }}",
                        type: "GET",
                        data: { type: selectedType },
                        dataType: "json",
                        success: function(response) {
                            console.log("Response Data:", response);
                            if (response.length > 0) {
                                response.forEach(item => {
                                    itemSelect.append(`<option value="${item.id}">${item.title}</option>`);
                                });
                            } else {
                                itemSelect.append('<option value="">No items found</option>');
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error("AJAX Error:", xhr.responseText);
                        }
                    });
                }
            });
        });
    </script>
@endsection

@section('content')
<form method="POST" action="{{ route($prefix .'.content-discount-coupon-update', $discountCoupon->id) }}">
    @csrf
    @method('POST')
    <div class="row">
        <div class="col-12 col-lg-8">
            <div class="card mb-4">
                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label">Coupon Title</label>
                        <input type="text" name="title" class="form-control" value="{{ $discountCoupon->title }}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Coupon Code</label>
                        <input type="text" name="code" class="form-control" value="{{ $discountCoupon->code }}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Coupon For</label>
                        <select name="discount_type" id="couponFor" class="select2 form-select form-select-lg" required>
                            <option value="1" {{ $discountCoupon->discount_type == 1 ? 'selected' : '' }}>Products</option>
                            <option value="3" {{ $discountCoupon->discount_type == 3 ? 'selected' : '' }}>Printing</option>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Select Item</label>
                        <select name="item_id" id="itemSelect" class="select2 form-select form-select-lg" required>
                        
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Discount Percentage</label>
                        <input type="text" name="percentage" class="form-control" value="{{ $discountCoupon->percentage }}" required>
                    </div>  
                </div>
            </div>
        </div>
    </div>
    <button type="submit" class="btn btn-success">Update Coupon</button>
</form>
@endsection
