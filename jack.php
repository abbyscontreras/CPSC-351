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
$id = $_GET['student_select'];

$sql = mysqli_query($conn, "select * from Student where fk_facultyID='$user' and student_ID='$id'");

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

?>
<div id="wrapper">
    <div id="namepic">
    <h2><?php echo $fname. " " . $lname ?></h2>
        <img class="profile" src="images/mcdonald_cnu_profile_picture.jpg" alt="Jack McDonald">

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
        <p>on track to graduate in the spring
        </p>
        <h2>Upcoming meetings</h2>
        <p>Spring Advising (virtual)
            October 15, 2021
            12:30pm-1:00pm
        </p>
        <h3>specific notes:</h3>
        <p>Meeting Date: October 15, 2021
            Topic: Spring Advising
            Notes: Missing Capstone, other wise ready to go.
            Overall is on track for graduation</p>
    </div>
</div>