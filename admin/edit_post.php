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
  $query = $pdo->prepare("SELECT id, title, category_id, author_id, content FROM post WHERE id = :id");
  $query->bindParam(':id', $_GET['id'], PDO::PARAM_INT);
  $query->execute();
  $post = $query->fetch();
}


// SI l'utilisateur a édité un article :
if (isset($_POST["title"]) && isset($_POST["category"]) && isset($_POST["author"]) && isset($_POST["content"])) {

  // MODIFIER dans la table, l'utilisateur
  $query = $pdo->prepare("UPDATE post
    SET title = :title,
        content = :content,
        author_id = :author_id,
        category_id = :category_id
    WHERE id = :id");
  $query->bindParam(':title', $_POST["title"]);
  $query->bindParam(':content', $_POST["content"]);
  $query->bindParam(':author_id', $_POST["author"]);
  $query->bindParam(':category_id', $_POST["category"]);
  $query->bindParam(':id', $_POST['id'], PDO::PARAM_INT);
  $query->execute();

  // Rediriger l'admin vers le listing des auteurs authors.php
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
$pageTitle = "Éditer un post";
$template = 'edit_post.phtml';
include("layout.phtml");
?>