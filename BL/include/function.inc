<?php
 
/*************************************************/
/** M151 DB 	Multi DB Connection		            **/
/** Author: 	M. von Orelli			                **/
/** Datum:	 	5. 3.2020				                  **/
/** Version:	1.0					                      **/
/** Applikation:Theorie					                **/
/**                  					                  **/
/** Filename:	function.inc			                **/
/** Include Files:5_tier.php   		              **/
/*************************************************/

/*************************************************/
/* Datum    |Aenderung                          **/
/*  13.03.20|                                   **/
/*          |                                   **/
/*          |                                   **/
/*          |                                   **/
/*          |                                   **/
/*************************************************/




function check_user_password($dbconn, $cVorname, $cNachname)
{
// Check User Password conbination
// Return Value is true for valid User, Password Combination
//              is false for invalid User, Password combination
         
   $Query  = "select count(*) as logon_status from personal";
   $Query .=" where vorname='".$cVorname. "'";
   $Query .=" AND nachname='".$cNachname. "'";
 
   echo "<font color='red'>DL Data Layer [DB]</font><br>".  $Query;;   
  //Execution of Querry
    foreach ($dbconn->query($Query) as $row) {
//        print_r($row);
        $logon_status = $row["logon_status"];
   }

  // Result of Vorname, Nachname combination
  if ($logon_status > 0)
  {
    return 1;
  }

  return -1;
}

?>


