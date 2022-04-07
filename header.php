<?php session_start();
include('db_connection.php');
global $conn
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CNU Archway</title>
</head>

<body>
<header>
    <div class="head">
        <img src="../images/logocnu.png"/>
        <h1>CNU Archway</h1>
    </div>


    <div class="centered">
    <nav id="header-table">
    <ul>
        <li><a href="advising.html">Advising</a>
            <ul>
                <li><a href="advisee_list.html">Advisee List</a></li>
                <li><a href="viewmeetings.html">Meetings</a></li>
                <li><a href="importantnotes.html">Important Notes</a></li>
            </ul>
        </li>

        <li><a href="registration.html">Registration</a>
            <ul>
                <li><a href="classavailability.html">Class Availability</a></li>
            </ul>

        </li>
        <li><a href="account.html">Account</a>
        </li>
        <li><a class="logout" href="logout.php">Logout</a>
        </li>

    </ul>
    </nav>
    </div>
</header>

