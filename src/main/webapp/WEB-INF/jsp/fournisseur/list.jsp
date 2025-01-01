<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.fournisseur.Fournisseur" %>
<%
    List<Fournisseur> fournisseurs = (List<Fournisseur>) request.getAttribute("fournisseurs");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des fournisseurs</title>
</head>
<body>
<h1>Liste des fournisseurs</h1>
<a href="/fournisseur/form">Ajouter un nouveau fournisseur</a>
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
        for (Fournisseur fournisseur : fournisseurs) {
    %>
    <tr>
        <td><%= fournisseur.getId() %></td>
        <td><%= fournisseur.getNom() %></td>
        <td>
            <a href="/fournisseur/formUpdate?id=<%= fournisseur.getId() %>">Modifier</a>
            <form action="/fournisseur/delete" method="post" style="display: inline;">
                <input type="hidden" name="id" value="<%= fournisseur.getId() %>">
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
