<?php
include('db_connection.php');
global $conn;
include('header.php');
?>
<div id="wrapper">
    <main>
        <div class="btn-group">
            <a href="schedulemeeting.php">
                <button name="scheduleMeeting" class="btn">Schedule Meeting</button>
            </a>
            <a href="updatemeeting.php">
                <button name="updateMeeting" class="btn">Update/Cancel Meeting</button>
            </a>
            <a href="https://meet.google.com/" target="_blank">
                <button name="joinMeeting" class="btn">Virtual Meeting</button>
            </a>
            <a href="https://calendar.google.com/calendar/" target="_blank">
                <button name="calendar" class="btn">Google Calendar</button>
            </a>
        </div>
        <section>
            <div class="grid-container">
                <div class="grid-item">
                    <h2>Upcoming Meetings</h2>
                    <dl>
                        <?php
                        if (isset($_SESSION['user'])) {
                            $user = $_SESSION['user'];
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
                            }
                        }
                        ?>
                    </dl>
                </div>
                <div class="grid-item">
                    <h2>Past Meetings</h2>
                    <dl>
                        <?php
                        if (isset($_SESSION['user'])) {
                            $user = $_SESSION['user'];
                            $sql = mysqli_query($conn, "SELECT advisingMeeting.*, Student.first_name, Student.last_name FROM advisingMeeting INNER JOIN Student ON advisingMeeting.Student_student_ID=Student.student_ID WHERE advisingMeeting.professor_facultyID ='$user' and advisingMeeting.meetDateTIme < CURRENT_TIMESTAMP() order by advisingMeeting.meetDateTime DESC;");
                            while ($row = mysqli_fetch_array($sql)) {
                                $firstname = $row['first_name'];
                                $lastname = $row['last_name'];
                                $subject = $row['meetSubject'];
                                $location = $row['meetLocation'];
                                $dateTime = $row['meetDateTIme'];
                                echo "<dt>" . $firstname . " " .$lastname. " - " . $subject . ": " . $location . "</dt>";
                                echo "<dd>" . $dateTime . "</dd>";
                            }
                        }
                        ?>
                    </dl>
                </div>

            </div>
        </section>
    </main>
</div>

</body>
</html>