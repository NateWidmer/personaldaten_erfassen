<?php   

   $user = "root";
   $pw = "";
   $toReturn = "";
   $DBName = "";
   $DBPassword = "";
   
//connect to database 
$dsn ="odbc:MySQL151";
echo "<font color='red'>DIL Data Interface Layer [ODBC] to MySQL</font><br>";
$dbconn= new PDO($dsn,$user,$pw);
?>