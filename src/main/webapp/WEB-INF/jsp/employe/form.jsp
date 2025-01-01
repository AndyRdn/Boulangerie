<%--
  Created by IntelliJ IDEA.
  User: DCI
  Date: 23/12/2024
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un employé</title>
</head>
<body>
<h1>Ajouter un employé</h1>
<form action="/employe/save" method="post">
    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" required><br>

    <label for="salaire">Salaire :</label>
    <input type="number" id="salaire" name="salaire" step="0.01" required><br>

    <label for="dateembauche">Date d'embauche :</label>
    <input type="date" id="dateembauche" name="dateembauche" required><br>

    <button type="submit">Enregistrer</button>
</form>
</body>
</html>
