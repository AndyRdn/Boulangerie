<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un type de modèle</title>
</head>
<body>
<h1>Ajouter un type de modèle</h1>
<form action="/typemodel/save" method="post">
    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" required><br><br>
    <button type="submit">Enregistrer</button>
</form>
<a href="/typemodel/list">Retour à la liste des types</a>
</body>
</html>
