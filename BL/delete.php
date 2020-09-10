<?php

require_once("./include/function.inc");
require_once("./include/db_connection.inc");

delete_user_by_id($dbconn, $_POST['delete_id']);

?>
