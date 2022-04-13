<?php
include('db_connection.php');
global $conn;
include('header.php');
?>


<main>
    <div id="wrapper">

        <p><?php
        if (isset($_SESSION['user'])) {
            $user = $_SESSION['user'];
            $sql = mysqli_query($conn, "select * from Student where fk_facultyID='$user'");
            while ($row = mysqli_fetch_array($sql)) {
                $fname = $row['first_name'];
                $lname = $row['last_name'];
                echo '<a href="jack.php"> <button type="submit" form="advissee" value="">'.$fname . " " . $lname.'</button> </a>';


            }
        }
        ?>
        </p>

        <p>Image</p>
        <a href="abby.php">abby</a>

        <a href="brett.php"><img src="images/kropinski_cnu_profile_picture.jpeg" alt="Brett Kropinski"></a>
        <a href="brett.php">brett</a>

        <a href="pat.php"><img src="images/tehan_cnu_profile_picture.JPG" alt="Patrick Tehan"></a>
        <a href="pat.php">pat</a>

        <a href="jack.php"><img src="images/mcdonald_cnu_profile_picture.jpg" alt="Jack McDonald"></a>
        <a href="jack.php">jack</a>

        <p>Image</p>
        <a href="ellie.php">ellie</a>



    </div>
</main>


