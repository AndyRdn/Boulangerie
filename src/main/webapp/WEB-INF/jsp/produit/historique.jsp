<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.historiquePrixProduit.Historiqueprixproduit" %>
<%@ page import="org.main.boulangerie.produit.Produit" %>
<%
    List<Historiqueprixproduit> hiso= (List<Historiqueprixproduit>) request.getAttribute("historique");
    List<Produit> produits = (List<Produit>) request.getAttribute("produits");

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
            <form action="/produit/searchHisto" method="post">
                <div class="mb-4">
                    <label class="form-label" for="basic-default-categ">Categorie :</label>
                    <select name="idCategorie" id="basic-default-categ" class="form-select">
                        <% for (Produit c : produits) { %>
                        <option value="<%= c.getId() %>"><%= c.getNom() %></option>
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
                    <th>Date</th>
                    <th>Prix de vente</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Historiqueprixproduit hisos : hiso) {
                %>
                <tr>
                    <td><%= hisos.getId()%></td>
                    <td><%= hisos.getIdproduit().getNom()%></td>
                    <td><%= hisos.getDaty() %></td>
                    <td><%= hisos.getPrix() %></td>
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
