	<?php
	$name = $_POST['Name'];
	$email = $_POST['Email'];
	$password = $_POST['Password'];
	if (!empty($name) || !empty($email) || !empty($password)){
	$host ="localhost";
	$dbUsername ="root";
	$dbPassword ="";
	$dbname ="railway";
    

	//connection

    $conn =mysqli_connect($host, $dbUsername, $dbPassword, $dbname);
	if(mysqli_connect_error()){
	die('Connection Error('.mysqli_connect_error().')'.mysqli_connect_error());
	}
	else{
	$SELECT= "SELECT email FROM passanger Where email= ? Limit 1";                      
	$INSERT = "INSERT Into passanger (name,email,password) values(?,?,?)";

	//prepare statement
	$pst = $conn->prepare($SELECT);
	$pst->bind_param("s", $email);
	$pst->execute();
	$pst->bind_result($email);
	$pst->store_result();
	$rnum = $pst->num_rows;

	if ($rnum==0){
	$pst->close();
	$pst = $conn->prepare($INSERT);
	$pst->bind_param("sss",$name, $email, $password);
	$pst->execute();
	echo "New Record Added Successfully";
	}
	else{
	echo "This Email Address Already Exist";
	}
	$pst->close();
	$conn->close();
	}
	}
	else{
	echo "Fields Are Required";
	die();
	}
	?>