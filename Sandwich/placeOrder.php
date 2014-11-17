<?php session_start(); ?>

<!DOCTYPE html>

<html>
<div style="width: 800px; margin-left: auto; margin-right: auto;  font-family: 'lucida grande', Calibri, Arial, sans-serif;">    
<?php
include "connectDB.php";
/*Check if customer has already typed a phone number*/
    if ($_SESSION["phone"] == ""){
        $phone = $_POST["phone"];
        $_SESSION["phone"] = $_POST["phone"];
    }
/*If customer already typed a phone number*/
    else {
        $phone=$_SESSION["phone"];
    }
    
    $keyword = $_POST["keyword"];
/*Test if the phone number is a valid 10 digits string*/
    if (strlen ( $phone ) !== 10) {
        ?><h3>"<?php echo $_SESSION["phone"]; ?>" is not a valid phone number.</h3>
        <h3>Please enter a 10-digit phone number.</h3>
        <a href='index.php'><button>Go Back</button></a><?php
    }
    else{
        /*Check if there exists result from the database after the keyword search */
        $stmt0 = $mysqli->prepare("SELECT COUNT(*) FROM sandwich, menu WHERE sandwich.sname = menu.sname and description like ?;");
        $keyword = '%'.$keyword.'%';
        $stmt0->bind_param("s", $keyword);
        $stmt0->execute();
        $stmt0->bind_result($result);
        while ($stmt0->fetch()) {
            $a = $result;
        }
        /*If at least one result found */
        if ($a > 0) {
            echo "<form action = 'order.php' method='POST'>";
            $stmt = $mysqli->prepare("SELECT distinct sandwich.sname, size, price, description FROM sandwich, menu WHERE sandwich.sname = menu.sname and description like ?;");
            $keyword = '%'.$keyword.'%';
            $stmt->bind_param("s", $keyword);
            $stmt->execute();
            $stmt->bind_result($name, $size, $price, $description);

            echo "You Phone Number is $phone.<br>";
            echo "<table border = '1'>\n";
            while ($stmt->fetch()) {
                echo "<tr>";
                echo "<td><input type='radio' name='select' value='$name,$size,$price,$phone'></td><td>$name</td><td>$size</td><td>$price</td><td>$description</td>";
                echo "</tr>\n";
            }
            echo "</table>\n</br>";
            echo "<input type = 'submit' value = 'Submit Order'>";
         echo "</form>";
        }  
        /*No result found */
        else {
            echo "There is no sandwich meets your key word.<br><br>";
            echo "<a href='index.php'><button>Go Back</button></a>";
        }
    }
?>
</div>
    
</html>
