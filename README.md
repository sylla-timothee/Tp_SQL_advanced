🍽️ GalaxyEat — Base de données SQL
📌 Contexte

Nous avons été embauchés pour moderniser le système d’information de GalaxyEat, une chaîne de restaurants intergalactique présente dans toute la Voie Lactée.

L’objectif est de concevoir une base de données relationnelle permettant de gérer :

les restaurants de la chaîne,

leurs employés,

les plats proposés,

et les commandes passées par les clients.

🎯 Objectifs de la base de données

La base de données permet de :

gérer les restaurants (localisation, planète, année d’ouverture),

gérer les employés et leur rattachement à un restaurant,

stocker les plats proposés par la chaîne,

gérer les commandes clients,

relier chaque commande aux plats commandés via une table intermédiaire.

🗂️ Structure des tables
🏢 Restaurants

Représente un restaurant de la chaîne GalaxyEat.

Nom du restaurant

Planète d’implantation

Année d’ouverture

👨‍🍳 Employees

Représente les employés travaillant dans les restaurants.

Prénom et nom

Rôle (serveur, cuisinier, manager, etc.)

Restaurant d’affectation

🍔 Dishes

Contient l’ensemble des plats disponibles.

Nom du plat

Prix

Catégorie (entrée, plat, dessert, etc.)

🧾 Orders

Représente les commandes passées par les clients.

Nom du client (ou numéro de table)

Montant total de la commande

Restaurant concerné

🔗 OrderItems

Table de liaison entre Orders et Dishes.

Associe une commande à un ou plusieurs plats

Indique la quantité de chaque plat commandé

👉 Cette table est essentielle pour gérer la relation many-to-many entre les commandes et les plats.

⚙️ Lancement du projet

Pour créer la base de données et les tables, exécute la commande suivante dans ton terminal :

sqlite3 database.db < database.sql


database.db : fichier de base de données SQLite

database.sql : script SQL contenant la création des tables

✅ Technologies utilisées

SQLite

SQL standard

Compatible avec des outils de visualisation comme draw.io ou dbdiagram.io
