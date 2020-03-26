<?php
// On protège la page en appelant le fichier php qui férifié si on est logged ou pas
require("../config/adminRequired.php");
// on inclus le chemin d'accès de base à notre répertoire principal
require("../config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("../config/database.php");


// Requête pour lire la BDD
$query = $pdo->prepare("SELECT comment.id AS id, nickname, comment.content AS content, comment.publicationDate AS publicationDate, post.title AS postTitle
  FROM comment
  INNER JOIN post ON comment.post_id = post.id
  ORDER BY comment.id");
$query->execute();
$comments = $query->fetchAll();


// on inclut de modèle de page global
$pageTitle = "Liste des commentaires";
$template = 'comments.phtml';
include("layout.phtml");
?>