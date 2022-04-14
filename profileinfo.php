<?php
//include('db_connection.php');
//global $conn;
include('header.php');
global $conn;
?>
<body>
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
                        echo $fname . " " . $lname;
                        echo '<img src="data:image;base64,' . base64_encode($row['professor_img']) . 'alt="Image">';
                    }
                }
                ?></h1>
            <!--            <img src="" alt="">-->
            <!--            <img src="images/lapke_cnu_profile_picture.jpeg" alt="Michael Lapke">-->
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
</body>
</html>