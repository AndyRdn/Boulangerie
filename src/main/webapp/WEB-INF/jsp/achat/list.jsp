<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.achat.Achat" %>
<%
    List<Achat> achats = (List<Achat>) request.getAttribute("achats");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Liste des achats</h5>
        <a href="/achat/form"><button type="button" class="btn btn-dark mb-4">Effectuer un achat</button></a>
    </div>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Date</th>
                <th>Fournisseur</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Achat achat : achats) { %>
            <tr>
                <td><%= achat.getId() %></td>
                <td><%= achat.getDaty() %></td>
                <td><%= achat.getIdfournisseur().getNom() %></td>
                <td>
                    <form action="/achat/delete" method="post" style="display: inline;">
                        <input type="hidden" name="id" value="<%= achat.getId() %>">
                        <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

</html>
