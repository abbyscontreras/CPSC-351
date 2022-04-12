<?php
include('db_connection.php');
global $conn;
if (isset($_POST['update'])) {
    $semester = $_POST['semester'];
    $course = $_POST['course'];
    $credits = $_POST['credits'];
//    $sql = "update course_schedule set semester = '$semester', credits = '$credits' where course_name = '$course'";
    if (mysqli_query($conn, $sql)) {
        echo "<h3>data stored in a database successfully.</h3>";
    } else {
        echo "ERROR: Hush! Sorry $sql. "
            . mysqli_error($conn);
    }

}
}


?>

