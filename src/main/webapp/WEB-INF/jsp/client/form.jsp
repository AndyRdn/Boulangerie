<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un client</title>
</head>
<body>
<h1>Ajouter un client</h1>
<form action="/client/save" method="post">
    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" required><br><br>

    <label for="daty">Date de naissance :</label>
    <input type="date" id="daty" name="daty" required><br><br>

    <button type="submit">Enregistrer</button>
</form>
<a href="/client/list">Retour à la liste des clients</a>
</body>
</html>
