<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Ajouter un fournisseur</h5> <small class="text-body float-end">Nouveau fournisseur</small>
    </div>
    <div class="card-body">
        <form action="/fournisseur/save" method="post">
            <div class="mb-6">
                <label class="form-label" for="basic-default-name">Nom :</label>
                <input type="text" class="form-control" id="basic-default-name" placeholder="Nom...." name="nom" required>
            </div>

            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>

        <a href="/fournisseur/list"><button type="button" class="btn btn-dark mt-3">Retour à la liste des fournisseurs</button></a>
    </div>
</div>

</html>
