<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.produit.Produit" %>

<%
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
                    <td><a href="/produit/details?id=<%=produit.getId()%>"><%= produit.getId() %></a></td>
                    <td><%= produit.getNom() %></td>
                    <td><%= produit.getPrixvente() %></td>
                    <td><%= produit.getIdmodel().getNom() %></td>
                    <td><%= produit.getIdcategorie().getNom() %></td>
                    <td>
                        <%--                        <a href="/produit/formUpdate?id=<%= produit.getId() %>" class="btn btn-warning btn-sm">Modifier</a>--%>
                        <%--                        <form action="/produit/delete" method="post" style="display: inline;">--%>
                        <%--                            <input type="hidden" name="id" value="<%= produit.getId() %>">--%>
                        <%--                            <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>--%>
                        <%--                        </form>--%>
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
