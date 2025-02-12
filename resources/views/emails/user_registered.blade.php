<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Monkey Beanies</title>
</head>
<body>
    <h2>Dear, {{ $user->email }}!</h2>
    <h4>Thank you for registering with Monkey Beanies! We're excited to have you on board. </h4>

    <p>Your login credentials are as follows: </p>

    <h3>Username: {{ $user->email }}</h3>
    <h3>Password: {{ $plainPassword }}</h3>


    <p>
        For your security, please keep your login credentials confidential and do not share them with anyone. If you have any questions or concerns, please refer to our FAQ section or contact our support team for assistance.
Thank you for choosing Monkey Beanies. We look forward to serving you and providing you with an outstanding experience.
Warm regards,

    </p>

    <h4>Bruno Torres</h4>
    <h4>CEO</h4>
    <a href="monkeybeanies.com">Monkey Beanies</a>



</body>
</html>
