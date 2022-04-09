<?php
$servername = "cnuarchway351.ca7hhpahr8lc.us-east-1.rds.amazonaws.com";
$username = "admin";
$password = "rootroot";
$database = 'cpsc351';

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
// echo "Connected successfully";
?>