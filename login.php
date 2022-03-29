<?php

	echo "<html><body>
	<form action=\"351testv2.php\" method=\"post\">
	Username: <input type=\"text\" name=\"uname\">
	<br> Password: <input type=\"password\" name=\"pword\"> <p>
	<input type=\"submit\" name=\"submit\">
	</form></body></html>";
	

	$flag = "exit";
	//user hits submit on login page
	if(isset($_POST['submit']))	{
		if ($_POST['uname'] != 01000834)   {
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