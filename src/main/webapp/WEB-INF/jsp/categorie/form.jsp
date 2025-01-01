<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter une catégorie</title>
</head>
<body>
<h1>Ajouter une catégorie</h1>
<form action="/categorie/save" method="post">
    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" required><br><br>
    <button type="submit">Enregistrer</button>
</form>
<a href="/categorie/list">Retour à la liste des catégories</a>
</body>
</html>
