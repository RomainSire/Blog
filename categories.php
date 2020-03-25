<?php
// on inclus le chemin d'accès de base à notre répertoire principal
require("config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("config/database.php");


// Requête pour lire la BDD
$query = $pdo->prepare("SELECT id, name FROM category ORDER BY id");
$query->execute();
$categories = $query->fetchAll();


// on inclut de modèle de page global
$pageTitle = "Liste des catégories";
$template = 'categories.phtml';
include("layout.phtml");

?>
