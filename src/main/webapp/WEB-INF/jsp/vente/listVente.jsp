<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.vente.Vente" %>
<%
    List<Vente> ventes = (List<Vente>) request.getAttribute("ventes");
%>
<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5>Liste des ventes</h5>
        <a href="/vente/form"><button type="submit" class="btn btn-dark float-end">Ajouter un nouveau vente</button></a>
    </div>


    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Dates d'achat</th>
                <th>Nom du client</th>
                <th>Nom du Vendeur</th>
                <th>Commission</th>
            </tr>
            </thead>
            <tbody class="table-border-bottom-0">
            <%
                for (Vente vente : ventes) {
            %>

            <tr>
                <td><%= vente.getId() %></td>
                <td><%= vente.getDaty() %></td>
                <td><%= vente.getIdclient().getNom() %></td>
                <td><%= vente.getIdvendeur().getNom() %></td>
                <td><%= vente.getCommission() %></td>

            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
