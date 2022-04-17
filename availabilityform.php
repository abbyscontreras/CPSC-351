<?php
include('db_connection.php');
global $conn;
include('header.php');

?>
<div id="wrapper">
    <main><br>
        <h2>Schedule of Classes for Fall Semester 2022</h2>
        <form method="post" action="">
            <p>Select a discipline you would like to view the Schedule of Classes for:</p>
            <label for="course">Desired Discipline</label>
            <select name="course" required>
                <?php
                $sql = mysqli_query($conn, "select distinct LEFT(course, 4) as course from coursesAvailable");
                while ($row = mysqli_fetch_array($sql)) {
                    $course = $row['course'];
                    echo '<option value="' . $course . '">' . $course . '</option>';
                }
                ?>
            </select><br><br>
            <button type="submit" name="coursesubmit" class="btn btn-md btn-secondary mb-4">View Available Courses
            </button>
        </form>
        <p>OR</p>


        <form method="post" action="">
            <p>Select a LLC you would like to view the Schedule of Classes for:</p>
            <label for="desiredLLC">LLC, AOI, WI, HNRS</label>
            <select name="desiredLLC" required>
                <?php
                $sql = mysqli_query($conn, "select distinct areaofLLC from coursesAvailable where areaofLLC IS NOT NULL");
                while ($row = mysqli_fetch_array($sql)) {
                    $areaofLLC = $row['areaofLLC'];
                    echo '<option value="' . $areaofLLC . '">' . $areaofLLC . '</option>';
                }
                ?>
            </select><br><br>
            <button type="submit" name="llcsubmit" class="btn btn-md btn-secondary mb-4">View Avaliable Courses
            </button>

        </form>


        <p>OR</p>


        <form method="post" action="">
            <p>View All Available Courses</p>
            <button type="submit" name="all" class="btn btn-md btn-secondary mb-4">View All Avaliable Courses
            </button>

        </form>
    </main>
</div>

<?php
if (isset($_POST['coursesubmit']))  {
    $_SESSION['course'] = $_POST['course'];
    echo '<script type="text/javascript"> window.open("scheduleofclasses.php","_self");</script>';
}
if (isset($_POST['llcsubmit']))  {

    $_SESSION['llc'] = $_POST['desiredLLC'];
    echo '<script type="text/javascript"> window.open("scheduleofclasses.php","_self");</script>';
}

if (isset($_POST['all']))  {
    $_SESSION['all'] = 'all';
    echo '<script type="text/javascript"> window.open("scheduleofclasses.php","_self");</script>';
}
?>