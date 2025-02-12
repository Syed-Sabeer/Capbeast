<!DOCTYPE html>
<html>
<head>
    <title>Your Order Has Been Placed!</title>
</head>
<body>
    <h2>Thank you for your order, {{ $order->user->email ?? 'Valued Customer' }}!</h2>
    <p>Your order ID: <strong>{{ $order->order_id ?? 'N/A' }}</strong></p>
    <p>We have received your order and will begin processing it soon.</p>

    <h3>Order Details:</h3>
    @if(isset($order->items) && $order->items->isNotEmpty())
        <ul>
            @foreach($order->items as $items)
                <li>
                    <strong>Product:</strong> {{ $items->product->title ?? 'Unknown Product' }} <br>
                    <strong>Quantity:</strong> {{ $items->quantity ?? 'N/A' }} <br>
                    <strong>Price:</strong> ${{ $items->product_price ?? '0.00' }}
                </li>
            @endforeach
        </ul>
    @else
        <p>No items found in this order.</p>
    @endif

    <p><strong>Total Price:</strong> ${{ $order->total_price ?? '0.00' }}</p>

    <h3>Shipping Details:</h3>
    @if(isset($order->shippingDetails))
        <p>
            Name: {{ $order->shippingDetails->firstname ?? 'N/A' }} {{ $order->shippingDetails->lastname ?? '' }} <br>
            Address: {{ $order->shippingDetails->address ?? 'N/A' }} <br>
            Email: {{ $order->shippingDetails->email ?? 'N/A' }} <br>
            Phone: {{ $order->shippingDetails->phone ?? 'N/A' }}
        </p>
    @else
        <p>Shipping details not available.</p>
    @endif

    <p>We will notify you when your order has been shipped.</p>
</body>
</html>