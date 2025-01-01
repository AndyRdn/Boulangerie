<%--
  Created by IntelliJ IDEA.
  User: DCI
  Date: 23/12/2024
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.main.boulangerie.employe.Employer" %>
<%
    Employer employe = (Employer) request.getAttribute("employe");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un employé</title>
</head>
<body>
<h1>Modifier un employé</h1>
<form action="/employe/update" method="post">
    <input type="hidden" name="id" value="<%= employe.getId() %>">

    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" value="<%= employe.getNom() %>" required><br>

    <label for="salaire">Salaire :</label>
    <input type="number" id="salaire" name="salaire" value="<%= employe.getSalaire() %>" step="0.01" required><br>

    <label for="dateembauche">Date d'embauche :</label>
    <input type="date" id="dateembauche" name="dateembauche" value="<%= employe.getDateembauche() %>" required><br>

    <button type="submit">Mettre à jour</button>
</form>
</body>
</html>
