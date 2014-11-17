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
$phone = $pieces[3];
echo "<table border = '1'>\n";
    echo "<tr>";
    echo "<td>$name</td><td>$size</td><td>$price</td><td>$phone</td>";
    echo "</tr>\n";        
    echo "</table>\n";
$timestamp = date('Y-m-d G:i:s');  
echo $name;
if ($stmt = $mysqli->prepare("Insert into customer (phone, street) VALUES ($phone, '$name');")) {

        $stmt->execute();
        
/*
if ($stmt = $mysqli->prepare("SELECT * FROM orders WHERE phone = ? AND sname = ? and size = ? and status = 'pending';")) {
        $stmt->bind_param('sss', $phone, $name, $size);
        $stmt->execute();
        $row = $stmt->mysql_num_rows;
        $stmt->bind_result($a, $b, $c, $d, $e, $f);
        $sql = "UPDATE orders SET quantity = quantity + 1;";
        echo $row;
        if ($stmt->mysql_num_rows == null){
            echo "<table border = '1'>\n";
            while ($stmt->fetch()) {
	        echo "<tr>";
                echo "<td>$a</td><td>$b</td><td>$c</td><td>$d</td><td>$e</td><td>$f</td>";
	        echo "</tr>\n";
            }
            echo "</table>\n";
        }
        else{
            echo 12341;
            
        }*/

        $stmt->close();
	$mysqli->close();

        }

?>
    
</html>

