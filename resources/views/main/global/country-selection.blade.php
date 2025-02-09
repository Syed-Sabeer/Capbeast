<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Country</title>
    <style>
        .modal {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background: white;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="modal">
        <div class="modal-content">
            <h3>Select Your Country</h3>
            <form action="{{ route('set.country') }}" method="POST">
                @csrf
                <button type="submit" name="country" value="USA">USA</button>
                <button type="submit" name="country" value="CANADA">Canada</button>
                @if(session('error'))
    <p style="color:red;">{{ session('error') }}</p>
@endif

            </form>
            @if(session('error'))
            <p style="color:red;">{{ session('error') }}</p>
        @endif
                    
        </div>
    </div>
</body>
</html>
