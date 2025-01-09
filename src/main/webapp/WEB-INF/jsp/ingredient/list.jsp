<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%@ page import="org.main.boulangerie.ingredient.Ingredient" %>
<%
    List<Ingredient> ingredients = (List<Ingredient>) request.getAttribute("ingredients");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5>Liste des Ingredients</h5>
        <a href="/ingredient/form"><button type="button" class="btn btn-dark mb-4">Ajouter un ingredient</button></a>
    </div>
    <div class="table-responsive">

        <table class="table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Nom</th>
                <th>Type Model</th>
                <th>Prix</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Ingredient ingredient : ingredients) {
            %>
            <tr>
                <td><%= ingredient.getId() %></td>
                <td><%= ingredient.getIdmodel().getNom() %></td>
                <td><%= ingredient.getIdmodel().getIdtypeproduit().getNom()%></td>
                <td><%= ingredient.getPrix() %></td>
                <td>
<%--                    <a href="/categorie/formUpdate?id=<%= ingredient.getId() %>" class="btn btn-warning btn-sm">Modifier</a>--%>
<%--                    <form action="/categorie/delete" method="post" style="display: inline;">--%>
<%--                        <input type="hidden" name="id" value="<%= ingredient.getId() %>">--%>
<%--                        <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>--%>
<%--                    </form>--%>
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
