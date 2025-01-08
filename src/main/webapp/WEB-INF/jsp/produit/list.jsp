<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.produit.Produit" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%@ page import="org.main.boulangerie.ingredient.Ingredient" %>
<%
    List<Produit> produits = (List<Produit>) request.getAttribute("produits");
    List<Categorieproduit> categ = (List<Categorieproduit>) request.getAttribute("categ");
    List<Ingredient> ing = (List<Ingredient>) request.getAttribute("ing");
%>
<!doctype html>
<html lang="en">
<body>

<div class="container mt-4">
    <div class="card mb-6">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Liste des produits</h5>
            <a href="/produit/form"><button type="button" class="btn btn-dark mb-3">Cree un produit</button></a>
        </div>
        <div class="card-body">
            <form action="/produit/search" method="post">
                <div class="mb-4">
                    <label class="form-label" for="basic-default-categ">Categorie :</label>
                    <select name="idCategorie" id="basic-default-categ" class="form-select">
                        <% for (Categorieproduit c : categ) { %>
                        <option value="<%= c.getId() %>"><%= c.getNom() %></option>
                        <% } %>
                    </select>
                </div>

                <div class="mb-4">
                    <label class="form-label" for="basic-default-ing">Ingredient :</label>
                    <select name="idIngredient" id="basic-default-ing" class="form-select">
                        <% for (Ingredient i : ing) { %>
                        <option value="<%= i.getId() %>"><%= i.getIdmodel().getNom() %></option>
                        <% } %>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Search</button>

            </form>
        </div>

        <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0"></h5>
            <small class="text-body float-end"></small>
        </div>
        <div class="card-body">
            <table class="table table-striped">
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
                        <a href="/produit/formUpdate?id=<%= produit.getId() %>" class="btn btn-warning btn-sm">Modifier</a>
                        <form action="/produit/delete" method="post" style="display: inline;">
                            <input type="hidden" name="id" value="<%= produit.getId() %>">
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
</div>

</body>
</html>
