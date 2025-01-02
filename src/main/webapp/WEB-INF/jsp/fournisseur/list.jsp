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
        <h5 class="mb-0">Liste des fournisseurs</h5> <small class="text-body float-end">Tous les fournisseurs</small>
    </div>
    <div class="card-body">
        <a href="/fournisseur/form" class="btn btn-primary mb-3">Ajouter un nouveau fournisseur</a>
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
