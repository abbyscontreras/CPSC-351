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
?>