<?php

require_once("./include/function.inc");
require_once("./include/db_connection.inc");

$abteilung = $_POST['abteilung'];
$berufsbezeichnung = $_POST['berufsbezeichnung'];
$berufsbeschreibung = $_POST['berufsbeschreibung'];

register_new_department($dbconn, $abteilung, $berufsbezeichnung, $berufsbeschreibung);
