<!DOCTYPE html>
<html>
<head>
    <title>New Order Received</title>
</head>
<body>
    <h2>New Order Received!</h2>
    <p>A new order has been placed on your store.</p>

    <h3>Order Details:</h3>
    <p><strong>Order ID:</strong> {{ $order->order_id }}</p>
    <p><strong>Customer:</strong> {{ $order->user->name }} ({{ $order->shippingDetails->email }})</p>
    <p><strong>Total Price:</strong> ${{ $order->total_price }}</p>

    <h3>Products Ordered:</h3>
    <ul>
        @foreach($order->orderItems as $item)
            <li>
                <strong>Product:</strong> {{ $item->product->name }} <br>
                <strong>Quantity:</strong> {{ $item->quantity }} <br>
                <strong>Price:</strong> ${{ $item->product_price }}
            </li>
        @endforeach
    </ul>

    <h3>Shipping Details:</h3>
    <p>
        Name: {{ $order->shippingDetails->firstname }} {{ $order->shippingDetails->lastname }} <br>
        Address: {{ $order->shippingDetails->address }} <br>
        Email: {{ $order->shippingDetails->email }} <br>
        Phone: {{ $order->shippingDetails->phone }}
    </p>

    <p>Please process this order as soon as possible.</p>
</body>
</html>
