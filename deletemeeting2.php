<?php
include('db_connection.php');
global $conn;
include('header.php');
$user = $_SESSION['user'];
?>
    <div id="wrapper">
        <main>
            <a href="deletemeeting.php">
                <button name="goBack" class="btn">Go Back</button>
            </a>
            <h2>Cancel Meeting</h2>
            <form method="post">
                <div>
                    <label for="dt" class="mb-2">Select a meeting time you would like to delete:</label><br><br>
                    <select name="dt" required>
                        <?php
                        $student = $_SESSION['student'];
                        $sql = mysqli_query($conn, "SELECT * FROM advisingMeeting WHERE professor_facultyID ='$user' and meetDateTIme > CURRENT_TIMESTAMP() and Student_student_ID='$student' order by advisingMeeting.meetDateTime DESC;");
                        while ($row = mysqli_fetch_array($sql)) {
                            $subject = $row['meetSubject'];
                            $location = $row['meetLocation'];
                            $dateTime = $row['meetDateTIme'];
                            echo '<option value="' . $dateTime . '">' . $dateTime . ' ' . $subject . ', ' . $location . '</option>';
                        }
                        ?>
                    </select><br><br>
                    <button type="submit" name="deletemeeting" class="btn btn-md btn-secondary mb-4">Cancel Meeting
                    </button>
                </div>
            </form>
        </main>
    </div>
<?php
if (isset($_POST['deletemeeting'])) {
    $dt = $_POST['dt'];
    $sql1 = mysqli_query($conn, "SET FOREIGN_KEY_CHECKS=0;");
    $sql2 = mysqli_query($conn, "delete from advisingNotes where dateAndTime='$dt' and advisingMeeting_Student_student_ID='$student' and advisingMeeting_professor_facultyID='$user'");
    $sql3 = mysqli_query($conn, "delete from advisingMeeting where Student_student_ID='$student' and meetDateTIme='$dt' and professor_facultyID='$user'");
    $sql4 = mysqli_query($conn, "SET FOREIGN_KEY_CHECKS=1;");
    echo '<script>alert("Meeting is Cancelled")</script>';
    echo '<script type="text/javascript"> window.open("viewmeetings.php","_self");</script>';
}
?>