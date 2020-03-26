<?php
// On protège la page en appelant le fichier php qui férifié si on est logged ou pas
require("../config/adminRequired.php");
// on inclus le chemin d'accès de base à notre répertoire principal
require("../config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("../config/database.php");

// SI l'utilisateur a ajouté un contact,
if (isset($_POST["categoryName"])) {
  // Traiter les données de formulaire pour s'assurer que le prénom et le nom soient bien tout en minuscule avec seulement les 1eres lettres de chaque motes en majuscule
  $categoryName = ucwords(strtolower($_POST["categoryName"]));

  // Insérer dans la table author, le nouvel auteur
  $query = $pdo->prepare("INSERT INTO category (name) VALUES (:categoryName)");
  $query->bindParam(':categoryName', $categoryName);
  $query->execute();

  // Rediriger l'admin vers le listing des auteurs authors.php
  header('Location: categories.php');
  exit();
}

// on inclut de modèle de page global
$pageTitle = "Ajouter une catégorie";
$template = 'add_category.phtml';
include("layout.phtml");
?>