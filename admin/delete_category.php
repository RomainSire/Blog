<?php
// On protège la page en appelant le fichier php qui férifié si on est logged ou pas
require("../config/adminRequired.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("../config/database.php");

// SI on a bien le paramètre d'URL nommé 'id', et qu'il est bien de type nombre entier
if (isset($_GET["id"]) && ctype_digit($_GET["id"])) {
  //On supprime l'autheur de la base de données
  $query = $pdo->prepare("DELETE FROM category WHERE id = :id");
  $query->bindParam(':id', $_GET['id'], PDO::PARAM_INT);
  $query->execute();
}

// Rediriger l'admin vers le listing des auteurs authors.php
header('Location: categories.php');
exit();

?>