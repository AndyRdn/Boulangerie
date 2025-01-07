<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.main.boulangerie.client.Client" %>
<%
    Client client = (Client) request.getAttribute("client");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Modifier un client</h5> 
        <small class="text-body float-end">Modification client</small>
    </div>
    <div class="card-body">
        <form action="/client/update" method="post">
            <input type="hidden" name="id" value="<%= client.getId() %>">
            
            <div class="mb-6">
                <label class="form-label" for="basic-default-name">Nom :</label>
                <input type="text" class="form-control" id="basic-default-name" 
                       name="nom" value="<%= client.getNom() %>" required>
            </div>
            <div class="mb-6">
                <label class="form-label" for="basic-default-date">Date de naissance :</label>
                <input type="date" class="form-control" id="basic-default-date" 
                       name="daty" value="<%= client.getDaty() %>" required>
            </div>

            <button type="submit" class="btn btn-primary">Mettre à jour</button>
        </form>

        <a href="/client/list"><button type="button" class="btn btn-dark">Retour à la liste des clients</button></a>
    </div>
</div>

</html>
