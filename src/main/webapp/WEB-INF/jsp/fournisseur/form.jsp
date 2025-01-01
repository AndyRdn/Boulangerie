<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un fournisseur</title>
</head>
<body>
<h1>Ajouter un fournisseur</h1>
<form action="/fournisseur/save" method="post">
    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" required><br><br>
    <button type="submit">Enregistrer</button>
</form>
<a href="/fournisseur/list">Retour à la liste des fournisseurs</a>
</body>
</html>
