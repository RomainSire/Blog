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
  $query = $pdo->prepare("SELECT id, name FROM category WHERE id = :id");
  $query->bindParam(':id', $_GET['id'], PDO::PARAM_INT);
  $query->execute();
  $category = $query->fetch();
}


// SI l'utilisateur a édité une catégorie,
if (isset($_POST["categoryName"])) {
  // Traiter les données de formulaire pour s'assurer que le prénom et le nom soient bien tout en minuscule avec seulement les 1eres lettres de chaque motes en majuscule
  $categoryName = ucwords(strtolower($_POST["categoryName"]));

  // MODIFIER dans la table, l'utilisateur
  $query = $pdo->prepare("UPDATE category SET name = :categoryName WHERE id = :id");
  $query->bindParam(':categoryName', $categoryName);
  $query->bindParam(':id', $_POST['id'], PDO::PARAM_INT);
  $query->execute();

  // Rediriger l'admin vers le listing des auteurs authors.php
  header('Location: categories.php');
  exit();
}


// on inclut de modèle de page global
$pageTitle = "Éditer une cétégorie";
$template = 'edit_category.phtml';
include("layout.phtml");
?>