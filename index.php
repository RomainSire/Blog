<?php
// on inclus le chemin d'accès de base à notre répertoire principal
require("config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("config/database.php");


// Requête pour lire la BDD
$query = $pdo->prepare("SELECT post.id AS postId, title, content, publicationDate, author.firstName AS authorFirstName, category.name AS categoryName
FROM post
INNER JOIN category ON post.category_id = category.id
INNER JOIN author ON post.author_id = author.id
ORDER BY publicationDate DESC
LIMIT 9");
$query->execute();
$posts = $query->fetchAll();


// on inclut de modèle de page global
$pageTitle = "Les derniers articles";
$template = 'index.phtml';
include("layout.phtml");
?>