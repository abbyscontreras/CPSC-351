<?php
include('db_connection.php');
global $conn;
include('header.php');


$user = $_SESSION['user'];
$fname='';
$lname='';
$studentID='';
$email='';
$entry_year='';
$expected_graduation='';
$major='';
$minor='';
$notes='';
$date_time='';
$meeting_time='';
$meeting_location='';
$meeting_subject='';
$id = $_GET['student_select'];
$sqlnotes =mysqli_query($conn, "select * from advisingNotes where advisingMeeting_professor_facultyID='$user' and advisingMeeting_Student_student_ID='$id'");
$sql = mysqli_query($conn, "select * from Student where fk_facultyID='$user' and student_ID='$id'");
$sqlmeeting =mysqli_query($conn, "select * from advisingMeeting where professor_facultyID='$user' and Student_student_ID='$id' and meetDateTIme > CURRENT_TIMESTAMP()");

    while ($row = mysqli_fetch_array($sql)) {
        $fname = $row['first_name'];
        $lname = $row['last_name'];
        $studentID = $row['student_ID'];
        $email= $row['email'];
        $entry_year = $row['entry_year'];
        $expected_graduation = $row['expected_graduation'];
        $major = $row['major'];
        $minor = $row['minor'];


}

    while ($row =mysqli_fetch_array($sqlnotes)){
        $notes = $row['meetNotes'];
        $date_time = $row['dateAndTime'];
    }



?>
<div id="wrapper">
    <div id="namepic">
    <h2><?php echo $fname. " " . $lname ?></h2>


    <table class="profiletable">
        <tr>
            <th></th>
            <th></th>
        </tr>

        <tr>
            <td>ID:</td>
            <td><?php echo $studentID ?></td>
        </tr>
        <tr>
            <td>E-mail:</td>
            <td><a href="mailto:<?php echo $email ?>"><?php echo $email ?></a> </td>
        </tr>
        <tr>
            <td>Entry Year:</td>
            <td><?php echo $entry_year ?></td>
        </tr>
        <tr>
            <td>Expected Graduation:</td>
            <td><?php echo $expected_graduation ?></td>
        </tr>
        <tr>
            <td>Major</td>
            <td><?php echo $major ?></td>
        </tr>
        <tr>
            <td>Minor</td>
            <td><?php echo $minor ?></td>
        </tr>
    </table>
    </div>
    <div id="student_notes">

        <h1>Notes:</h1>
        <p><?php echo $date_time." - ". $notes ?>
        </p>
        <h2>Upcoming meetings</h2>
        <p>Date & Time: | Location: | Subject: <br>
            <?php
            while ($row =mysqli_fetch_array($sqlmeeting)){
                $meeting_time = $row['meetDateTIme'];
                $meeting_location= $row['meetLocation'];
                $meeting_subject = $row['meetSubject'];
                echo '<div>'.$meeting_time." | (".$meeting_location .") | ".$meeting_subject.'</div>';
            }

            ?>
        </p>

    </div>
</div>