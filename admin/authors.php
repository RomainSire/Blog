<?php
// On protège la page en appelant le fichier php qui férifié si on est logged ou pas
require("../config/adminRequired.php");
// on inclus le chemin d'accès de base à notre répertoire principal
require("../config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("../config/database.php");


// Requête pour lire la BDD
$query = $pdo->prepare("SELECT id, firstName, lastName FROM author ORDER BY id");
$query->execute();
$authors = $query->fetchAll();


// on inclut de modèle de page global
$pageTitle = "Liste des auteurs";
$template = 'authors.phtml';
include("layout.phtml");
?>