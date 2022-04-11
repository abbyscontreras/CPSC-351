<?php
include('../db_connection.php');
global $conn;

if (isset($_POST['register'])) {
    $username = $_POST['username'];
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $password = $_POST['password'];
    $sql_prof = "INSERT INTO professor (facultyID, first_name, last_name, email, phoneNumber) VALUES ('$username', '$firstname','$lastname','$email','$phone')";
    $sql_reg = "INSERT INTO registrar (fk_facultyID, email, password) VALUES ('$username', '$email','$password')";

    if (mysqli_query($conn, $sql_prof) and (mysqli_query($conn, $sql_reg))) {
        session_start();
        header('Location:../index.php');
    } else {
        echo "ERROR: Hush! Sorry didnt work. "
            . mysqli_error($conn);
    }
}

?>