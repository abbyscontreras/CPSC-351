<?php
include('db_connection.php');
global $conn;
include('header.php');
$user = $_SESSION['user'];
?>
<div id="wrapper">
    <main>
        <h2>Update Notes</h2>
        <form method="post">
            <div>
                <label for="dt" class="mb-2">Select a date and time you would like to add notes for:</label><br><br>
                <select name="dt"required>
                    <?php
                    $student_ID = $_SESSION['student_ID'];
                    $sql = mysqli_query($conn, "select * from advisingMeeting where professor_facultyID = '$user' and Student_student_ID='$student_ID'");
                    while ($row = mysqli_fetch_array($sql)) {
                        $datetime = $row['meetDateTIme'];
                        echo '<option value="' . $datetime . '">' . $datetime .'</option>';
                    }
                    ?>
                </select><br><br>
                <label for="notes">Notes:</label>
                <textarea name="notes"></textarea><br><br>
                <button type="submit" name="updatenotes" class="btn btn-md btn-secondary mb-4">Update
                </button>
            </div>
        </form>
        <a href="importantnotes.php">
            <button name="goBack" class="btn">Go Back</button>
        </a>
    </main>
</div>
<?php
if (isset($_POST['updatenotes'])) {
    $datetime = $_POST['dt'];
    $notes = $_POST['notes'];
    $sql = mysqli_query($conn, "INSERT INTO advisingNotes VALUES ('$datetime', '$notes', '$student_ID', '$user')");
}
?>