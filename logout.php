<?php
session_start();  // récupérer la session courante
session_unset(); // Supprimer les données de la session

// on inclus le chemin d'accès de base à notre répertoire principal
require("config/config.php");
// redirection sur la page login
header("location: $baseUrl/login.php");
exit();

?>