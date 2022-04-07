<?php
//include('db_connection.php');
//global $conn;
include('header.php');
?>

<div class="row">
    <div class="profileCard">
        <div class="card">
            <div class="row">
<!--                <h2>Admin</h2>-->
                <?php
                if (isset($_SESSION['user'])) {
                    echo $_SESSION['user'];
                }
                //                    echo "hello";
//                    if (isset($_SESSION['user'])) {
//                        echo "hello";
//                        $user = $_SESSION['user'];
//                        $sql = mysqli_query($conn, "select * from advisors where id_fk='$user'");
//                        while ($row = mysqli_fetch_array($sql)) {
//                            echo $user;
//                            echo '<img src="data:image;base64,' . base64_encode($row['img_dir']) . 'alt="Image">';
//                        }
//                        }
                ?>
                <img src="" alt="">
            </div>
            <div class="row">
                <h4>Biography</h4>
                <h4>Courses Teaching</h4>
                <h4>Contact Information</h4>
            </div>
        </div>
    </div>
</div>