<!DOCTYPE html>
<html>
<head>
    <title>Your Order Has Been Placed!</title>
</head>
<body>
    <h2>Thank you for your order, {{ $order->user->name }}!</h2>
    <p>Your order ID: <strong>{{ $order->order_id }}</strong></p>
    <p>We have received your order and will begin processing it soon.</p>

    <h3>Order Details:</h3>
    <ul>
        @foreach($order->orderItems as $item)
            <li>
                <strong>Product:</strong> {{ $item->product->name }} <br>
                <strong>Quantity:</strong> {{ $item->quantity }} <br>
                <strong>Price:</strong> ${{ $item->product_price }}
            </li>
        @endforeach
    </ul>

    <p><strong>Total Price:</strong> ${{ $order->total_price }}</p>

    <h3>Shipping Details:</h3>
    <p>
        Name: {{ $order->shippingDetails->firstname }} {{ $order->shippingDetails->lastname }} <br>
        Address: {{ $order->shippingDetails->address }} <br>
        Email: {{ $order->shippingDetails->email }} <br>
        Phone: {{ $order->shippingDetails->phone }}
    </p>

    <p>We will notify you when your order has been shipped.</p>
</body>
</html>
