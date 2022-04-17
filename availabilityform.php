<?php
include('db_connection.php');
global $conn;
include('header.php');

?>
<div id="wrapper">
    <main>
        <h2>Schedule of Classes</h2>
        <form method="post" action="">
            <label for="desiredcourse">Desired Course</label>
            <input type="text" name="desiredcourse" id="desiredcourse" required>
            <br><br>

            <label for="discipline">Discipline</label>
            <input type="text" name="discipline" id="discipline">
            <br><br>

            <label for="any">Any</label>
            <input type="text" name="any" id="any">
            <br><br>


            <input type="submit" value="Go Back">
            <input type="submit" value="Submit">

        </form>
    </main>
</div>
