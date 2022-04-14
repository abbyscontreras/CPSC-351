<?php
include('db_connection.php');
global $conn;
include('header.php');
$user = $_SESSION['user'];
if (isset($_POST['Update'])) {
    $advisorStatus = $_POST['advisorStatus'];
    $email = $_POST['Email'];
    $phone = $_POST['Phone'];
    $office = $_POST['Office'];
    $bio = $_POST['Bio'];
    $courses = $_POST['Courses'];
    $img = $_POST['Img'];
//    $sql = "update professor set advisorStatus = '$advisorStatus', email = '$email' , phoneNumber = '$phone', office = '$office', biography = '$bio', courses_teaching = '$courses', professor_img = '$img' where facultyID = '$user'";
//    if (mysqli_query($conn, $sql)) {
//        echo "<h3>data stored in a database successfully.</h3>";
//    } else {
//        echo "ERROR: Hush! Sorry $sql. "
//            . mysqli_error($conn);
//    }

    $sql = "UPDATE professor SET ";
    if(!empty($advisorStatus)) {
        $sql .= "advisorStatus= '$advisorStatus',";
    }
    if(!empty($email)) {
        $sql .= "email= '$email',";
    }
    if(!empty($phone)) {
        $sql .= "phonNumber= '$phone',";
    }
    if(!empty($office)) {
        $sql .= "office= '$office',";
    }
    if(!empty($bio)) {
        $sql .= "biography= '$bio',";
    }
    if(!empty($courses)) {
        $sql .= "courses_teaching= '$courses',";
    }
    if(!empty($img)) {
        $sql .= "professor_img= '$img',";
    }

// strip off any extra commas on the end
    $sql = rtrim($sql, ',');

    $sql .= "WHERE facultyID = '$user'";
    if (mysqli_query($conn, $sql)) {
            echo "<h3>data stored in a database successfully.</h3>";
        } else {
            echo "ERROR: Hush! Sorry $sql. "
                . mysqli_error($conn);
        }
}
?>
<div id="wrapper">
    <main>
        <h2>Update Profile</h2>
        <form method="post" action="">
            <p>Are you an advisor?</p>
            <input type="radio" name="advisorStatus" id="advisorStatus" value="yes">
            <label for="advisorStatus">Yes</label>
            <input type="radio" name="advisorStatus" id="advisorStatus" value="no">
            <label for="advisorStatus">No</label>
            <br><br>

            <label for="Email">Email:</label>
            <input type="email" name="Email" id="Email">
            <br><br>

            <label for="Phone">Phone Number:</label>
            <input type="text" name="Phone" id="Phone">
            <br><br>

            <label for="Office">Office:</label>
            <input type="text" name="Office" id="Office">
            <br><br>

            <label for="Bio">Biography:</label>
            <input type="text" name="Bio" id="Bio">
            <br><br>

            <label for="Courses">Courses Teaching:</label>
            <input type="text" name="Courses" id="Courses">
            <br><br>

            <label for="Img">Profile Picture:</label>
            <input type="file" name="Img" id="Img">
            <br><br>

            <button name="Update" type="submit" class="btn">Update Profile</button>

        </form>
        <a href="profileinfo.php">
            <button name="goBack" class="btn">Go Back</button>
        </a>
    </main>
</div>
</body>

</html>
