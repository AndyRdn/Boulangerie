<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.vente.Vente" %>
<%@ page import="org.main.boulangerie.employe.Employer" %>
<%
    List<Vente> ventes = (List<Vente>) request.getAttribute("ventes");
    List<Employer> employers = (List<Employer>) request.getAttribute("employers");
%>
<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5>Liste des ventes</h5>
        <a href="/vente/form"><button type="submit" class="btn btn-dark float-end">Ajouter un nouveau vente</button></a>
    </div>
    <div class="card-body">
        <form action="/vente/employer" method="get">
            <div class="mb-6">
                <label class="form-label" for="basic-default-client">Client :</label>
                <select name="clientId" id="basic-default-client" class="form-select" required>
                    <% for (Employer employer : employers) { %>
                    <option value="<%= employer.getId() %>"><%= employer.getNom() %></option>
                    <% } %>
                </select>
            </div>
            <div class="mb-4">
                <label class="form-label" for="basic-default-categ">Date Début</label>
                <input type="dateDebut" name="daty" id="basic-default-categ" class="form-control">
            </div>
            <div class="mb-4">
                <label class="form-label" for="basic-default-daty">Date Fin</label>
                <input type="dateFin" name="daty" id="basic-default-daty" class="form-control">
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
                <th>Commission</th>
                <th>Nom vendeur</th>
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
<%--                <td><%= vente.getIdemployer.getIdcommission.get() %></td>--%>
<%--                <td><%= vente.getIdemployer.getNom %></td>--%>

            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
