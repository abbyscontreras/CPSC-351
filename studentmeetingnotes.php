<?php
include('db_connection.php');
global $conn;
include('header.php');
?>
    <div id="wrapper">
        <main>
            <form method="post">
                <div>
                    <label for="student" class="mb-2">Select a student you would like view meeting notes
                        for:</label><br><br>
                    <select name="student" required>
                        <?php
                        $user = $_SESSION['user'];
                        $sql = mysqli_query($conn, "select * from Student where fk_facultyID = '$user'");
                        while ($row = mysqli_fetch_array($sql)) {
                            $fname = $row['first_name'];
                            $lname = $row['last_name'];
                            echo '<option value="' . $row['student_ID'] . '">' . $fname . ' ' . $lname . '</option>';
                        }
                        ?>
                    </select><br><br>
                    <button type="submit" name="viewstudent" class="btn btn-md btn-secondary mb-4">View Student Meeting
                        Notes
                    </button>
                </div>
            </form>
        </main>
    </div>
<?php
if (isset($_POST['viewstudent'])) {
    $_SESSION['student_ID'] = $_POST['student'];
    header('location:importantnotes.php');
}
?>