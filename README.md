# Blog - PHP training
Simple content management system (CMS) in PHP for a Blog.

Training for CRUD (create, read, update, and delete) in PHP with MySQL requests.

## Goals
- Post articles (title, content, date)
- Sort articles into categories
- Multi-user with different authentication rights
- Comments on articles
- List and display the last articles
- Article edit
- ...

## Database

BASE DE DONNÉES                    |                   |    blog
 --- | --- | ---
  Table article :                  |                   |    post
    - id unique                    |   - SMALLINT      |   id --> Clé Primaire (Primary Key = PK) + Auto Increment (A_I)
    - Titre                           - VARCHAR(255)      title
    - Contenu                         - TEXT              content
    - Date de publication             - DATETIME          publicationDate
    - référence à l'auteur (id)       - TINYINT           author_id --> Clé étrangère (Foreign Key = FK)
    - référence à la catégorie (id)   - TINYINT           category_id --> FK

  Table auteur                                            author
    - id unique Auteur                - TINYINT           id --> PK A_I
    - nom                             - VARCHAR(255)      lastName
    - prénom                          - VARCHAR(255)      firstName

  Table catégorie :                                       category
    - id unique catégorie             - TINYINT           id --> PK A_I
    - Intitulé                        - VARCHAR(255)      name

  Table Commentaires :                                    comment
    - id unique commentaire           - MEDIUMINT         id --> PK A_I
    - Pseudo                          - VARCHAR(255)      nickname
    - Contenu du commentaire          - TEXT              content
    - Date                            - DATETIME          publicationDate
    - Référence à l'article (id)      - SMALLINT          post_id --> FK

NB : Lors de la création de la base, il faut aussi choisir l'encodage. On choisit "utf8_general_ci" dans la plupart des cas !

NB : RELATIONS CLÉS ÉTRANGÈRES
Quand on établit une relation entre post et author,
on spécifie dans un premier temps à quoi fait référence la colonne author_id (ici : la table author, la colonne id)
on spécifie le comportement à adopter pour deux cas de figures
- Si un auteur est supprimé
- Si un auteur est mis à jour
    On va avoir quatre modes d'action possibles :
    - CASCADE : si on supprimer un auteur alors on supprime également tous les articles qui lui sont liés
    - SET NULL : si l'auteur est supprimé, on stocke la valeur NULL à la place de son id dans la colonne author_id
    - NO ACTION : ne rien faire (on va laisse la valeur actuelle dans la colonne author_id)
    - RESTRICT : on ne pourra pas supprimer l'auteur tant que des articles y font références




PAGES À DÉVELOPPER
-------

- Administration :
    * CRUD articles
    * CRUD catégories
    * CRUD auteurs
   (* CRUD commentaires)

- Partie publique
    * Accueil (lister les X derniers articles)
    * Page d'un article

Bonus :
    * Recherche
    * Page catégorie
    * Page auteur

Voir quelles commandes SQL vont nous être utiles pour  :
- ajouter un enregistrement dans une table          SQL INSERT INTO
- mettre à jour un enregistrement dans une table    SQL UPDATE
- supprimer un enregistrement dans une table        SQL DELETE FROM





FONCTIONNALITÉS BONUS
  - login pour accéder aux pages admin
  - gestion de plusieurs comptes utilisateurs avec éventuellement des droits d'édition différents
  - Ajouter une image de couverture pour chaque article
  - Pouvoir mettre des images dans le contenu des articles
