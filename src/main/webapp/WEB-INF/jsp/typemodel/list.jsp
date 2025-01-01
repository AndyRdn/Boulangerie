<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.typemodel.Typemodel" %>
<%
    List<Typemodel> typemodels = (List<Typemodel>) request.getAttribute("typemodels");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des types de modèles</title>
</head>
<body>
<h1>Liste des types de modèles</h1>
<a href="/typemodel/form">Ajouter un nouveau type de modèle</a>
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
        for (Typemodel typemodel : typemodels) {
    %>
    <tr>
        <td><%= typemodel.getId() %></td>
        <td><%= typemodel.getNom() %></td>
        <td>
            <a href="/typemodel/formUpdate?id=<%= typemodel.getId() %>">Modifier</a>
            <form action="/typemodel/delete" method="post" style="display: inline;">
                <input type="hidden" name="id" value="<%= typemodel.getId() %>">
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
