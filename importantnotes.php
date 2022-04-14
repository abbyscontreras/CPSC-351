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
            $sql = mysqli_query($conn, "Select advisingNotes.*, Student.first_name, Student.last_name from advisingNotes inner join Student on advisingNotes.advisingMeeting_Student_student_ID where advisingMeeting_professor_facultyID='$user'");
            while ($row = mysqli_fetch_array($sql)) {
                echo "<tr><td>";
                echo $row['first_name']." ".$row['last_name'];
                echo "</td><td>";
                echo $row['dateAndTime'];
                echo "</td><td>";
                echo $row['meetNotes'];
                echo "</td></tr>";
            }
            ?>
            <tr>
                <td>Student: Jack McDonald</td>
                <td>1/14/22</td>
                <td>Is doing well, but keep an eye on grades, set up later meetings for help.</td>
            </tr>
            <tr>
                <td>Student: Abby Contreras</td>
                <td>1/7/22</td>
                <td>On top of everything, very driven.</td>
            </tr>
            <tr>
                <td>Course Update: CPSC 255</td>
                <td>12/29/21</td>
                <td>This course is now being offered in both Fall and Spring semesters, as well as the May Semester.
                </td>
            </tr>
            <tr>
                <td>New Course Alert: AMST 218</td>
                <td>12/15/21</td>
                <td>“Aftermath of World War 1” is now being taught by Jeffrey Morrison in the Spring Semester of 2022.
                </td>
            </tr>
            <tr>
                <td>Student: Brett Kropinski</td>
                <td>8/20/21</td>
                <td>Transferred. Has enough credits but needs to fulfill major reqs.</td>
            </tr>

        </table>
    </main>
</div>