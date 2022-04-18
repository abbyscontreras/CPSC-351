<?php
include('db_connection.php');
global $conn;
include('header.php');
$user = $_SESSION['user'];
$student = $_SESSION['student'];
?>
<div id="wrapper">
    <main>
        <h2>Schedule Meeting for <?php echo $student ?></h2>
        <form method="post" action="">
            <div>
                <label for="datetime">Date and Time:</label>
                <input type="datetime-local" name="datetime" id="datetime" required>
                <br><br>
                <label for="subject">Subject:</label>
                <input type="text" name="subject" id="subject" required>
                <br><br>
                <label for="Location">Location:</label>
                <input type="text" name="location" id="location" required>
                <br><br>
                <button type="submit" name="insertmeeting" class="btn btn-md btn-secondary mb-4">Create New Meeting
                </button>
            </div>
        </form>
        <a href="schedulemeeting.php">
            <button name="goBack" class="btn">Go Back</button>
        </a>
    </main>
</div>
<?php
if (isset($_POST['insertmeeting'])) {
    $datetime = $_POST['datetime'];
    $subject = $_POST['subject'];
    $location = $_POST['location'];
    echo $datetime;
    echo $subject;
    echo $location;
    echo $student;
    $sql = mysqli_query($conn, "insert into advisingMeeting values ('$datetime', '$location', '$subject', '$student', '$user')");
    echo '<script>alert("Meeting is Created")</script>';
    echo '<script type="text/javascript"> window.open("viewmeetings.php","_self");</script>';
}
?>