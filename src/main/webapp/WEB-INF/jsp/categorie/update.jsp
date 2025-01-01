<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%
    Categorieproduit categorie = (Categorieproduit) request.getAttribute("categorie");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier une catégorie</title>
</head>
<body>
<h1>Modifier une catégorie</h1>
<form action="/categorie/update" method="post">
    <input type="hidden" name="id" value="<%= categorie.getId() %>">

    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" value="<%= categorie.getNom() %>" required><br><br>

    <button type="submit">Mettre à jour</button>
</form>
<a href="/categorie/list">Retour à la liste des catégories</a>
</body>
</html>
