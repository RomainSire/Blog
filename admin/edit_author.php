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
  $query = $pdo->prepare("SELECT id, lastName, firstName FROM author WHERE id = :id");
  $query->bindParam(':id', $_GET['id'], PDO::PARAM_INT);
  $query->execute();
  $author = $query->fetch();
}


// SI l'utilisateur a édité un contact,
if (isset($_POST["firstName"]) && isset($_POST["lastName"])) {
  // Traiter les données de formulaire pour s'assurer que le prénom et le nom soient bien tout en minuscule avec seulement les 1eres lettres de chaque motes en majuscule
  $firstName = ucwords(strtolower($_POST["firstName"]));
  $lastName = ucwords(strtolower($_POST["lastName"]));

  // MODIFIER dans la table, l'utilisateur
  $query = $pdo->prepare("UPDATE author SET lastName = :lastName, firstName = :firstName WHERE id = :id");
  $query->bindParam(':firstName', $firstName);
  $query->bindParam(':lastName', $lastName);
  $query->bindParam(':id', $_POST['id'], PDO::PARAM_INT);
  $query->execute();

  // Rediriger l'admin vers le listing des auteurs authors.php
  header('Location: authors.php');
  exit();
}


// on inclut de modèle de page global
$pageTitle = "Éditer un auteur";
$template = 'edit_author.phtml';
include("layout.phtml");
?>