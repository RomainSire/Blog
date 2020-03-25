<?php
// on inclus le chemin d'accès de base à notre répertoire principal
require("config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("config/database.php");


// SI on a bien le paramètre d'URL nommé 'id', et qu'il est bien de type nombre entier
if (isset($_GET["id"]) && ctype_digit($_GET["id"])) {
  //requête
  $query = $pdo->prepare(
  "SELECT post.id AS postId, title, content, publicationDate, author.firstName AS authorFirstName, category.name AS categoryName
  FROM post
  INNER JOIN category ON post.category_id = category.id
  INNER JOIN author ON post.author_id = author.id
  WHERE category_id = :id
  ORDER BY publicationDate DESC");
  $query->bindParam(':id', $_GET['id'], PDO::PARAM_INT);
  $query->execute();
  $posts = $query->fetchAll();
}


// on inclut de modèle de page global
$pageTitle = "Catégorie : " . $posts[0]['categoryName'];
$template = 'index.phtml';
include("layout.phtml");

?>