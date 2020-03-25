<?php
// on inclus le chemin d'accès de base à notre répertoire principal
require("config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("config/database.php");


// Il n'y a pas de paramètre id dans l'URL, on redirige l'utilisateur vers la page d'accueil
if (!isset($_GET["id"])) {
  Header("Location: index.php");
  exit();
}


// requête pour aller chercher l'article
$query = $pdo->prepare("SELECT title, content, publicationDate, author.firstName AS authorFirstName, category.name AS categoryName
FROM post
INNER JOIN category ON post.category_id = category.id
INNER JOIN author ON post.author_id = author.id
WHERE post.id = :id");
$query->bindParam(':id', $_GET['id'], PDO::PARAM_INT);
$query->execute();
$post = $query->fetch();


// Requête pour aller chercher les Commentaires
$query = $pdo->prepare("SELECT nickname, content, publicationDate
FROM comment
WHERE post_id = :id
ORDER BY publicationDate ASC");
$query->bindParam(':id', $_GET['id'], PDO::PARAM_INT);
$query->execute();
$comments = $query->fetchAll();


// on inclut de modèle de page global
$pageTitle = $post['title'];
$template = 'post.phtml';
include("layout.phtml");

?>