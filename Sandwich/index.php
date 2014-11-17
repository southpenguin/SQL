<!DOCTYPE html>

<html>
<body>
    <div style="width: 500px; margin-left: auto; margin-right: auto; text-align: center; font-family: 'lucida grande', Calibri, Arial, sans-serif;">
        <h2>Welcome to our sandwich shop!</h2>
        <h3>Please type the keyword and your phone number.</h3>
        <form action = "placeOrder.php" method="POST">
        <div style="width: 300px; margin-left: auto; margin-right: auto; font-size: 18px;">
            <input type="text" name="keyword" placeholder="Key Word" style="font-weight: bold; height: 22px; font-size: 14px; width: 200px;"><br><br>
            <input type="text" name="phone" placeholder="Your Phone Number" style="font-weight: bold; height: 22px; font-size: 14px; width: 200px;"><br><br>
            <input type = "submit" value = "Create an Oeder">
            </form>
        </div>
    </div>
</body>
</html>
