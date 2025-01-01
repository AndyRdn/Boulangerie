<%--
  Created by IntelliJ IDEA.
  User: DCI
  Date: 23/12/2024
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.employe.Employer" %>
<%
    List<Employer> employes = (List<Employer>) request.getAttribute("employes");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des employés</title>
</head>
<body>
<h1>Liste des employés</h1>
<a href="/employe/form">Ajouter un nouvel employé</a>
<table border="1">
    <thead>
    <tr>
        <th>Id</th>
        <th>Nom</th>
        <th>Salaire</th>
        <th>Date d'embauche</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Employer employe : employes) {
    %>
    <tr>
        <td><%= employe.getId() %></td>
        <td><%= employe.getNom() %></td>
        <td><%= employe.getSalaire() %></td>
        <td><%= employe.getDateembauche() %></td>
        <td>
            <a href="/employe/formUpdate?id=<%= employe.getId() %>">Modifier</a>
            <form action="/employe/delete" method="post" style="display: inline;">
                <input type="hidden" name="id" value="<%= employe.getId() %>">
                <button type="submit">Supprimer</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
