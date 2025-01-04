@extends('admin.layouts/layoutMaster')

@section('title', 'eCommerce Product Add - Apps')

@section('vendor-style')
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/quill/typography.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/quill/katex.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/quill/editor.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/select2/select2.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/dropzone/dropzone.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/flatpickr/flatpickr.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/tagify/tagify.css') }}" />
@endsection

@section('vendor-script')
    <script src="{{ asset('assets/vendor/libs/quill/katex.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/quill/quill.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/select2/select2.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/dropzone/dropzone.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/jquery-repeater/jquery-repeater.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/flatpickr/flatpickr.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/tagify/tagify.js') }}"></script>
@endsection

@section('page-script')
    <script src="{{ asset('assets/js/app-ecommerce-product-add.js') }}"></script>
@endsection

@section('content')
<form method="POST" action="{{ route('app-ecommerce-product-store') }}" enctype="multipart/form-data">
    @csrf
    <div class="row">
        <div class="col-12 col-lg-8">
            <div class="card mb-4">
                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label">Product Name</label>
                        <input type="text" name="title" class="form-control" placeholder="Product title" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-control" rows="5" required></textarea>
                    </div>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-header">Colors</div>
                <div class="card-body" id="color-section">
                    <div class="color-item">
                        <div class="row mb-3">
                            <div class="col-6">
                                <label class="form-label">Color</label>
                                <select name="color[]" class="form-select" required>
                                    @foreach ($colors as $color)
                                        <option value="{{ $color['hex'] }}">{{ $color['name'] }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-6">
                                <label class="form-label">Images</label>
                                <input type="file" name="images[0][]" class="form-control" multiple>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn btn-primary" id="add-color">Add another color</button>
            </div>

            <div class="card mb-4">
                <div class="card-header">Pricing</div>
                <div class="card-body" id="pricing-section">
                    <div class="pricing-item">
                        <div class="row mb-3">
                            <div class="col-6">
                                <label class="form-label">Quantity</label>
                                <input type="number" name="quantity[]" class="form-control" required>
                            </div>
                            <div class="col-6">
                                <label class="form-label">Price</label>
                                <input type="text" name="pricing[]" class="form-control" required>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn btn-primary" id="add-pricing">Add another pricing</button>
            </div>
        </div>

        <div class="col-12 col-lg-4">
            <div class="card mb-4">
                <div class="card-header">Base Images</div>
                <div class="card-body" id="base-image-section">
                    <div class="mb-3">
                        <label class="form-label">Images</label>
                        <input type="file" name="base_images[]" class="form-control" multiple>
                    </div>
                </div>
                <button type="button" class="btn btn-primary" id="add-base-image">Add another image</button>
            </div>
        </div>
    </div>

    <button type="submit" class="btn btn-success">Save Product</button>
</form>

<script>
    document.getElementById('add-color').addEventListener('click', () => {
        const colorSection = document.getElementById('color-section');
        const newColorItem = colorSection.firstElementChild.cloneNode(true);
        const imageInput = newColorItem.querySelector('input[type="file"]');
        const colorInput = newColorItem.querySelector('select');
        
        imageInput.name = `images[${colorSection.children.length}][]`; // Make sure name is unique
        colorInput.name = `color[${colorSection.children.length}]`; // Make sure color field is unique
        
        colorSection.appendChild(newColorItem);
    });

    document.getElementById('add-pricing').addEventListener('click', () => {
        const pricingSection = document.getElementById('pricing-section');
        const newPricingItem = pricingSection.firstElementChild.cloneNode(true);
        newPricingItem.querySelectorAll('input').forEach(input => input.value = ''); // Reset input fields
        pricingSection.appendChild(newPricingItem);
    });

    document.getElementById('add-base-image').addEventListener('click', () => {
    const baseImageSection = document.getElementById('base-image-section');
    const newImageInput = baseImageSection.firstElementChild.cloneNode(true);
    
    // Ensure unique names for each base image input
    const allInputs = baseImageSection.getElementsByTagName('input');
    newImageInput.querySelector('input[type="file"]').name = `base_images[]`; // This keeps it flat
    
    baseImageSection.appendChild(newImageInput);
});



</script>
@endsection
