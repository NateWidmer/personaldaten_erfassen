<?php   

   $user = "M151";
   $pass = "M151";
   $user = "root";
   $pw = "";
   $toReturn = "";
   $DBName = "";
   $DBPassword = "";
   
//connect to database 
 $dsn ="odbc:MySQLBeispielLogin";
echo "<font color='red'>DIL Data Interface Layer [ODBC] to MySQL</font><br>";
$dbconn= new PDO($dsn,$user,$pw);
?>