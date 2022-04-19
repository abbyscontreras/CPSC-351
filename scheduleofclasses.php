<?php
include('db_connection.php');
global $conn;
include('header.php');
?>
<div id="wrapper">
    <main id="scrolling">
        <section>
            <a href="availabilityform.php">
                <button name="goBack" class="btn">Go Back</button>
            </a>
            <table id="coursetable">
                <tr>
                    <th>CRN</th>
                    <th>Course</th>
                    <th>Section</th>
                    <th>Title</th>
                    <th>Credits</th>
                    <th>Area of LLC</th>
                    <th>Days</th>
                    <th>Time</th>
                    <th>Location</th>
                    <th>Instructor</th>
                </tr>
                <?php
                if (isset($_SESSION['course'])) {
                    $course = $_SESSION['course'];
                    $sql = mysqli_query($conn, "Select * from coursesAvailable where course like '{$course}%' order by course asc");
                    while ($row = mysqli_fetch_array($sql)) {
                        echo "<tr><td>";
                        echo $row['CRN'];
                        echo "</td><td>";
                        echo $row['course'];
                        echo "</td><td>";
                        echo $row['section'];
                        echo "</td><td>";
                        echo $row['courseTitle'];
                        echo "</td><td>";
                        echo $row['credits'];
                        echo "</td><td>";
                        echo $row['areaofLLC'];
                        echo "</td><td>";
                        echo $row['days'];
                        echo "</td><td>";
                        echo $row['time'];
                        echo "</td><td>";
                        echo $row['location'];
                        echo "</td><td>";
                        echo $row['instructor'];
                        echo "</td></tr>";
                    }
                    unset ($_SESSION['course']);
                }
                if (isset($_SESSION['llc'])) {
                    $llc = $_SESSION['llc'];
                    $sql2 = mysqli_query($conn, "Select * from coursesAvailable where areaofLLC = '$llc' order by course asc");
                    while ($row = mysqli_fetch_array($sql2)) {
                        echo "<tr><td>";
                        echo $row['CRN'];
                        echo "</td><td>";
                        echo $row['course'];
                        echo "</td><td>";
                        echo $row['section'];
                        echo "</td><td>";
                        echo $row['courseTitle'];
                        echo "</td><td>";
                        echo $row['credits'];
                        echo "</td><td>";
                        echo $row['areaofLLC'];
                        echo "</td><td>";
                        echo $row['days'];
                        echo "</td><td>";
                        echo $row['time'];
                        echo "</td><td>";
                        echo $row['location'];
                        echo "</td><td>";
                        echo $row['instructor'];
                        echo "</td></tr>";
                    }
                    unset ($_SESSION['llc']);
                }
                if (isset($_SESSION['all'])) {
                    $sql = mysqli_query($conn, "Select * from coursesAvailable order by course asc");
                    while ($row = mysqli_fetch_array($sql)) {
                        echo "<tr><td>";
                        echo $row['CRN'];
                        echo "</td><td>";
                        echo $row['course'];
                        echo "</td><td>";
                        echo $row['section'];
                        echo "</td><td>";
                        echo $row['courseTitle'];
                        echo "</td><td>";
                        echo $row['credits'];
                        echo "</td><td>";
                        echo $row['areaofLLC'];
                        echo "</td><td>";
                        echo $row['days'];
                        echo "</td><td>";
                        echo $row['time'];
                        echo "</td><td>";
                        echo $row['location'];
                        echo "</td><td>";
                        echo $row['instructor'];
                        echo "</td></tr>";
                    }
                    unset($_SESSION['all']);
                }
                ?>
            </table>
            <a href="availabilityform.php">
                <button name="goBack" class="btn">Go Back</button>
            </a>
        </section>
    </main>
</div>