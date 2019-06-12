
<?php
  echo 'php has started';

  $dbhost = '40.127.6.141';
  $dbuser = 'userMorne';
  $dbpass = 'root';
  $db = 'Project2';

  $dbconn = mysql_connect($dbhost, $dbuser, $dbpass);

  if (!$dbconn)
  {
      die('Could not connect: ' . mysql_error());
  }

  mysql_select_db($db,$dbconn);

  echo 'Conn succsesfull';

  if (isset($_POST['submit']))
  {
     $program1   = $_POST['arrivalTimeA'];
     $program1_ex   = $_POST['executeTimeA'];

     $program2   = $_POST['arrivalTimeB'];
     $program2_ex   = $_POST['executeTimeB'];

     $program3   = $_POST['arrivalTimeC'];
     $program3_ex   = $_POST['executeTimeC'];

     $program4   = $_POST['arrivalTimeD'];
     $program4_ex   = $_POST['executeTimeD'];

     $program5   = $_POST['arrivalTimeE'];
     $program5_ex   = $_POST['executeTimeE'];

     $program6   = $_POST['arrivalTimeF'];
     $program6_ex   = $_POST['executeTimeF'];

     $program7   = $_POST['arrivalTimeG'];
     $program7_ex   = $_POST['executeTimeG'];

     $program8   = $_POST['arrivalTimeH'];
     $program8_ex   = $_POST['executeTimeH'];


      $query = ("INSERT INTO programs (program1, program2, program3, program4, program5, program6, program7, program8, DateAdded, program1_leng, program2_leng, program3_leng, program4_leng, program5_leng, program6_leng, program7_leng, program8_leng) VALUES ($program1,$program2,$program3,$program4,$program5,$program6,$program7,$program8,SYSDATE(),$program1_ex,$program2_ex,$program3_ex,$program4_ex,$program5_ex,$program6_ex,$program7_ex,$program8_ex)");

      if(mysql_query($query,$dbconn))
        echo '1 record added';
      else
        die('Error: ' . mysql_error());


      mysql_close($dbconn);
  }

?>
