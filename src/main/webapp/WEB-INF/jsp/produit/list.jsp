<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.produit.Produit" %>
<%
    List<Produit> produits = (List<Produit>) request.getAttribute("produits");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des produits</title>
</head>
<body>
<h1>Liste des produits</h1>
<a href="/produit/form">Ajouter un nouveau produit</a>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prix de vente</th>
        <th>Modèle</th>
        <th>Catégorie</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Produit produit : produits) {
    %>
    <tr>
        <td><%= produit.getId() %></td>
        <td><%= produit.getNom() %></td>
        <td><%= produit.getPrixvente() %></td>
        <td><%= produit.getIdmodel().getNom() %></td>
        <td><%= produit.getIdcategorie().getNom() %></td>
        <td>
            <a href="/produit/formUpdate?id=<%= produit.getId() %>">Modifier</a>
            <form action="/produit/delete" method="post" style="display: inline;">
                <input type="hidden" name="id" value="<%= produit.getId() %>">
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
