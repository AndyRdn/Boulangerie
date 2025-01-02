<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Ajouter un client</h5> <small class="text-body float-end">Nouveau client</small>
    </div>
    <div class="card-body">
        <form action="/client/save" method="post">
            <div class="mb-6">
                <label class="form-label" for="basic-default-name">Nom :</label>
                <input type="text" class="form-control" id="basic-default-name" placeholder="Nom...." name="nom" required>
            </div>
            <div class="mb-6">
                <label class="form-label" for="basic-default-date">Date de naissance :</label>
                <input type="date" class="form-control" id="basic-default-date" name="daty">
            </div>

            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>

        <a href="/client/list"><button type="submit" class="btn btn-dark">Retour à la liste des clients</button></a>
    </div>

</div>

</html>

