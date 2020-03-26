<?php
// On protège la page en appelant le fichier php qui férifié si on est logged ou pas
require("../config/adminRequired.php");
// on inclus le chemin d'accès de base à notre répertoire principal
require("../config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("../config/database.php");

// SI l'utilisateur a ajouté un contact,
if (isset($_POST["firstName"]) && isset($_POST["lastName"])) {
  // Traiter les données de formulaire pour s'assurer que le prénom et le nom soient bien tout en minuscule avec seulement les 1eres lettres de chaque motes en majuscule
  $firstName = ucwords(strtolower($_POST["firstName"]));
  $lastName = ucwords(strtolower($_POST["lastName"]));

  // Insérer dans la table author, le nouvel auteur
  $query = $pdo->prepare("INSERT INTO author (lastName, firstName) VALUES (:lastName, :firstName)");
  $query->bindParam(':firstName', $firstName);
  $query->bindParam(':lastName', $lastName);
  $query->execute();

  // Rediriger l'admin vers le listing des auteurs authors.php
  header('Location: authors.php');
  exit();
}

// on inclut de modèle de page global
$pageTitle = "Ajouter un auteur";
$template = 'add_author.phtml';
include("layout.phtml");
?>