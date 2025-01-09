<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%@ page import="org.main.boulangerie.ingredient.Ingredient" %>
<%@ page import="org.main.boulangerie.produit.Produit" %>
<%@ page import="org.main.boulangerie.produit.produitDetails.ProduitDetail" %>
<%
    Produit produit = (Produit) request.getAttribute("produit");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5>Liste des Ingredients du <%=produit.getNom()%></h5>
        <a href="/produit/list"><button type="button" class="btn btn-dark mb-4">Liste des produit</button></a>
    </div>
    <div class="table-responsive">

        <table class="table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Nom</th>
                <th>Type Model</th>
                <th>Prix</th>
                <th>Quantite</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (ProduitDetail ingredient : produit.getDetails()) {
            %>
            <tr>
                <td><%= ingredient.getId() %></td>
                <td><%= ingredient.getIdingredient().getIdmodel().getNom() %></td>
                <td><%= ingredient.getIdingredient().getIdmodel().getIdtypeproduit().getNom()%></td>
                <td><%= ingredient.getIdingredient().getPrix() %></td>
                <td><%= ingredient.getQuantite() %></td>
                <td>
                    <a href="/categorie/formUpdate?id=<%= ingredient.getId() %>" class="btn btn-warning btn-sm">Modifier</a>
                    <form action="/categorie/delete" method="post" style="display: inline;">
                        <input type="hidden" name="id" value="<%= ingredient.getId() %>">
                        <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

</html>
