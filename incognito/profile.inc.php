<?php
include('db_connection.php');
global $conn;
if (isset($_POST['Update']))    {
    $user = $_SESSION['user'];
    echo $user;
}


?>

