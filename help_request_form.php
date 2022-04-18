<?php
include('db_connection.php');
global $conn;
include('header.php');
if (isset($_POST["help"])) {
    mail("", "CNU Archway Help Request",
        $_POST["userComments"] . "From: jane@janedoe.com");
}
?>
    <div id="wrapper">
        <main>
            <h2>Submit a Help Request</h2>
            <p>Please describe the issue you are having with as much detail as possible in the space below.
                We will do our best to get back to you in a timely manner.</p>
            <form method="post" action="">
                <label for="userComments"> </label>
                <textarea name="userComments" id="userComments" rows="20" cols="100"></textarea>
                <br><br>
                <button name="help" type="submit" class="btn">Submit Request</button>
            </form>
            <a href="help.php">
                <button name="goBack" class="btn">Go Back</button>
            </a>
        </main>
    </div>
<?php
if (isset($_POST['userComments'])) {
    echo '<script>alert("Your help request has been submitted.")</script>';
    echo '<script type="text/javascript"> window.open("help.php","_self");</script>';
}
?>