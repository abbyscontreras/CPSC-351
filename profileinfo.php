<?php
//include('db_connection.php');
//global $conn;
include('header.php');
global $conn;
?>
<div id="wrapper">
    <main>
        <section>
            <h1>
                <?php
                if (isset($_SESSION['user'])) {
                    $user = $_SESSION['user'];
                    $sql = mysqli_query($conn, "select * from professor where facultyID='$user'");
                    while ($row = mysqli_fetch_array($sql)) {
                        $fname = $row['first_name'];
                        $lname = $row['last_name'];
                        $pimg = $row['professor_img'];
                        echo $fname . " " . $lname;
                        echo "<img src='$pimg' . alt='Professor Image' >";
//                        echo '<img src="data:image/jpeg;base64,' . base64_encode($row['professor_img']) . 'alt="Professor Image">';
                    }
                }
                ?></h1>
        </section>
        <section>
            <h3>Biography</h3>
            <p>
                <?php
                if (isset($_SESSION['user'])) {
                    $user = $_SESSION['user'];
                    $sql = mysqli_query($conn, "select * from professor where facultyID='$user'");
                    while ($row = mysqli_fetch_array($sql)) {
                        $bio = $row['biography'];
                        echo $bio;
                    }
                }
                ?>
            </p>
            <h3>Currently Teaching</h3>
            <p>
                <?php
                if (isset($_SESSION['user'])) {
                    $user = $_SESSION['user'];
                    $sql = mysqli_query($conn, "select * from professor where facultyID='$user'");
                    while ($row = mysqli_fetch_array($sql)) {
                        $courses = $row['courses_teaching'];
                        echo $courses;
                    }
                }
                ?>
            </p>
            <h3>Contact Information</h3>
            <p>
                <?php
                if (isset($_SESSION['user'])) {
                    $user = $_SESSION['user'];
                    $sql = mysqli_query($conn, "select * from professor where facultyID='$user'");
                    while ($row = mysqli_fetch_array($sql)) {
                        $office = $row['office'];
                        $phone = $row['phoneNumber'];
                        $email = $row['email'];
                        echo "Office: " . $office . "<br>";
                        echo "Phone: " . $phone . "<br>";
                        echo "Email: " . $email . "<br>";
                    }
                }
                ?>
        </section>
        <a href="updateprofile.php">
            <button name="update" class="btn">Update Profile</button>
        </a>
    </main>
</div>