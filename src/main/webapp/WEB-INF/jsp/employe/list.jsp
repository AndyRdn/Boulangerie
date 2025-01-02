<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.employe.Employer" %>
<%
    List<Employer> employes = (List<Employer>) request.getAttribute("employes");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Liste des employés</h5> <small class="text-body float-end">Tous les employés</small>
    </div>
    <div class="card-body">
        <a href="/employe/form" class="btn btn-primary mb-3">Ajouter un nouvel employé</a>
        <table class="table">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Salaire</th>
                    <th>Date d'embauche</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Employer employe : employes) {
                %>
                <tr>
                    <td><%= employe.getId() %></td>
                    <td><%= employe.getNom() %></td>
                    <td><%= employe.getSalaire() %></td>
                    <td><%= employe.getDateembauche() %></td>
                    <td>
                        <a href="/employe/formUpdate?id=<%= employe.getId() %>" class="btn btn-warning btn-sm">Modifier</a>
                        <form action="/employe/delete" method="post" style="display: inline;">
                            <input type="hidden" name="id" value="<%= employe.getId() %>">
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
