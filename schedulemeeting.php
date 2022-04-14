<?php
include('db_connection.php');
global $conn;
include('header.php');

?>
<div id="wrapper">
    <main>
        <h2>Submit a Meeting Request</h2>
        <form method="post" action="">
            <label for="toEmail">To:</label>
            <input type="email" name="toEmail" id="toEmail" required>
            <br><br>

            <label for="subjectEmail">Subject: Advising Meeting REQUEST</label>
            <input type="text" name="subjectEmail" id="subjectEmail" required>
            <br><br>

            <label for="userComments">Comments:</label>
            <textarea name="userComments" id="userComments" rows="2" cols="30">
        </textarea>
            <br><br>


            <input type="submit" value="Go Back">
            <input type="submit" value="Submit">

        </form>
    </main>
</div>