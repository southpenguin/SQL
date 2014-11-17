<?php session_start(); ?>

<!DOCTYPE html>

<html>
<div style="width: 800px; margin-left: auto; margin-right: auto;  font-family: 'lucida grande', Calibri, Arial, sans-serif;">    
<?php
    include "connectDB.php";
    $select = $_POST['select'];
    /*Check if user selected some item from the last page */
    /*If nothing is selected*/
    if ($select == ""){
        ?>
        <h3>You did not select any sandwiches.</h3>
        <h3>Please select an sandwich to order.</h3>
        <a href='placeOrder.php'><button>Go Back</button></a>
        <?php
        $phone = $_SESSION["phone"];
    }
    /*If one item is selected*/
    else{    
    $pieces = explode(",", $select);
    $name = $pieces[0];
    $size = $pieces[1];
    $price = $pieces[2];
    $phone = $_SESSION["phone"];
    /*Checking if the same order exists*/
    $stmt1 = $mysqli->prepare("SELECT COUNT(*) FROM orders WHERE phone = ? AND sname = ? AND size = ? AND status ='pending';");
    $stmt1->bind_param("sss", $phone, $name, $size);
    $stmt1->execute();
    $stmt1->bind_result($number);
    while ($stmt1->fetch()) {
        $a = $number;
    }
    /*If the same order exists*/
    if ($a == 1) {
        echo "You have an existing same order, the quantity will be updated. ";
        $stmt2 = $mysqli->prepare("UPDATE orders SET quantity = quantity + 1, o_time = NOW() WHERE phone = ? AND sname = ? AND size = ? AND status ='pending';");
        $stmt2->bind_param("sss", $phone, $name, $size);
        $stmt2->execute();
    }
    /*If the order does not exist*/
    else {
        /*Check if this customer exists in the customer table*/
        $stmt3 = $mysqli->prepare("SELECT COUNT(*) FROM customer WHERE phone = ?;"); 
        $stmt3->bind_param("s", $phone);
        $stmt3->execute();
        $stmt3->bind_result($number);
        while ($stmt3->fetch()) {
            $a = $number;
        }
        /*If this customer is not in the database, add him to the customer table*/
        if($a != 1){
            echo "Welcome! Our new customer! ";
            $mysqli->query("INSERT INTO customer(phone) VALUES ($phone);"); 
        }
        echo "Your order of one $size $name is submitted! ";
        $stmt4 = $mysqli->prepare("INSERT INTO orders VALUES (?, ?, ?, NOW(), 1, 'pending');");
        $stmt4->bind_param("sss", $phone, $name, $size);
        $stmt4->execute();
    }
    }

?>
</div>
</html>

