<?php
include('db_connection.php');
global $conn;
include('header.php');
?>
<div id="wrapper">
    <main>
        <section>
            <h2>Upcoming Meetings</h2>
            <dl>
                <?php
                if (isset($_SESSION['user'])) {
                    $user = $_SESSION['user'];
                    $sql = mysqli_query($conn, "select * from advisingMeeting where professor_facultyID='$user' and meetDateTIme > CURRENT_TIMESTAMP()");
                    while ($row = mysqli_fetch_array($sql)) {
                        $studentID = $row['Student_student_ID'];
                        $subject = $row['meetSubject'];
                        $location = $row['meetLocation'];
                        $dateTime = $row['meetDateTIme'];
                        echo "<dt>". $studentID." - ".$subject.": ".$location. "</dt>";
                        echo "<dd>". $dateTime."</dd>";
                    }
                }
                ?>
                <dt>Patrick Tehan: Current Semester Advising (virtual)</dt>
                <dd>January 14, 2022 2:00-2:30pm</dd>
                <dt>Jack McDonald: Fall Advising (in person)</dt>
                <dd>February 28, 2022 4:00-4:30pm</dd>
                <dt>Eleanor Miley: Fall Advising(virtual)</dt>
                <dd>February 28, 2022 4:30-5:00pm</dd>
                <dt>Abigail Contreras: Fall Advising (in-person)</dt>
                <dd>February 28, 2022 5:00-5:30pm</dd>
            </dl>
            <h2>Past Meetings</h2>
            <dl>
                <?php
                if (isset($_SESSION['user'])) {
                    $user = $_SESSION['user'];
                    $sql = mysqli_query($conn, "select * from advisingMeeting where professor_facultyID='$user' and meetDateTIme < CURRENT_TIMESTAMP()");
                    while ($row = mysqli_fetch_array($sql)) {
                        $studentID = $row['Student_student_ID'];
                        $subject = $row['meetSubject'];
                        $location = $row['meetLocation'];
                        $dateTime = $row['meetDateTIme'];
                        echo "<dt>". $studentID." - ".$subject.": ".$location. "</dt>";
                        echo "<dd>". $dateTime."</dd>";
                    }
                }
                ?>
                <dt>Brett Kropinski: Spring Advising (virtual)</dt>
                <dd>October 15, 2021 12:30-1:00pm</dd>
            </dl>
        </section>
        <section>
            <a href="schedulemeeting.php">Schedule New Meeting</a>
            <a href="updatemeeting.php">Update or Cancel Meeting</a>
            <a href="joinmeeting.php">Join Virtual Meeting</a>
            <a href="calendar.php">Go to Google Calendar</a>
        </section>
    </main>
</div>

</body>
</html>