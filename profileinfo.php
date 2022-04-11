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
                $sql = mysqli_query($conn, "select * from professor where facultyID='123456'");
                while ($row = mysqli_fetch_array($sql)) {
                    $fname = $row['first_name'];
                    $lname = $row['last_name'];
                    echo $fname . " " . $lname;
//                        echo '<img src="data:image;base64,' . base64_encode($row['img_dir']) . 'alt="Image">';
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
                    $sql = mysqli_query($conn, "select * from professor where facultyID='123456'");
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
                    $sql = mysqli_query($conn, "select * from professor where facultyID='123456'");
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
                    $sql = mysqli_query($conn, "select * from professor where facultyID='123456'");
                    while ($row = mysqli_fetch_array($sql)) {
                        $office = $row['office'];
                        $phone = $row['phoneNumber'];
                        $email = $row['email'];
//                        echo <p>Office: Luter Hall 331<br></p>
//            <p>Phone: (757) 594-8921</p>
//            <p>Email: michael.lapke@cnu.edu</p>;
                    }
                }
                ?>

<!--            <h3>Education</h3>-->
<!--            <ul>-->
<!--                <li>BS in Computer and Information Science, University of North Florida</li>-->
<!--                <li>MS in Computer and Information Science, University of North Floria</li>-->
<!--                <li>PhD in Information Systems, Virginia Commonwealth University</li>-->
<!--            </ul>-->
            <h3>Prior Teaching Experience</h3>
            <p>Michael Lapke has served as a business professor at University of Mary Washington for over 15 years before
                joining the CNU family.
            </p>
            <h3>Currently Teaching</h3>
            <p>CPSC 350 and CPSC 351</p>
            <h3>Contact Information</h3>
            <p>Office: Luter Hall 331<br></p>
            <p>Phone: (757) 594-8921</p>
            <p>Email: michael.lapke@cnu.edu</p>
        </section>
    </main>
</div>
</body>
</html>