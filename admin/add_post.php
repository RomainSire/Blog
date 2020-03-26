<?php
// On protège la page en appelant le fichier php qui férifié si on est logged ou pas
require("../config/adminRequired.php");
// on inclus le chemin d'accès de base à notre répertoire principal
require("../config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("../config/database.php");

// Quand le formulaire est envoyé => enregistrer l'article dans la BDD
// SI l'utilisateur posteqqch
if (isset($_POST["title"]) && isset($_POST["category"]) && isset($_POST["author"]) && isset($_POST["content"])) {

  // Insérer dans la table author, le nouvel auteur
  $query = $pdo->prepare("INSERT INTO post (title, content, author_id, category_id) VALUES (:title, :content, :author_id, :category_id)");
  $query->bindParam(':title', $_POST["title"]);
  $query->bindParam(':content', $_POST["content"]);
  $query->bindParam(':author_id', $_POST["author"], PDO::PARAM_INT);
  $query->bindParam(':category_id', $_POST["category"], PDO::PARAM_INT);
  $query->execute();

  // Rediriger l'utilisateur sur la page de listing des articles (posts.php)
  header('Location: posts.php');
  exit();
}


// Requête pour récupérer la liste des auteurs
$query = $pdo->prepare("SELECT id, firstName, lastName FROM author");
$query->execute();
$authors = $query->fetchAll();

// Requête pour récupérer la liste des catégories
$query = $pdo->prepare("SELECT id, name FROM category");
$query->execute();
$categories = $query->fetchAll();


// on inclut de modèle de page global
$pageTitle = "Publier un article";
$template = 'add_post.phtml';
include("layout.phtml");
?>