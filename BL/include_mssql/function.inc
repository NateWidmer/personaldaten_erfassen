<?php
 
function check_user_password($dbconn, $cName, $cPassword)
{
// Check User Password conbination
// Return Value is true for valid User, Password Combination
//              is false for invalid User, Password combination
         
   $Query = "EXEC sps_check_login '". $cName. "','". $cPassword."'";

   echo "<font color='red'>DAL Data Abstraction Layer</font><br>".  $Query;
   echo "<br><font color='red'>DL Data Layer [MSSQL DB]</font>";   

    foreach ($dbconn->query($Query) as $row) {
        $logon_status = $row["logon_status"];
   }

  
  // Verify User, Password combination
  if ($logon_status > 0)
  {
    return 1;
  }

  return -1;
}

?>


