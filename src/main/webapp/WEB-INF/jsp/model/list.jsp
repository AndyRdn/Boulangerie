<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.model.Model" %>
<%
    List<Model> models = (List<Model>) request.getAttribute("models");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des modèles</title>
</head>
<body>
<h1>Liste des modèles</h1>
<a href="/model/form">Ajouter un nouveau modèle</a>
<table border="1">
    <thead>
    <tr>
        <th>Id</th>
        <th>Nom</th>
        <th>Type de produit</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Model model : models) {
    %>
    <tr>
        <td><%= model.getId() %></td>
        <td><%= model.getNom() %></td>
        <td><%= model.getIdtypeproduit().getNom() %></td>
        <td>
            <a href="/model/formUpdate?id=<%= model.getId() %>">Modifier</a>
            <form action="/model/delete" method="post" style="display: inline;">
                <input type="hidden" name="id" value="<%= model.getId() %>">
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
