<?php
include('db_connection.php');
global $conn;
include('header.php');

?>
<div id="wrapper">
    <main>
        <h2>Schedule of Classes for Fall Semester 2022</h2>
        <form method="post" action="scheduleofclasses.php">
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

        <form method="post" action="scheduleofclasses.php">
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
    </main>
</div>

<?php
if (isset($_POST['coursesubmit']))  {
    $course = $_POST['course'];
    $_SESSION['course'] = $course;

}

?>