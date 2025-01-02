<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.main.boulangerie.fournisseur.Fournisseur" %>
<%
    Fournisseur fournisseur = (Fournisseur) request.getAttribute("fournisseur");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Modifier un fournisseur</h5> <small class="text-body float-end">Mise à jour des informations</small>
    </div>
    <div class="card-body">
        <form action="/fournisseur/update" method="post">
            <input type="hidden" name="id" value="<%= fournisseur.getId() %>">

            <div class="mb-6">
                <label class="form-label" for="basic-default-name">Nom :</label>
                <input type="text" class="form-control" id="basic-default-name" name="nom" value="<%= fournisseur.getNom() %>" required>
            </div>

            <button type="submit" class="btn btn-primary">Mettre à jour</button>
        </form>

        <a href="/fournisseur/list"><button type="button" class="btn btn-dark mt-3">Retour à la liste des fournisseurs</button></a>
    </div>
</div>

</html>
