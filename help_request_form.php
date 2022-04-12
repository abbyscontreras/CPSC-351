<?php
include('db_connection.php');
global $conn;
include('header.php');

?>
<div id="wrapper">
    <main>
        <a href="help.php"><button name="goBack" class="btn">Go Back</button></a>
        <h2>Submit a Help Request</h2>
        <form method="post" action="">
            <label for="toEmail">To:</label>
            <input type="email" name="toEmail" id="toEmail" required>
            <br><br>

            <label for="subjectEmail">Subject:</label>
            <input type="text" name="subjectEmail" id="subjectEmail" required>
            <br><br>

            <label for="userComments">Comments:</label>
            <textarea name="userComments" id="userComments" rows="2" cols="30">
        </textarea>
            <br><br>


            <button name="help" type="submit" class="btn">Submit Request</button>

        </form>
    </main>
</div>
</body>

</html>
