<?php

require_once("./include/function.inc");
require_once("./include/db_connection.inc");

$nachname = $_POST['nachname'];
$vorname = $_POST['vorname'];
$geburtstag = $_POST['geburtstag'];
$email = $_POST['email'];
$ahv = $_POST['ahv_nr'];
$personal = $_POST['personal_nr'];
$telefon = $_POST['telefon'];
$abteilung = "";
if (isset($_POST['abteilungen'])) {
  $abteilung = $_POST['abteilungen'];
}

register_new_user($dbconn, $vorname, $nachname, $geburtstag, $email, $ahv, $personal, $telefon, $abteilung);