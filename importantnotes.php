<?php
include('db_connection.php');
global $conn;
include('header.php');
?>
<div id="wrapper">
    <main>
        <h2>Meeting Important Notes</h2>
        <table>
            <tr>
                <th>Student</th>
                <th>Date</th>
                <th>Notes</th>
            </tr>
            <?php
            $user = $_SESSION['user'];
            $student_ID = $_SESSION['student_ID'];
            $sql = mysqli_query($conn, "Select * from advisingNotes where advisingMeeting_professor_facultyID='$user' and advisingMeeting_Student_student_ID='$student_ID'");
            while ($row = mysqli_fetch_array($sql)) {
                echo "<tr><td>";
                echo $row['coursesub'];
                echo "</td><td>";
                echo $row['dateAndTime'];
                echo "</td><td>";
                echo $row['meetNotes'];
                echo "</td></tr>";
            }
            ?>
        </table>
        <br><br>
        <a href="updatenotes.php">
            <button name="update" class="btn">Update Notes</button>
        </a>
        <a href="studentmeetingnotes.php">
            <button name="goBack" class="btn">Go Back</button>
        </a>
    </main>
</div>