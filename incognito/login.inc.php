<?php
session_start();
include('../db_connection.php');
global $conn;
$msg = "";
if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $sql = "select * from registrar where fk_facultyID = '$username' and password = '$password'";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) === 1) {
        $row = mysqli_fetch_assoc($result);
        if ($row['fk_facultyID'] === $username && $row['password'] === $password) {
            echo "Logged in!";
            header('Location:../CPSC-351/index.php');
        } else {
            $msg = '<div class="alert alert-danger" role="alert"><p>Please enter valid login credentials</p></div>';
        }
    }
}
?>