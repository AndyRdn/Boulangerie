<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%@ page import="org.main.boulangerie.parfum.Parfum" %>
<%@ page import="org.main.boulangerie.vente.ventedetail.Ventedetail" %>
<%@ page import="org.main.boulangerie.parfum.Parfum" %>
<%@ page import="org.main.boulangerie.vente.ventedetail.Ventedetail" %>
<%
    List<Ventedetail> production = (List<Ventedetail>) request.getAttribute("vente");
    List<Categorieproduit> categ = (List<Categorieproduit>) request.getAttribute("categ");
    List<Parfum> ing = (List<Parfum>) request.getAttribute("parf");
%>
<!doctype html>
<html lang="en">
<body>

<div class="container mt-4">
    <div class="card mb-6">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Liste des Vente</h5>
            <a href="/vente/form"><button type="button" class="btn btn-dark mb-3">Cree un produit</button></a>
        </div>
        <div class="card-body">
            <form action="/vente/search" method="post">
                <div class="mb-4">
                    <label class="form-label" for="basic-default-categ">Categorie :</label>
                    <select name="idCategorie" id="basic-default-categ" class="form-select">
                        <% for (Categorieproduit c : categ) { %>
                        <option value="<%= c.getId() %>"><%= c.getNom() %></option>
                        <% } %>
                    </select>
                </div>

                <div class="mb-4">
                    <label class="form-label" for="basic-default-ing">Parfum :</label>
                    <select name="idparfum" id="basic-default-ing" class="form-select">
                        <% for (Parfum i : ing) { %>
                        <option value="<%= i.getId() %>"><%= i.getNom() %></option>
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
                    <th>Prix Unitaire</th>
                    <th>Quantiter</th>
                    <th>Catégorie</th>
<%--                    <th>Actions</th>--%>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Ventedetail product : production) {
                %>
                <tr>
                    <td><%= product.getId() %></td>
                    <td><%= product.getIdproduit().getNom() %></td>
                    <td><%= product.getIdproduit().getPrixvente() %></td>

                    <td><%= product.getQuantite() %></td>
                    <td><%= product.getIdproduit().getIdcategorie().getNom() %></td>
<%--                    <td>--%>
<%--                        <a href="/production/formUpdate?id=<%= product.getId() %>" class="btn btn-warning btn-sm">Modifier</a>--%>
<%--                        <form action="/production/delete" method="post" style="display: inline;">--%>
<%--                            <input type="hidden" name="id" value="<%= product.getId() %>">--%>
<%--                            <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>--%>
<%--                        </form>--%>
<%--                    </td>--%>
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
