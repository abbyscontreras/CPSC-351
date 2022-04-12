<?php
include('db_connection.php');
global $conn;
$user = $_SESSION['user'];
if (isset($_POST['update'])) {
    $advisorStatus = $_POST['advisorStatus'];
    $email = $_POST['Email'];
    $phone = $_POST['Phone'];
    $office = $_POST['Office'];
    $bio = $_POST['Bio'];
    $courses = $_POST['Courses'];
    $img = $_POST['Img'];
    $sql = "update professor set advisorStatus = '$advisorStatus', email = '$email' , phoneNumber = '$phone', office = '$office', biography = '$bio', courses_teaching = '$courses', professor_img = '$img' where facultyID = '$user'";
    if (mysqli_query($conn, $sql)) {
        echo "<h3>data stored in a database successfully.</h3>";
    } else {
        echo "ERROR: Hush! Sorry $sql. "
            . mysqli_error($conn);
    }


}


?>

