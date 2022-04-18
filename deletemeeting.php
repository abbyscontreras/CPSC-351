<?php
include('db_connection.php');
global $conn;
include('header.php');
$user = $_SESSION['user'];
?>
    <div id="wrapper">
        <main>
            <h2>Cancel Meeting</h2>
            <form method="post">
                <div>
                    <label for="student" class="mb-2">Select a student you would like to delete a meeting
                        for:</label><br><br>
                    <select name="student" required>
                        <?php
                        $sql = mysqli_query($conn, "SELECT * FROM Student WHERE fk_facultyID='$user'");
                        while ($row = mysqli_fetch_array($sql)) {
                            $firstname = $row['first_name'];
                            $lastname = $row['last_name'];
                            $studentID = $row['student_ID'];
                            echo '<option value="' . $studentID . '">' . $firstname . ' ' . $lastname . '</option>';
                        }
                        ?>
                    </select><br><br>
                    <button type="submit" name="deletestudentmeet" class="btn btn-md btn-secondary mb-4">Go to Cancel
                        Meeting
                    </button>
                </div>
            </form>
            <a href="viewmeetings.php">
                <button name="goBack" class="btn">Go Back</button>
            </a>
        </main>
    </div>
<?php
if (isset($_POST['deletestudentmeet'])) {
    $_SESSION['student'] = $_POST['student'];
    echo '<script type="text/javascript"> window.open("deletemeeting2.php","_self");</script>';
}
?>