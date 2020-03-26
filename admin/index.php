<?php
// On protège la page en appelant le fichier php qui férifié si on est logged ou pas
require("../config/adminRequired.php");
// on inclus le chemin d'accès de base à notre répertoire principal
require("../config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("../config/database.php");


// Nombre d'articles dans la BDD
$query = $pdo->prepare("SELECT COUNT(*) AS NB FROM post");
$query->execute();
$nbPost = $query->fetch();

// Nombre de catégories dans la BDD
$query = $pdo->prepare("SELECT COUNT(*) AS NB FROM category");
$query->execute();
$nbCategory = $query->fetch();

// Nombre d'auteurs dans la BDD
$query = $pdo->prepare("SELECT COUNT(*) AS NB FROM author");
$query->execute();
$nbAuthor = $query->fetch();

// Nombre de commentaires dans la BDD
$query = $pdo->prepare("SELECT COUNT(*) AS NB FROM comment");
$query->execute();
$nbComment = $query->fetch();


// on inclut de modèle de page global
$pageTitle = "Dashboard Admin";
$template = 'index.phtml';
include("layout.phtml");
?>