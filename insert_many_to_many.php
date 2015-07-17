<html>
	<head>
		<style>
		div { 
			background-color :  #00b8b8;
			padding : 10px;
			display: inline-block;
			border-style : solid;
			border-radius : 22px
		}
		</style>
	</head>
<body>

<?php
error_reporting(E_ERROR | E_PARSE);

$servername = "localhost";
$username = "root";
$password = "password";
$dbname = "prenota";

$tablename = "player_match";

$att1name = "player_id";
$att2name = "match_id";

$counttable1 = "30";
$counttable2 = "40";

echo "
<h1> SQL INSERT of ".$tablename." into DB ".$dbname." </h1>";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$num = count($_POST);
$errormsg = "";
 
if (isset($_POST['att1'])) {
    $att1 = $_POST['att1'];
    $att2 = $_POST['att2'];
    
    //INSERT query
	$sql = "INSERT INTO ".$tablename."
	(	
		". $att1name .", 
		". $att2name ."
	)
	VALUES (
		" . $att1 . ",
		" . $att2 . "
	);";
	
	
	if ($conn->query($sql))
	    $errormsg =  $att1 . ", " . $att2 . " INSERT done!";	
	else
		$errormsg =  "sql error! " . $sql;
}

echo "
<div id = \"container\" >
	<form method=\"post\">
	<table>
			<td>".$att1name."</td>
			<td><input type=\"text\" name=\"att1\" value = \"" .rand (1, $counttable1). "\" autofocus></td>
		</tr>
		<tr>
			<td>".$att2name."</td>
			<td><input type=\"text\" name=\"att2\" value = \"" .rand (1, $counttable2). "\"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type=\"submit\" value=\"Submit\"></td>
		</tr>
	</table>
</div>
<br />

".  $errormsg;
$conn->close();
?>

</body>
</html>
