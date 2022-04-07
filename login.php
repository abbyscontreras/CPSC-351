<?php
include('db_connection.php');
global $conn;
$msg = "";

if (isset($_POST['submit'])) {
    $user = mysqli_real_escape_string($conn, $_POST['username']);
    $pass = mysqli_real_escape_string($conn, $_POST['password']);

    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = mysqli_query($conn, "select * from login where username = '$user' && password = '$pass'");
    $num = mysqli_num_rows($sql);
    if ($num > 0) {
        echo "found";
        $row = mysqli_fetch_assoc($sql);
        $_SESSION['USER_ID'] = $row['id'];
        $_SESSION['USER_NAME'] = $row['username'];
        header("Location:index.php");
    } else {
        $msg = '<div class="alert alert-danger" role="alert"><p>Please enter valid login credentials</p></div>';
    }
}
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!--    <link rel="stylesheet" href="../css/style.css">-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous">
    </script>
    <script src="../js/script.js"></script>
    <link rel="stylesheet" href="../css/style.css">

    <title>Login</title>
</head>
<body>
<header>
    <div class="head">
        <h1>CNU Archway</h1>
    </div>
</header>

<section class="vh-100">
    <div class="container py-5 h-100" style="width:50%;">
        <div class="card" style="align-content: center; align-items: center;padding:10px;">
            <div class="content">
                <h2 class="title" style="text-align: center">Login</h2>
                <form method="post" action="">
                    <div class="form-outline mb-4">
                        <label for="username">Username</label>
                        <div class="box">
                            <input type="text" name="username" placeholder="username" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-outline mb-4">
                        <label for="password">Password</label>
                        <div class="box">
                            <input type="password" name="password" placeholder="password" class="form-control"
                                   required>
                        </div>
                    </div>
                    <button type="submit" class="form-control btn btn-dark btn-submit btn-block mb-4" value="Login"
                            name="submit">Sign in
                    </button>
                    <?php echo $msg ?>
                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>