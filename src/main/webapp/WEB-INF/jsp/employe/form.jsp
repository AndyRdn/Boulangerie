<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Ajouter un employé</h5> <small class="text-body float-end">Nouvel employé</small>
    </div>
    <div class="card-body">
        <form action="/employe/save" method="post">
            <div class="mb-6">
                <label class="form-label" for="basic-default-name">Nom :</label>
                <input type="text" class="form-control" id="basic-default-name" placeholder="Nom...." name="nom" required>
            </div>
            <div class="mb-6">
                <label class="form-label" for="basic-default-salaire">Salaire :</label>
                <input type="number" class="form-control" id="basic-default-salaire" name="salaire" step="0.01" required>
            </div>
            <div class="mb-6">
                <label class="form-label" for="basic-default-dateembauche">Date d'embauche :</label>
                <input type="date" class="form-control" id="basic-default-dateembauche" name="dateembauche" required>
            </div>

            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>

        <a href="/employe/list"><button type="submit" class="btn btn-dark">Retour à la liste des employés</button></a>
    </div>

</div>

</html>
