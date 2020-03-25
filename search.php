<?php
// on inclus le chemin d'accès de base à notre répertoire principal
require("config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("config/database.php");


if (isset($_POST["search"])) {  // si l'utilisateur a cherché qqch, on envoi la requête

  // on concatene avec des % pour faire une requete de type  : %search%
  $search = "%" . $_POST["search"] . "%";

  // Requête pour lire la BDD
  $query = $pdo->prepare(
  "SELECT post.id AS postId, title, content, publicationDate, author.lastName AS authorLastName, author.firstName AS authorFirstName, category.name AS categoryName
  FROM post
  INNER JOIN author ON author.id = post.author_id
  INNER Join category ON category.id = post.category_id
  WHERE title LIKE :search
   OR content LIKE :search
   OR author.lastName LIKE :search
   OR author.firstName LIKE :search
   OR category.name LIKE :search
  ORDER BY publicationDate DESC");
  $query->bindParam(':search', $search);
  $query->execute();
  $posts = $query->fetchAll();


  // on inclut de modèle de page global
  $pageTitle = "Résultats de la recherche : " . $_POST["search"];
  $template = 'index.phtml';
  include("layout.phtml");


} else { // sinon, l'utilisateur s'est perdu, on le redirige vers l'accueil
  header('location: index.php');
  exit;
}


?>