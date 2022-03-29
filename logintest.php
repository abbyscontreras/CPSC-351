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
    <title>Login</title>
</head>
<body>
<section class="vh-100">
    <div class="container py-5 h-100" style="width:50%;">
            <div class="card" style="align-content: center; align-items: center;">
            <div class="content">

                <h2 class="title">CNU Archway Login</h2>
                <form method="POST" action="">
                    <div class="form-outline mb-4">
                    <label for="username">Username</label>
                    <div class="box">
                        <input type="text" name="username" placeholder="username" class="form-control" required>
                    </div>
                    </div>
                    <div class="form-outline mb-4">
                        <label for="password">Password</label>
                        <div class="box">
                            <input type="text" name="password" placeholder="password" class="form-control" required>
                        </div>
                    </div>
                        <button type="button" class="btn btn-dark btn-block mb-4">Sign in</button>


                </form>
            </div>
        </div>
    </div>
    </div>
</section>
</body>
</html>