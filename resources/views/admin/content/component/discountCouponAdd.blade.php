    @extends('admin.layouts.layoutMaster')

    @section('title', 'Add New Coupon')
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

                // Toggle the expiry-related fields based on the checkbox
                $('#is_expiry_switch').on('change', function () {
    if ($(this).is(':checked')) {
        // Show expiry options when checked
        $('#expiryOptions').show();
        $('#is_expiry').val('1'); // Set is_expiry to 1 when the checkbox is checked
    } else {
        // Hide expiry options when unchecked
        $('#expiryOptions').hide();
        $('#expiryType').prop('checked', false); // Reset radio buttons
        $('#countField, #durationField').hide(); // Hide input fields
        $('#is_expiry').val('0'); // Set is_expiry to 0 when unchecked
    }
});

                // Handle the expiry radio button selection
                $('input[name="expiry_type"]').on('change', function () {
                    let selectedExpiryType = $('input[name="expiry_type"]:checked').val();
                    if (selectedExpiryType == 'time_limit') {
                        $('#countField').show();  // Show count input field
                        $('#durationField').hide(); // Hide duration input field
                    } else if (selectedExpiryType == 'duration') {
                        $('#countField').hide();  // Hide count input field
                        $('#durationField').show(); // Show duration input field
                    }
                });

                $('#couponFor').on('change', function() {
                    let selectedType = $(this).val();
                    let itemSelect = $('#itemSelect');
                    itemSelect.html('<option value="0">Select All</option>'); // Reset dropdown

                    if (selectedType == "1" || selectedType == "3") {
                        $.ajax({
                            url: "{{ route('get-items') }}",
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
    <form method="POST" action="{{ route('content-discount-coupon-store') }}">
        @csrf
        <div class="row">
            <div class="col-12 col-lg-8">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label">Coupon Title</label>
                            <input type="text" name="title" class="form-control" placeholder="Enter title" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Coupon Code</label>
                            <input type="text" name="code" class="form-control" placeholder="Enter title" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Coupon For</label>
                            <select name="discount_type" id="couponFor" class="select2 form-select form-select-lg">
                                <option value="">Select Status</option>
                                <option value="1">Products</option>
                                <option value="3">Printing</option>  
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Select Item</label>
                            <select name="item_id" id="itemSelect" class="select2 form-select form-select-lg" required>
                                <option value="0">Select All</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Discount Percentage</label>
                            <input type="text" name="percentage" class="form-control" placeholder="Enter Number" required>
                        </div>  

                        <!-- Expiry Option -->
                        <div class="mb-3 d-none">
                            <label class="form-label">Expiry</label>
                            <br>
                            <label class="switch switch-primary switch-sm me-4 pe-2">
                                <input type="checkbox" class="switch-input" id="is_expiry_switch">
                                <span class="switch-toggle-slider">
                                    <span class="switch-on"></span>
                                    <span class="switch-off"></span>
                                </span>
                            </label>
                            <input type="hidden" name="is_expiry" id="is_expiry" value="0">
                        </div> 

                        <!-- Expiry Options (Hidden initially) -->
                        <div id="expiryOptions" style="display: none;">
                            <div class="mb-3">
                                <label class="form-label">Expiry Type</label><br>
                                <input type="radio" name="expiry_type" value="time_limit" id="timeLimit" /> Time Limit
                                <input style="margin-left: 5%;" type="radio" name="expiry_type" value="duration" id="duration" /> Duration
                            </div>
                            <!-- Count (for time limit) -->
                            <div id="countField" style="display: none;">
                                <label class="form-label">Count</label>
                                <input type="number" name="count" class="form-control" placeholder="Enter count" min="1" />
                            </div>
                            <!-- Duration (for duration option) -->
                            <div id="durationField" style="display: none;">
                                <label class="form-label">Duration (in days)</label>
                                <input type="number" name="duration" class="form-control" placeholder="Enter duration in days" min="1" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-success">Save Coupon</button>
    </form>
    @endsection
