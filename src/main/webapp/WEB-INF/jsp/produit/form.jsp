<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.model.Model" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%
    List<Model> models = (List<Model>) request.getAttribute("models");
    List<Categorieproduit> categories = (List<Categorieproduit>) request.getAttribute("categories");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un produit</title>
</head>
<body>
<h1>Ajouter un produit</h1>
<form action="/produit/save" method="post">
    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" required><br><br>

    <label for="prixvente">Prix de vente :</label>
    <input type="number" step="0.01" id="prixvente" name="prixvente" required><br><br>

    <label for="idmodel">Modèle :</label>
    <select id="idmodel" name="idmodel" required>
        <%
            for (Model model : models) {
        %>
        <option value="<%= model.getId() %>"><%= model.getNom() %></option>
        <%
            }
        %>
    </select><br><br>

    <label for="idcategorie">Catégorie :</label>
    <select id="idcategorie" name="idcategorie" required>
        <%
            for (Categorieproduit categorie : categories) {
        %>
        <option value="<%= categorie.getId() %>"><%= categorie.getNom() %></option>
        <%
            }
        %>
    </select><br><br>

    <button type="submit">Enregistrer</button>
</form>
<a href="/produit/list">Retour à la liste des produits</a>
</body>
</html>
