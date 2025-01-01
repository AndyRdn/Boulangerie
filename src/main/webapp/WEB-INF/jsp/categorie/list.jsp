<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%
    List<Categorieproduit> categories = (List<Categorieproduit>) request.getAttribute("categories");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des catégories</title>
</head>
<body>
<h1>Liste des catégories</h1>
<a href="/categorie/form">Ajouter une nouvelle catégorie</a>
<table border="1">
    <thead>
    <tr>
        <th>Id</th>
        <th>Nom</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Categorieproduit categorie : categories) {
    %>
    <tr>
        <td><%= categorie.getId() %></td>
        <td><%= categorie.getNom() %></td>
        <td>
            <a href="/categorie/formUpdate?id=<%= categorie.getId() %>">Modifier</a>
            <form action="/categorie/delete" method="post" style="display: inline;">
                <input type="hidden" name="id" value="<%= categorie.getId() %>">
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
