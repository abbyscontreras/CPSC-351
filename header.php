<?php
session_start();
include('db_connection.php');
global $conn
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CNU Archway</title>
</head>

<body>
<header>
    <div class="head">
        <a href="index.php"><img src="../images/logocnu.png"/></a>
        <h1>CNU Archway</h1>
    </div>


    <div class="centered">
        <nav id="header-table">
            <ul>
                <li><a href="advising.php">Advising</a>
                    <ul>
                        <li><a href="advisee_list.php">Advisee List</a></li>
                        <li><a href="viewmeetings.php">Meetings</a></li>
                        <li><a href="studentmeetingnotes.php">Important Notes</a></li>
                    </ul>
                </li>

                <li><a href="registration.php">Registration</a>
                    <ul>
                        <li><a href="classavailability.php">Class Availability</a></li>
                    </ul>

                </li>
                <li><a href="account.php">Account</a>
                    <ul>
                        <li><a href="profileinfo.php">Profile</a></li>
                        <li><a href="https://gmail.com/">Inbox</a></li>
                        <li><a href="help.php">Help</a></li>

                    </ul>
                </li>
                <li><a class="logout" href="logout.php">Logout</a>
                </li>

            </ul>
        </nav>
    </div>
</header>

