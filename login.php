<?php
// ON indique à PHP qu'on va "utiliser" la SESSION courante de l'utilisateur
session_start();
// on inclus le chemin d'accès de base à notre répertoire principal
require("config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("config/database.php");

// on crée une variable pour aficher ou non un message d'erreur
$error = false;

// Si l'utilisateur a écrit qqch :
if (!empty($_POST)) {

  // On cherche dans la base de données l'utilisateur qui correspond au mail donné dans le formulaire (renvoie 'false' si aucun utilisateur trouvé)
  $query = $pdo->prepare("SELECT email, password, firstName
  FROM author
  WHERE email = :email");
  $query->bindParam(':email', $_POST['email']);
  $query->execute();
  $user = $query->fetch();

  // SI on a bien trouvé un utilisateur
  if ($user) {
    // SI le mot de passe tapé dans le formulaire correspond au hash du mot de passe stocké en base
    if (password_verify($_POST['password'], $user['password'])) {
      // On considère l'utilisateur comme connecté :
      $_SESSION["is_logged_in"] = true;  // on utilise la session
      header("location: $baseUrl/admin/posts.php");
    }
  }
  exit();
}


// on inclut de modèle de page global
$pageTitle = "Identifiez-vous";
$template = 'login.phtml';
include("layout.phtml");
?>