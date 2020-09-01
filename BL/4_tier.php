<?php

/*************************************************/
/** M151 DB 	Multi DB Connection		            **/
/** Author: 	M. von Orelli			                **/
/** Datum:	 	5. 3.2018				                  **/
/** Version:	1.0					                      **/
/** Applikation:	Theorie				                **/
/**                  					                  **/
/** Filename:	5_tier.php		    	              **/
/** Include Files:	      function.inc          **/
/**                  			db_connection.inc     **/
/*************************************************/

/*************************************************/
/* Datum    | Aenderung                         **/
/*  3.03.18 |                                   **/
/*          |                                   **/
/*          |                                   **/
/*          |                                   **/
/*          |                                   **/
/*************************************************/


require_once("./include/function.inc");
require_once("./include/db_connection.inc");

// $cName = "mvorelli";
// $cPassword = "gugus1";

$HTML_Out = "";
$nachname = $_POST['nachname'];
$vorname = $_POST['vorname'];
$geburtstag = $_POST['geburtstag'];
$email = $_POST['email'];
$ahv = $_POST['ahv_nr'];
$personal = $_POST['personal_nr'];
$telefon = $_POST['telefon'];
$abteilung = $_POST['abteilung'];
$berufsbez = $_POST['berufsbezeichnung'];
$beschreibung = $_POST['beschreibung'];

echo "<font color='red'>BL Business Layer</font><br>";

$login_status = register_new_user($dbconn, $vorname, $nachname, $geburtstag, $email, $ahv, $personal, $telefon, $abteilung, $berufsbez, $beschreibung);
echo "<br><font color='red'>BL Business Layer</font>";
$HTML_Out = "<br><font color='red'>PL Presentation Layer</font>";
if ($login_status == 1) {
  $HTML_Out = $HTML_Out . "<br>  Loginstatus: true Value: ";
} else {
  $HTML_Out = $HTML_Out . "<br>  Loginstatus: false Value: ";
}

$HTML_Out = $HTML_Out . $login_status;
echo  $HTML_Out;
