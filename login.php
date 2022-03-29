<!DOCTYPE html>
<html>
<head>
    <title>CNU Archway :: Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<form action="login.php" method="post">
    <h2>CNU Archway Login</h2>
    <?php

    $flag = "exit";
	//user hits submit on login page
	if(isset($_POST['submit']))	{
		if ($_POST['uname'] != "01000834")   {
			echo $_POST['uname']. " is not a valid username!";
			echo " <br> ";
		} else	{
			$flag = "next_level";
		}
	}
	//checks if password matches usernmae
	if ($flag=="next_level")	{
		if ($_POST['pword'] != "Monkey7")	{
			echo $_POST['pword']. " is the incorrect password for" . $_POST['uname'];
		} else {
			$flag = "next_level2";
		}
	}
	//sends user to their home page for archway
	if ($flag=="next_level2")	{
		echo "You successfully logged in!";
	}
    ?>
    <label for="uname">User Name</label>
    <input type="text" name="uname" placeholder="User Name"><br>

    <label for="pword">Password</label>
    <input type="password" name="pword" placeholder="Password"><br>

    <button type="submit">Sign In</button>

</form>
</body>
</html>


