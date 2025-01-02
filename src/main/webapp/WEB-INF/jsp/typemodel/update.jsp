<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.main.boulangerie.typemodel.Typemodel" %>
<%
    Typemodel typemodel = (Typemodel) request.getAttribute("typemodel");
%>
<!doctype html>
<html lang="en">
<body>

<div class="container mt-4">
    <div class="card mb-6">
        <div class="card-header">
            <h5 class="mb-0">Modifier un type de modèle</h5>
        </div>
        <div class="card-body">
            <form action="/typemodel/update" method="post">
                <input type="hidden" name="id" value="<%= typemodel.getId() %>">

                <div class="mb-3">
                    <label for="nom" class="form-label">Nom :</label>
                    <input type="text" id="nom" name="nom" class="form-control" value="<%= typemodel.getNom() %>" required>
                </div>

                <button type="submit" class="btn btn-primary">Mettre à jour</button>
            </form>
        </div>
    </div>

    <a href="/typemodel/list" class="btn btn-secondary mt-3">Retour à la liste des types</a>
</div>

</body>
</html>
