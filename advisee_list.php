<?php
include('db_connection.php');
global $conn;
include('header.php');
?>


<main>
    <div id="wrapper">

        <h1>My Advisees</h1>



        <p>
            <?php

            if (isset($_SESSION['user'])) {
                $user = $_SESSION['user'];
                $sql = mysqli_query($conn, "select * from Student where fk_facultyID='$user'");
                while ($row = mysqli_fetch_array($sql)) {
                    $fname = $row['first_name'];
                    $lname = $row['last_name'];
                    $student_ID = $row['student_ID'];
                    $_SESSION['student_ID'] = $student_ID;
                    echo '<div class="studentselect"><a href="jack.php?student_select='.$student_ID.'"> <button type="submit" form="advissee" value="'.$student_ID.'">'.$fname . " " . $lname.'</button> </a></div>';

                }
            }
            ?>

        </p>





    </div>
</main>


