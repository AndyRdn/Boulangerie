<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.main.boulangerie.typemodel.Typemodel" %>
<%
    Typemodel typemodel = (Typemodel) request.getAttribute("typemodel");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un type de modèle</title>
</head>
<body>
<h1>Modifier un type de modèle</h1>
<form action="/typemodel/update" method="post">
    <input type="hidden" name="id" value="<%= typemodel.getId() %>">

    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" value="<%= typemodel.getNom() %>" required><br><br>

    <button type="submit">Mettre à jour</button>
</form>
<a href="/typemodel/list">Retour à la liste des types</a>
</body>
</html>
