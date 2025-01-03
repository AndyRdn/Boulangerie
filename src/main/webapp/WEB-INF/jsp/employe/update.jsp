<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.main.boulangerie.employe.Employer" %>
<%
    Employer employe = (Employer) request.getAttribute("employe");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Modifier un employé</h5> <small class="text-body float-end">Modification des informations</small>
    </div>
    <div class="card-body">
        <form action="/employe/update" method="post">
            <input type="hidden" name="id" value="<%= employe.getId() %>">

            <div class="mb-6">
                <label class="form-label" for="basic-default-name">Nom :</label>
                <input type="text" class="form-control" id="basic-default-name" name="nom" value="<%= employe.getNom() %>" required>
            </div>

            <div class="mb-6">
                <label class="form-label" for="basic-default-salaire">Salaire :</label>
                <input type="number" class="form-control" id="basic-default-salaire" name="salaire" value="<%= employe.getSalaire() %>" step="0.01" required>
            </div>

            <div class="mb-6">
                <label class="form-label" for="basic-default-dateembauche">Date d'embauche :</label>
                <input type="date" class="form-control" id="basic-default-dateembauche" name="dateembauche" value="<%= employe.getDateembauche() %>" required>
            </div>

            <button type="submit" class="btn btn-primary">Mettre à jour</button>
        </form>
    </div>
</div>

</html>
