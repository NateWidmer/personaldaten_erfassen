<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Beispiel 5-Tier Architektur -->
<!-- Author: Nate Widmer, Larissa Bosshard -->

<head>
  <title></title>
  <meta name="author" content="M151">
  <meta name="editor" content="html-editor phase 5">
  <link rel="stylesheet" href="style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script language="javascript" type="text/javascript">
    $(document).ready(function() {
      $.get("../BL/getUserList.php", function(data) {
        $("#personal_list").html(data);
      });
      $.get("../BL/select.php", function(data) {
        $("#abteilungSelect").html(data);
      })
    });

    $(function() {

      $('#personal_form').on('submit', function(e) {

        e.preventDefault();

        $.ajax({
          type: 'post',
          url: '../BL/4_tier.php',
          data: $('#personal_form').serialize(),
          success: function() {
            alert('form was submitted');
          }
        });

      });

    });

    function deleteUser(deleteId) {
      $.post('../BL/delete.php', {
        delete_id: deleteId,
        function(delete_id) {}
      });
    }

    function updateUser(id) {
      $('#form').load('../BL/getSingleUser.php', {
        id: id
      }, function() {
        $.get("../BL/select.php", function(data) {
          $("#abteilungSelect").html(data);
        })
      });
    }

    function updateUserData(userId) {
      $('#personal_form_update').on('submit', function(e) {

        e.preventDefault();

        var myData = $('#personal_form_update').serialize() + "&id=" + userId;
        console.log(":)))", data);

        $.post('../BL/update.php', {
          data: myData,
          function() {
            console.log(":)");
          }
        });

      });
    }
  </script>

</head>

<body text="#000000" bgcolor="#FFFFFF" link="#FF0000" alink="#FF0000" vlink="#FF0000">

  <div class="container">
    <div class="row">
      <div class="three columns">
        <h1>M151 5-Tier Architektur</h1>
      </div>
    </div>
    <div id="form" class="row">
      <form id="personal_form" METHOD="POST">
        <div class="six columns">
          Nachname: <br><input type="text" name="nachname"></input><br><br>
          Vorname: <br><input type="text" name="vorname"></input><br><br>
          Geb. Datum: <br><input type="date" id="start" name="geburtstag" value="2000-07-22" min="1900-01-01" max="2020-08-25"><br><br>
          Email: <br><input type="email" name="email"></input><br><br>
          AHV Nr.: <br><input type="text" name="ahv_nr"></input><br><br>
          Personal Nr.: <br><input type="number" name="personal_nr"></input><br><br>
          Telefon: <br><input type="text" name="telefon"></input><br><br>
        </div>
        <div class="six columns">
          Abteilung:<br>
          <select id="abteilungSelect" name="abteilungen">
          </select>
          <br><br>
        </div>
        <INPUT TYPE=SUBMIT NAME="register_user" VALUE="Erfassen" ID="register_user">
      </form>
    </div>
    <div class="row">
      <div class="twelve columns" id="personal_list">
      </div>
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