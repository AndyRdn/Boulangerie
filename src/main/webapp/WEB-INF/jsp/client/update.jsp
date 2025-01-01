<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.main.boulangerie.client.Client" %>
<%
    Client client = (Client) request.getAttribute("client");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un client</title>
</head>
<body>
<h1>Modifier un client</h1>
<form action="/client/update" method="post">
    <input type="hidden" name="id" value="<%= client.getId() %>">

    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" value="<%= client.getNom() %>" required><br><br>

    <label for="daty">Date de naissance :</label>
    <input type="date" id="daty" name="daty" value="<%= client.getDaty() %>" required><br><br>

    <button type="submit">Mettre à jour</button>
</form>
<a href="/client/list">Retour à la liste des clients</a>
</body>
</html>
