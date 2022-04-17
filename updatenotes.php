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
                <textarea value="notes" name="notes"></textarea><br><br>
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
    $sql = "insert into advisingNotes";"
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