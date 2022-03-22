<?php

	echo "<html><body>
	<form action=\"351testv2.php\" method=\"post\">
	Username: <input type=\"text\" name=\"uname\">
	<br> Password: <input type=\"password\" name=\"pword\"> <p>
	<input type=\"submit\" name=\"submit\">
	</form></body></html>";
	
	if(isset($_POST['submit']))	{
		echo "Hello, ". $_POST['uname']. "! Your Password is: ".$_POST['pword'];
	}

    if ($_POST['uname'] != 01000834)   {
        echo $_POST['uname']. " is not a valid username!"
    }
	if(isset($_POST['submit']))	{
		if ($_POST['uname'] == 01000834) {
			if ($_POST['pword'] != "Monkey7")	{
				echo $_POST['pword']. " is the incorrect password for" . $_POST['uname'];
			}

		}


?>