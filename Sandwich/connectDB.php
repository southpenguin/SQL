<?php
$mysqli = new mysqli("localhost", "root", "root", "TEST");

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
else {
}
?>
