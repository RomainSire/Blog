<?php

// Requête pour récupérer la liste des auteurs
$query = $pdo->prepare("SELECT id, firstName, lastName FROM author");
$query->execute();
$authors = $query->fetchAll();

// Requête pour récupérer la liste des catégories
$query = $pdo->prepare("SELECT id, name FROM category");
$query->execute();
$categories = $query->fetchAll();

?>