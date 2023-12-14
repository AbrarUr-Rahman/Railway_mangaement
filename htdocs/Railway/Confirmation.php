	<?php
	$date = $_POST['Date'];
	$from_station = $_POST['From_Station'];
	$destination = $_POST['Destination'];
	$name = $_POST['Name'];
	$no_of_seats = $_POST['No_of_Seats'];
	if (!empty($date) || !empty($from_station) || !empty($destination) || !empty($name) || !empty($no_of_seats)){
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
	$SELECT= "SELECT  email from passanger Where email= ? Limit 1";                      
	$INSERT = "INSERT Into booking (name,date,from_station,destination,no_of_seats) values(?,?,?,?,?)";

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
	$pst->bind_param("sssss",$name, $date, $from_station, $destination, $no_of_seats);
	$pst->execute();
	echo "Booking Successfully";
	}
	else{
	echo "No Route Available";
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