<?php   

   $user = "root";
   $pw = "";
   $toReturn = "";
   $DBName = "";
   $DBPassword = "";
   
//connect to database 
 $dsn ="odbc:MSSQLM151";
$dbconn= new PDO($dsn,$user,$pw);
?>
