<?php session_start() ?>

<!DOCTYPE html>

<html>
<?php
    include "connectDB.php";
    $select = $_POST['select'];
    $pieces = explode(",", $select);
    $name = $pieces[0];
    $size = $pieces[1];
    $price = $pieces[2];
    $phone = $_SESSION["phone"];
    $stmt1 = $mysqli->prepare("SELECT COUNT(*) FROM orders WHERE phone = ? AND sname = ? AND size = ? AND status ='pending';");
    $stmt1->bind_param("sss", $phone, $name, $size);
    $stmt1->execute();
    $stmt1->bind_result($number);
    while ($stmt1->fetch()) {
        $a = $number;
    }
    if ($a == 1) {
        $stmt2 = $mysqli->prepare("UPDATE orders SET quantity = quantity + 1, o_time = NOW() WHERE phone = ? AND sname = ? AND size = ? AND status ='pending';");
        $stmt2->bind_param("sss", $phone, $name, $size);
        $stmt2->execute();
    }  else {
        $stmt3 = $mysqli->prepare("SELECT COUNT(*) FROM customer WHERE phone = ?;"); 
        $stmt3->bind_param("s", $phone);
        $stmt3->execute();
        $stmt3->bind_result($number);
        while ($stmt3->fetch()) {
            $a = $number;
        }
        if($a != 1){
            $mysqli->query("INSERT INTO customer(phone) VALUES ($phone);"); 
        }
        $stmt4 = $mysqli->prepare("INSERT INTO orders VALUES (?, ?, ?, NOW(), 1, 'pending');");
        $stmt4->bind_param("sss", $phone, $name, $size);
        $stmt4->execute();
    }
       

?>
    
</html>

