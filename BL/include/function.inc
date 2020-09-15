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


function register_new_user($dbconn, $vorname, $nachname, $geburtstag, $email, $ahv, $personal, $telefon, $abteilung)
{      

  $Query  = "INSERT INTO personaldaten(nachname, vorname, geburtstag, email, ahv_nr, personal_nr, telefon, fk_firmendaten)";
  $Query .=" VALUES ('".$nachname."', '".$vorname."', '".$geburtstag."', '".$email."', '".$ahv."', '".$personal."', '".$telefon."',";
  $Query .=" (SELECT id from firmendaten WHERE firmenname = 'Example Company' AND abteilung = '".$abteilung."'))";
   
  $dbconn->query($Query);
}

function get_departments($dbconn) {
  $sql = "SELECT * FROM firmendaten";

  $stmt = $dbconn->prepare($sql);

  $stmt->execute();

  $results = $stmt->fetchAll();

  foreach ($results as $result) :
  echo "<option value=" .$result['abteilung']. ">" .$result['abteilung']. "</option>";
  endforeach;
}

function get_registered_users($dbconn) {

  $sql = "SELECT * FROM personaldaten";

        $stmt = $dbconn->prepare($sql);

        $stmt->execute();

        $results = $stmt->fetchAll();

        echo "<table border='1'>
<thead>
<tr>
<th>Nachname</th>
<th>Vorname</th>
<th>Geburtstag</th>
<th>Email</th>
<th>AHV-Nr.</th>
<th>Personalnr.</th>
<th>Telefon</th>
</tr>
</thead>
<tbody>";

foreach ($results as $result) :
  echo "<tr>";
  echo "<td>" . $result['nachname'] . "</td>";
  echo "<td>" . $result['vorname'] . "</td>";
  echo "<td>" . $result['geburtstag'] . "</td>";
  echo "<td>" . $result['email'] . "</td>";
  echo "<td>" . $result['ahv_nr'] . "</td>";
  echo "<td>" . $result['personal_nr'] . "</td>";
  echo "<td>" . $result['telefon'] . "</td>";
  echo "<td><button class='button' value=" .$result['id'] . " onclick=updateUser(" . $result['id'] . ")>Bearbeiten</button></td>";
  echo "<td><button class='button' value=" .$result['id'] . " onclick=deleteUser(" . $result['id'] . ")>Löschen</button></td>";
  echo "</tr><br>";
endforeach;
}

echo "</tbody>";

function delete_user_by_id($dbconn, $id) {

  $delQuery = "DELETE FROM personaldaten WHERE id = '".$id."'";

  $dbconn->query($delQuery);
}

function get_user_by_id($dbconn, $id) {

  $getQuery = "SELECT * FROM personaldaten WHERE id = '".$id."'";

        $stmt = $dbconn->prepare($getQuery);

        $stmt->execute();

        $rows = $stmt->fetchAll();

foreach ($rows as $row) :
echo "        <form id='personal_form_update' METHOD='POST'>
        <h3>Personalaktualisierung</h3>
<div class='row'>
        <div class='four columns'>
                    Nachname: <br><input type='text' value=" .$row['nachname'] . " name='nachname'></input><br><br>
                    Vorname: <br><input type='text' value=" .$row['vorname'] . " name='vorname'></input><br><br>
                    Geb. Datum: <br><input type='date' id='start' name='geburtstag' value=" .$row['geburtstag'] . " min='1900-01-01' max='2020-08-25'><br><br>
                    Email: <br><input type='email' value=" .$row['email'] . " name='email'></input><br><br>
                    AHV Nr.: <br><input type='text' value=" .$row['ahv_nr'] . " name='ahv_nr'></input><br><br>
                    Personal Nr.: <br><input type='number' value=" .$row['personal_nr'] . " name='personal_nr'></input><br><br>
                    Telefon: <br><input name='telefon' type='text' value=" .$row['telefon'] . "></input><br><br>
       </div>
               <div class='four columns'>
          Abteilung:<br>
                    <select id='abteilungSelect' name='abteilungen'>
          </select>
          <br><br>
            <INPUT TYPE=SUBMIT class='button' NAME='register_user' VALUE='Aktualisieren' onclick='updateUserData(" .$row['id'] .")' ID='update_user'>
        </div>
        </div>
      </form>                
";
endforeach;

  $dbconn->query($getQuery);

}

function update_user_data($dbconn, $id, $vorname, $nachname, $geburtstag, $email, $ahv, $personal, $telefon, $abteilung) {
  $updateQuery = "UPDATE personaldaten SET nachname='".$nachname."', vorname='".$vorname."', geburtstag='".$geburtstag."', email='".$email."', ahv_nr='".$ahv."', personal_nr='".$personal."', telefon='".$telefon."', fk_firmendaten=(SELECT id from firmendaten WHERE firmenname = 'Example Company' AND abteilung = '".$abteilung."') WHERE id=".$id."";

  $dbconn->query($updateQuery);

}

function register_new_department($dbconn, $abteilung, $berufsbezeichnung, $berufsbeschreibung) {
  $newDepartmentQuery = "INSERT INTO firmendaten(firmenname, abteilung, berufsbezeichnung, berufsbeschreibung) VALUES('Example Company', '".$abteilung."', '".$berufsbezeichnung."', '".$berufsbeschreibung."')";

  $dbconn->query($newDepartmentQuery);
}

?>