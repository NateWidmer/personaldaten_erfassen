<?php

require_once("./include/function.inc");
require_once("./include/db_connection.inc");

get_user_by_id($dbconn, $_POST['id']);

?>