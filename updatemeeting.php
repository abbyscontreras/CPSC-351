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
//    $sql="SELECT student_ID FROM Student order by student_ID";
//    echo "<select name=studentID value=''>Student ID</option>";
//    foreach ($sql->query($sql) as $row){
//        echo "<option value=$row[student_id]>$row[name]</option>";
//    }
//    echo "</select>";
//if (isset($_POST['StudentID'])) {
//    $sql = "UPDATE advisingMeeting SET ";
//    if(!empty($meetDateTIme)) {
//        $sql .= "Date/Time= '$meetDateTIme',";
//    }
//    if(!empty($meetLocation)) {
//        $sql .= "Location= '$meetLocation',";
//    }
//    if(!empty($meetSubject)) {
//        $sql .= "Subject= '$meetSubject',";
//    }
//    $sql = rtrim($sql, ',');
//}
//



?>
<div id="wrapper">
    <main>
        <h2>Update or Cancel a Meeting</h2>
        <h2>Upcoming Meetings</h2>
        <dl>
            <?php
            if (isset($_SESSION['user'])) {
                $sql = mysqli_query($conn, "SELECT advisingMeeting.*, Student.first_name, Student.last_name FROM advisingMeeting INNER JOIN Student ON advisingMeeting.Student_student_ID=Student.student_ID WHERE advisingMeeting.professor_facultyID ='$user' and advisingMeeting.meetDateTIme > CURRENT_TIMESTAMP() order by advisingMeeting.meetDateTime DESC;");
                while ($row = mysqli_fetch_array($sql)) {
                    $firstname = $row['first_name'];
                    $lastname = $row['last_name'];
                    $studentID = $row['Student_student_ID'];
                    $subject = $row['meetSubject'];
                    $location = $row['meetLocation'];
                    $dateTime = $row['meetDateTIme'];
                    echo "<dt>" . $firstname . " " .$lastname. " - " . $subject . ": " . $location . "</dt>";
                    echo "<dd>" . $dateTime . "</dd>";
                    echo "<form method='post'>
                            <button type='sumbit' name='update' value='.$dateTime.'>Update</button> Cancel:<input type='checkbox' name='check' value='.$dateTime.'></form>";
                    echo "<br>";


                }

            }

            if(isset($_POST['delete'])){
                $checkbox = $_POST['check'];
                for($i=0;$i<count($checkbox);$i++){
                    $del_id = $checkbox[$i];
                    mysqli_query($conn,"DELETE FROM advisingMeeting WHERE userid='".$del_id."'");
                    $message = "Data deleted successfully !";
                }

//
//                    mysqli_query($conn, query: "DELETE FROM advisingNotes where dateAndTime = ''");
//                    mysqli_query($conn, query: "DELETE FROM advisingMeeting where meetDateTIme = '$dateTime'");
//
//                }
            }
            ?>
        </dl>
        <form method="post" action="">
            <button type="submit" name="delete">Delete Selected meetings</button>
            <div><?php if(isset($message)) { echo $message; } ?></div>

<!--            <label for="subjectEmail">Subject: Advising Meeting CHANGED</label>-->
<!--            <input type="text" name="subjectEmail" id="subjectEmail" required>-->
<!--            <br><br>-->
<!---->
<!--            <label for="userComments">Comments:</label>-->
<!--            <textarea name="userComments" id="userComments" rows="2" cols="30">-->
<!--        </textarea>-->
<!--            <br><br>-->
<!---->
<!---->
<!--            <input type="submit" value="Go Back">-->
<!--            <input type="submit" value="Submit">-->

        </form>
    </main>
</div>