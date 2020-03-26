<?php
// On protège la page en appelant le fichier php qui férifié si on est logged ou pas
require("../config/adminRequired.php");
// on inclus le chemin d'accès de base à notre répertoire principal
require("../config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("../config/database.php");


// Requête pour lire la BDD
$query = $pdo->prepare("SELECT post.id AS id, title, publicationDate, author.firstName AS authorFirstName, author.lastName AS authorLastName, category.name AS categoryName
FROM post
INNER JOIN category ON post.category_id = category.id
INNER JOIN author ON post.author_id = author.id
ORDER BY id");
$query->execute();
$posts = $query->fetchAll();


// on inclut de modèle de page global
$pageTitle = "Liste des articles";
$template = 'posts.phtml';
include("layout.phtml");
?>