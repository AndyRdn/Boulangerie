<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.main.boulangerie.produit.Produit" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.model.Model" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%
    Produit produit = (Produit) request.getAttribute("produit");
    List<Model> models = (List<Model>) request.getAttribute("models");
    List<Categorieproduit> categories = (List<Categorieproduit>) request.getAttribute("categories");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier le produit</title>
</head>
<body>
<h1>Modifier le produit</h1>
<form action="/produit/update" method="post">
    <input type="hidden" name="id" value="<%= produit.getId() %>">

    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" value="<%= produit.getNom() %>" required><br><br>

    <label for="prixvente">Prix de vente :</label>
    <input type="number" step="0.01" id="prixvente" name="prixvente" value="<%= produit.getPrixvente() %>" required><br><br>

    <label for="idmodel">Modèle :</label>
    <select id="idmodel" name="idmodel" required>
        <%
            for (Model model : models) {
                String selected = model.getId().equals(produit.getIdmodel().getId()) ? "selected" : "";
        %>
        <option value="<%= model.getId() %>" <%= selected %>><%= model.getNom() %></option>
        <%
            }
        %>
    </select><br><br>

    <label for="idcategorie">Catégorie :</label>
    <select id="idcategorie" name="idcategorie" required>
        <%
            for (Categorieproduit categorie : categories) {
                String selected = categorie.getId().equals(produit.getIdcategorie().getId()) ? "selected" : "";
        %>
        <option value="<%= categorie.getId() %>" <%= selected %>><%= categorie.getNom() %></option>
        <%
            }
        %>
    </select><br><br>

    <button type="submit">Enregistrer les modifications</button>
</form>
<a href="/produit/list">Annuler</a>
</body>
</html>
