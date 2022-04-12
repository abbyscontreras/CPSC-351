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
                            $sql = mysqli_query($conn, "select * from advisingMeeting where professor_facultyID='$user' and meetDateTIme > CURRENT_TIMESTAMP() order by meetDateTime DESC");
                            while ($row = mysqli_fetch_array($sql)) {
                                $studentID = $row['Student_student_ID'];
                                $subject = $row['meetSubject'];
                                $location = $row['meetLocation'];
                                $dateTime = $row['meetDateTIme'];
                                echo "<dt>" . $studentID . " - " . $subject . ": " . $location . "</dt>";
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
                            $sql = mysqli_query($conn, "select * from advisingMeeting where professor_facultyID='$user' and meetDateTIme < CURRENT_TIMESTAMP() order by meetDateTime DESC");
                            while ($row = mysqli_fetch_array($sql)) {
                                $studentID = $row['Student_student_ID'];
                                $subject = $row['meetSubject'];
                                $location = $row['meetLocation'];
                                $dateTime = $row['meetDateTIme'];
                                echo "<dt>" . $studentID . " - " . $subject . ": " . $location . "</dt>";
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