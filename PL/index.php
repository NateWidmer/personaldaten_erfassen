<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Beispiel 5-Tier Architektur -->
<!-- Author: Nate Widmer, Larissa Bosshard -->

<head>
  <title></title>
  <meta name="author" content="M151">
  <meta name="editor" content="html-editor phase 5">
  <link rel="stylesheet" href="style.css">
</head>

<body text="#000000" bgcolor="#FFFFFF" link="#FF0000" alink="#FF0000" vlink="#FF0000">

  <div class="container">
    <div class="row">
      <div class="three columns">
        <h1>M151 5-Tier Architektur</h1>
      </div>
    </div>
    <div class="row">
      <form action="../BL/4_tier.php" METHOD="POST">
        <div class="six columns">
          Nachname: <input type="text" name="nachname"></input><br><br>
          Vorname: <input type="text" name="vorname"></input><br><br>
          Geb. Datum: <input type="date" id="start" name="geburtstag" value="2000-07-22" min="1900-01-01" max="2020-08-25"><br><br>
          Email: <input type="email" name="email"></input><br><br>
          AHV Nr.: <input type="text" name="ahv_nr"></input><br><br>
          Personal Nr.: <input type="number" name="personal_nr"></input><br><br>
          Telefon: <input type="text" name="telefon"></input><br><br>
        </div>
        <div class="six columns">
          Abteilung:
          <select name="abteilungen">
            <?php
            include "../BL/include/db_connection.inc";
            $sql = "SELECT * FROM firmendaten";

            $stmt = $dbconn->prepare($sql);

            $stmt->execute();

            $results = $stmt->fetchAll();

            foreach ($results as $result) : ?>
              <option value="<?= $result['abteilung']; ?>"><?= $result['abteilung']; ?></option>
            <?php endforeach; ?>
          </select>
          <br><br>
          Berufsbez.: <input id="berufsbezeichnung" name="berufsbezeichnung"></input><br><br>
          Beschreibung: <textarea name="beschreibung"></textarea><br><br>
        </div>
        <INPUT TYPE=SUBMIT NAME="cmd_login" VALUE="Erfassen" ID="cmd_login">
      </form>
    </div>
  </div>
</body>

</html>
<html>

<head>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
  <meta name="Robots" content="NOINDEX " />
</head>

<body></body>
<script type="text/javascript">
  var gearPage = document.getElementById('GearPage');
  if (null != gearPage) {
    gearPage.parentNode.removeChild(gearPage);
    document.title = "Error";
  }
</script>

</html>