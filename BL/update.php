<?php

require_once("./include/function.inc");
require_once("./include/db_connection.inc");

echo "HELLO FECKER";

$id = $_POST['id'];
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

update_user_data($dbconn, $id, $vorname, $nachname, $geburtstag, $email, $ahv, $personal, $telefon, $abteilung);
