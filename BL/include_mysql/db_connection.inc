<?php   

   $user = "root";
   $pw = "";
   $toReturn = "";
   $DBName = "";
   $DBPassword = "";
   
//connect to database 
 $dsn ="odbc:MySQL151";
$dbconn= new PDO($dsn,$user,$pw);
?>