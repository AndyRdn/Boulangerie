<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.client.Client" %>
<%
    List<Client> clients = (List<Client>) request.getAttribute("clients");
%>
<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5>Liste des clients</h5>
        <a href="/client/form"><button type="submit" class="btn btn-dark float-end">Ajouter un nouveau client</button></a>
    </div>


    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Nom</th>
                <th>Date de naissance</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody class="table-border-bottom-0">
            <%
                for (Client client : clients) {
            %>

            <tr>
                <td><%= client.getId() %></td>
                <td><%= client.getNom() %></td>
                <td><%= client.getDaty() %></td>
                <td>
                    <a href="/client/formUpdate?id=<%= client.getId() %>">Modifier</a>
                    <form action="/client/delete" method="post" style="display: inline;">
                        <input type="hidden" name="id" value="<%= client.getId() %>">
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
