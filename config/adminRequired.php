<?php
// Cette page n'est accessible que pour un utilisateur connecté, vérifier que ce soit le cas. SINON, on le redirige vers la pagede connexion
session_start();
if (!isset($_SESSION["is_logged_in"])) { // Si l'utilisateur n'est pas connecté
  Header("Location: ../login.php"); // On le renvoie sur la page de connexion
  exit();
}
?>
