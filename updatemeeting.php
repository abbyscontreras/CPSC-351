<?php
include('db_connection.php');
global $conn;
include('header.php');

$user = $_SESSION['user'];
if (isset($_POST['Update'])) {
    $student_ID = $_POST['StudentID'];
    $meetDateTIme = $_POST['Date/Time'];
    $meetLocation = $_POST['Location'];
    $meetSubject = $_POST['Subject'];

}
//  $sql = mysqli_query($conn, "select * from advisingMeeting where Student_student_ID='$student_ID'");
    $sql="SELECT student_ID,meetDateTIme FROM Student order by student_ID";
    echo "<select name=studentID value=''>Student ID</option>";
    foreach ($sql->query($sql) as $row){
        echo "<option value=$row[student_id]>$row[name]</option>";
    }
    echo "</select>";
if (isset($_POST['StudentID'])) {
    $sql = "UPDATE advisingMeeting SET ";
    if(!empty($meetDateTIme)) {
        $sql .= "Date/Time= '$meetDateTIme',";
    }
    if(!empty($meetLocation)) {
        $sql .= "Location= '$meetLocation',";
    }
    if(!empty($meetSubject)) {
        $sql .= "Subject= '$meetSubject',";
    }
    $sql = rtrim($sql, ',');
}
?>
<div id="wrapper">
    <main>
        <h2>Update or Cancel a Meeting</h2>
<!--        Need to get this to match with above-->
<!--        <form method="post" action="">-->
<!--            <label for="toEmail">To:</label>-->
<!--            <input type="email" name="toEmail" id="toEmail" required>-->
<!--            <br><br>-->
<!---->
<!--            <label for="subjectEmail">Subject: Advising Meeting CHANGED</label>-->
<!--            <input type="text" name="subjectEmail" id="subjectEmail" required>-->
<!--            <br><br>-->
<!---->
<!--            <label for="userComments">Comments:</label>-->
<!--            <textarea name="userComments" id="userComments" rows="2" cols="30">-->
<!--        </textarea>-->
<!--            <br><br>-->


            <input type="submit" value="Go Back">
            <input type="submit" value="Submit">

        </form>
    </main>
</div>