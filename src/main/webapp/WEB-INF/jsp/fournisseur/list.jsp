<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.fournisseur.Fournisseur" %>
<%
    List<Fournisseur> fournisseurs = (List<Fournisseur>) request.getAttribute("fournisseurs");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5>Liste des fournisseurs</h5>
        <a href="/fournisseur/form"><button type="button" class="btn btn-dark mb-4">Ajouter un nouveau fournisseur</button></a>
    </div>
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Fournisseur fournisseur : fournisseurs) {
                %>
                <tr>
                    <td><%= fournisseur.getId() %></td>
                    <td><%= fournisseur.getNom() %></td>
                    <td>
                        <a href="/fournisseur/formUpdate?id=<%= fournisseur.getId() %>" class="btn btn-warning btn-sm">Modifier</a>
                        <form action="/fournisseur/delete" method="post" style="display: inline;">
                            <input type="hidden" name="id" value="<%= fournisseur.getId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
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

</html>
