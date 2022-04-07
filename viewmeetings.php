<?php
include('db_connection.php');
global $conn;
include('header.php');
?>
<section>
    <h2>Upcoming Meetings</h2>
    <dl>
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
        <dt>Brett Kropinski: Spring Advising (virtual)</dt>
        <dd>October 15, 2021 12:30-1:00pm</dd>
    </dl>
</section>
<section>
    <a href="schedulemeeting.html">Schedule New Meeting</a>
    <a href="updatemeeting.html">Update or Cancel Meeting</a>
    <a href="joinmeeting.html">Join Virtual Meeting</a>
    <a href="calendar.html">Go to Google Calendar</a>
</section>

</body>
</html>