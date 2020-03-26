<?php
// On protège la page en appelant le fichier php qui férifié si on est logged ou pas
require("../config/adminRequired.php");
// on inclus le chemin d'accès de base à notre répertoire principal
require("../config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("../config/database.php");


// SI on a bien le paramètre d'URL nommé 'id', et qu'il est bien de type nombre entier
if (isset($_GET["id"]) && ctype_digit($_GET["id"])) {
  // On récupère les infos de l'auteur qu'on cherche à éditer
  $query = $pdo->prepare("SELECT id, nickname, content FROM comment WHERE id = :id");
  $query->bindParam(':id', $_GET['id'], PDO::PARAM_INT);
  $query->execute();
  $comment = $query->fetch();
}


// SI l'utilisateur a édité un contact,
if (isset($_POST["nickname"]) && isset($_POST["content"])) {

  // MODIFIER dans la table, l'utilisateur
  $query = $pdo->prepare("UPDATE comment SET nickname = :nickname, content = :content WHERE id = :id");
  $query->bindParam(':nickname', $_POST["nickname"]);
  $query->bindParam(':content', $_POST["content"]);
  $query->bindParam(':id', $_POST['id'], PDO::PARAM_INT);
  $query->execute();

  // Rediriger l'admin vers le listing des auteurs authors.php
  header('Location: comments.php');
  exit();
}


// on inclut de modèle de page global
$pageTitle = "Éditer un commentaire";
$template = 'edit_comment.phtml';
include("layout.phtml");
?>