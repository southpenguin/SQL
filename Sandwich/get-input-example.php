<?php session_start(); ?>

<!DOCTYPE html>

<html>
    
<?php
include "connectDB.php";
//perform SQL query
if(isset($_POST["topic"])) {
    $phone = $_POST["phone"];
    $_SESSION["phone"] = $_POST["phone"];
    $input_topic = $_POST["topic"];
    if (strlen ( $phone ) !== 10) {
        
        echo $_SESSION["phone"];
        echo "Please enter a valid 10-digit phone number.<br/>";
        echo 
        "<a href='index.php'><button>click me</button></a>";
        
    }
    else{
        echo "<form action = 'order.php' method='POST'>";
        if ($stmt = $mysqli->prepare("SELECT distinct sandwich.sname, size, price, description FROM sandwich, menu WHERE sandwich.sname = menu.sname and description like ?;")) {
        $input_topic = '%'.$input_topic.'%';
        $stmt->bind_param("s", $input_topic);
        $stmt->execute();
        $stmt->bind_result($name, $size, $price, $description);

        
        echo "You Phone Number is $phone.";
        echo "<table border = '1'>\n";
        while ($stmt->fetch()) {
            $_SESSION["name"] = $name;
            $_SESSION["size"] = $size;
            $_SESSION["price"] = $price;
            $_SESSION["description"] = $description;
            echo "<tr>";
            echo "<td><input type='checkbox' name='select' value='$name,$size,$price,$phone'></td><td>$name</td><td>$size</td><td>$price</td><td>$description</td>";
            echo "</tr>\n";
        }
        echo "</table>\n";
        echo "<input type = 'submit' value = 'Show books'>";
    echo "</form>";
    }
}
    
}
?>

</html>
