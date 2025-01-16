<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.vente.Client" %>
<%@ page import="org.main.boulangerie.vente.Vente" %>
<%
    List<Vente> ventes = (List<Vente>) request.getAttribute("vente");
%>
<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5>Liste des ventes</h5>
        <a href="/vente/form"><button type="submit" class="btn btn-dark float-end">Ajouter un nouveau vente</button></a>
    </div>
    <div class="card-body">
        <form action="/vente/listClient" method="get">
            <div class="mb-4">
                <label class="form-label" for="basic-default-categ">Client pour les ventes en:</label>
                <input type="date" name="daty" id="basic-default-categ" class="form-select">
            </div>
            <button type="submit" class="btn btn-primary">Rechercher</button>

        </form>
    </div>


    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Dates d'achat</th>
                <th>Nom du client</th>
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

                <td>
                    <a href="/vente/formUpdate?id=<%= vente.getId() %>">Modifier</a>
                    <form action="/vente/delete" method="post" style="display: inline;">
                        <input type="hidden" name="id" value="<%= vente.getId() %>">
                        <button type="submit">Supprimer</button>
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
