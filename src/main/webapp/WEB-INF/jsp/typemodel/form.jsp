<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<body>

<div class="container mt-4">
    <div class="card mb-6">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Ajouter un type de modèle</h5>
            <small class="text-body float-end">Complétez le formulaire pour ajouter un nouveau type de modèle</small>
        </div>
        <div class="card-body">
            <form action="/typemodel/save" method="post">
                <div class="mb-3">
                    <label class="form-label" for="nom">Nom :</label>
                    <input type="text" class="form-control" id="nom" name="nom" required>
                </div>
                
                <button type="submit" class="btn btn-primary">Enregistrer</button>
                <a href="/typemodel/list" class="btn btn-dark mt-3">Retour à la liste des types</a>
            </form>
        </div>
    </div>
</div>

</body>
</html>
