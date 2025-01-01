<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.main.boulangerie.fournisseur.Fournisseur" %>
<%
    Fournisseur fournisseur = (Fournisseur) request.getAttribute("fournisseur");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un fournisseur</title>
</head>
<body>
<h1>Modifier un fournisseur</h1>
<form action="/fournisseur/update" method="post">
    <input type="hidden" name="id" value="<%= fournisseur.getId() %>">

    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" value="<%= fournisseur.getNom() %>" required><br><br>

    <button type="submit">Mettre à jour</button>
</form>
<a href="/fournisseur/list">Retour à la liste des fournisseurs</a>
</body>
</html>
