<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%
    Categorieproduit categorie = (Categorieproduit) request.getAttribute("categorie");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Modifier une catégorie</h5>
        <small class="text-body float-end">Modification catégorie</small>
    </div>
    <div class="card-body">
        <form action="/categorie/update" method="post">
            <input type="hidden" name="id" value="<%= categorie.getId() %>">

            <div class="mb-6">
                <label class="form-label" for="basic-default-name">Nom :</label>
                <input type="text" class="form-control" id="basic-default-name" 
                       name="nom" value="<%= categorie.getNom() %>" required>
            </div>

            <button type="submit" class="btn btn-primary">Mettre à jour</button>
        </form>

        <a href="/categorie/list"><button type="button" class="btn btn-dark">Retour à la liste des catégories</button></a>
    </div>
</div>

</html>
