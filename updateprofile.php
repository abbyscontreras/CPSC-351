<?php
include('db_connection.php');
global $conn;
include('header.php');

?>
<div id="wrapper">
    <main>
        <a href="profileinfo.php">
            <button name="goBack" class="btn">Go Back</button>
        </a>
        <h2>Update Profile</h2>
        <form method="post" action="../incognito/profile.inc.php">
            <p>Are you an advisor?</p>
            <input type="radio" name="advisorStatus" id="advisorStatus">
            <label for="advisorStatus">Yes</label>
            <input type="radio" name="advisorStatus" id="advisorStatus">
            <label for="advisorStatus">No</label>
            <br><br>

            <label for="Email">Email:</label>
            <input type="email" name="Email" id="Email">
            <br><br>

            <label for="Phone">Phone Number:</label>
            <input type="text" name="Phone" id="Phone">
            <br><br>

            <label for="Office">Office:</label>
            <input type="text" name="Office" id="Office">
            <br><br>

            <label for="Bio">Biography:</label>
            <input type="text" name="Bio" id="Bio">
            <br><br>

            <label for="Courses">Courses Teaching:</label>
            <input type="text" name="Courses" id="Courses">
            <br><br>

            <label for="Img">Profile Picture:</label>
            <input type="file" name="Img" id="Img">
            <br><br>


            <button name="Update" type="submit" class="btn">Submit Request</button>

        </form>
    </main>
</div>
</body>

</html>
