<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.produit.Produit" %>
<%@ page import="java.util.Collection" %>
<%@ page import="org.main.boulangerie.conseiller.Conseiller" %>

<%
    List<Conseiller> conseillers = (List<Conseiller>) request.getAttribute("conseillers");
%>
<!doctype html>
<html lang="en">
<body>

<div class="container mt-4">
    <div class="card mb-6">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Liste des produits</h5>
            <a href="/conseiller/form"><button type="button" class="btn btn-dark mb-3">Ajouter un produit du mois</button></a>
        </div>


        <div class="card-body">
            <form action="/conseiller/search" method="get">
                <div class="mb-4">
                    <label className="form-label" htmlFor="basic-default-month">Mois :</label>
                    <label class="form-label" for="basic-default-month">Mois :</label>
                    <select name="mois" id="basic-default-month" class="form-select">
                        <option value="1">Janvier</option>
                        <option value="2">Février</option>
                        <option value="3">Mars</option>
                        <option value="4">Avril</option>
                        <option value="5">Mai</option>
                        <option value="6">Juin</option>
                        <option value="7">Juillet</option>
                        <option value="8">Août</option>
                        <option value="9">Septembre</option>
                        <option value="10">Octobre</option>
                        <option value="11">Novembre</option>
                        <option value="12">Décembre</option>
                    </select>
                </div>

                <div class="mb-6">
                    <label class="form-label" for="basic-default-name">Année :</label>
                    <input type="number" class="form-control" id="basic-default-name" name="annee" required>
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
                    <th>Parfum</th>
                    <th>Catégorie</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Conseiller cons : conseillers) {
                %>
                <tr>
                    <td><a href="/produit/details?id=<%=cons.getIdproduit().getId()%>"><%= cons.getIdproduit().getId() %></a></td>
                    <td><%= cons.getIdproduit().getNom() %></td>
                    <td><%= cons.getIdproduit().getPrixvente() %></td>
                    <td><%= cons.getIdproduit().getIdparfum().getNom() %></td>
                    <td><%= cons.getIdproduit().getIdcategorie().getNom() %></td>
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
