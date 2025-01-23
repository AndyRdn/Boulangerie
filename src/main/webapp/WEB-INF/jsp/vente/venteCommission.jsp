<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.vente.Vente" %>
<%@ page import="org.main.boulangerie.employe.Employer" %>
<%@ page import="org.main.boulangerie.vente.VenteCommissionParVendeur" %>
<%
    List<VenteCommissionParVendeur> ventes = (List<VenteCommissionParVendeur>) request.getAttribute("ventes");
    Double homme= (Double) request.getAttribute("homme");
    Double femme= (Double) request.getAttribute("femme");
//    List<Employer> employers = (List<Employer>) request.getAttribute("employers");
%>
<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5>Liste des ventes</h5>
        <a href="/vente/form"><button type="submit" class="btn btn-dark float-end">Ajouter un nouveau vente</button></a>
    </div>
    <div class="card-body">
        <form action="/vente/listVenteComs" method="get">
<%--            <div class="mb-6">--%>
<%--                <label class="form-label" for="basic-default-client">Client :</label>--%>
<%--                <select name="clientId" id="basic-default-client" class="form-select" required>--%>
<%--                    <% for (Employer employer : employers) { %>--%>
<%--                    <option value="<%= employer.getId() %>"><%= employer.getNom() %></option>--%>
<%--                    <% } %>--%>
<%--                </select>--%>
<%--            </div>--%>
            <div class="mb-4">
                <label class="form-label" for="basic-default-categ">Date Début</label>
                <input type="date" name="dateDebut" id="basic-default-categ" class="form-control">
            </div>
            <div class="mb-4">
                <label class="form-label" for="basic-default-daty">Date Fin</label>
                <input type="date" name="dateFin" id="basic-default-daty" class="form-control">
            </div>
            <button type="submit" class="btn btn-primary">Rechercher</button>

        </form>
    </div>
    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
                <tr>
                    <th>
                        Total des Commissions des Hommes
                    </th>
                    <th>
                        Total des Commissions des Femmes
                    </th>
                </tr>
            </thead>
            <tbody class="table-border-bottom-0">
            <tr>
                <td>
                    <%= homme.doubleValue() %>
                </td>
                <td>
                    <%= femme.doubleValue() %>
                </td>
            </tr>
            </tbody>
        </table>
    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Nom vendeur</th>
                <th>Commission</th>
                <th>Genre</th>
            </tr>
            </thead>
            <tbody class="table-border-bottom-0">
            <%
                for (VenteCommissionParVendeur vente : ventes) {
            %>

            <tr>
                <td><%= vente.getIdVendeur() %></td>
                <td><%= vente.getNomVendeur() %></td>
                <td><%= vente.getTotalCommission() %></td>
                <td><%= vente.getGenre %></td>
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
