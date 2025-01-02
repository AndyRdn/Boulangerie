<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.model.Model" %>
<%
    List<Model> models = (List<Model>) request.getAttribute("models");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Liste des modèles</h5> <small class="text-body float-end">Tous les modèles</small>
    </div>
    <div class="card-body">
        <a href="/model/form"><button type="button" class="btn btn-primary mb-3">Ajouter un nouveau modèle</button></a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Type de produit</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Model model : models) {
                %>
                <tr>
                    <td><%= model.getId() %></td>
                    <td><%= model.getNom() %></td>
                    <td><%= model.getIdtypeproduit().getNom() %></td>
                    <td>
                        <a href="/model/formUpdate?id=<%= model.getId() %>" class="btn btn-warning btn-sm">Modifier</a>
                        <form action="/model/delete" method="post" style="display: inline;">
                            <input type="hidden" name="id" value="<%= model.getId() %>">
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
