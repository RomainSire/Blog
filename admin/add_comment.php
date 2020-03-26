<?php
// On protège la page en appelant le fichier php qui férifié si on est logged ou pas
require("../config/adminRequired.php");
// on inclus le chemin d'accès de base à notre répertoire principal
require("../config/config.php");
// on inclus le fichier dans lequel on ouvre la base de données
require("../config/database.php");

// Quand le formulaire est envoyé => enregistrer l'article dans la BDD
// SI l'utilisateur posteqqch
if (isset($_POST["pseudo"]) && isset($_POST["content"]) && isset($_POST["postId"])) {
  // Insérer dans la table comment, le nouveau commentaire
  $query = $pdo->prepare("INSERT INTO comment (nickname, content, post_id) VALUES (:nickname, :content, :post_id)");
  $query->bindParam(':nickname', $_POST["pseudo"]);
  $query->bindParam(':content', $_POST["content"]);
  $query->bindParam(':post_id', $_POST["postId"], PDO::PARAM_INT);
  $query->execute();
}

// Rediriger dans tous les cas l'utilisateur sur la page de l'article qu'il consultait sur l'ancre #bottomPage
header('Location: ' . $baseUrl . '/post.php?id=' . $_POST["postId"] . "#bottomPage");
exit();

?>