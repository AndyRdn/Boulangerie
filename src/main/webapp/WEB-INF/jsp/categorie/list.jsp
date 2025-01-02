<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%
    List<Categorieproduit> categories = (List<Categorieproduit>) request.getAttribute("categories");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Liste des catégories</h5>
        <small class="text-body float-end">Toutes les catégories</small>
    </div>
    <div class="card-body">
        <a href="/categorie/form"><button type="button" class="btn btn-primary mb-4">Ajouter une nouvelle catégorie</button></a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Categorieproduit categorie : categories) {
                %>
                <tr>
                    <td><%= categorie.getId() %></td>
                    <td><%= categorie.getNom() %></td>
                    <td>
                        <a href="/categorie/formUpdate?id=<%= categorie.getId() %>" class="btn btn-warning btn-sm">Modifier</a>
                        <form action="/categorie/delete" method="post" style="display: inline;">
                            <input type="hidden" name="id" value="<%= categorie.getId() %>">
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
