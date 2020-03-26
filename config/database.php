<?php

// Connexion à la base de donnée
$pdo = new PDO('mysql:host=private;dbname=portfolio;charset=UTF8', 'root', 'root', [
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // On configure la conenxion à la base de données pour que les résultats de requête soient toujours renvoyés sous forme de tableau associatifs
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION  // pour que les erreurs SQL soient envoyées dans la page
]);


?>