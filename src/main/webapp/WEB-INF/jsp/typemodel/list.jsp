<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.typemodel.Typemodel" %>
<%
    List<Typemodel> typemodels = (List<Typemodel>) request.getAttribute("typemodels");
%>
<!doctype html>
<html lang="en">
<body>

<div class="container mt-4">
    <div class="card mb-6">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Liste des types de modèles</h5>
            <a href="/typemodel/form" class="btn btn-primary">Ajouter un nouveau type</a>
        </div>
        <div class="card-body">
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
                        for (Typemodel typemodel : typemodels) {
                    %>
                    <tr>
                        <td><%= typemodel.getId() %></td>
                        <td><%= typemodel.getNom() %></td>
                        <td>
                            <a href="/typemodel/formUpdate?id=<%= typemodel.getId() %>" class="btn btn-warning btn-sm">Modifier</a>
                            <form action="/typemodel/delete" method="post" style="display: inline;">
                                <input type="hidden" name="id" value="<%= typemodel.getId() %>">
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
</div>

</body>
</html>
