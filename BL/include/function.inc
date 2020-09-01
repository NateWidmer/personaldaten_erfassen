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


function register_new_user($dbconn, $vorname, $nachname, $geburtstag, $email, $ahv, $personal, $telefon, $abteilung, $berufsbez, $beschreibung)
{
         
   $Query  = "INSERT INTO personaldaten(nachname, vorname, geburtstag, email, ahv_nr, personal_nr, telefon, fk_firmendaten)";
   $Query .=" VALUES ('".$nachname."', '".$vorname."', '".$geburtstag."', '".$email."', '".$ahv."', '".$personal."', '".$telefon."',";
   $Query .=" (SELECT id from firmendaten WHERE firmenname = 'Accenture' AND abteilung = '".$abteilung."'))";
 
   echo "<font color='red'>DL Data Layer [DB]</font><br>".  $Query;;   
  //Execution of Querry
  if($dbconn->query($Query) === TRUE) {
    echo "SUCCESS";
    return 1;
  } else {
    "NO";
    return -1;
  }
}

?>


