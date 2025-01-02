<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.typemodel.Typemodel" %>
<%
    List<Typemodel> typemodels = (List<Typemodel>) request.getAttribute("typemodels");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Ajouter un modèle</h5> <small class="text-body float-end">Nouveau modèle</small>
    </div>
    <div class="card-body">
        <form action="/model/save" method="post">
            <div class="mb-6">
                <label class="form-label" for="basic-default-name">Nom :</label>
                <input type="text" class="form-control" id="basic-default-name" name="nom" required>
            </div>

            <div class="mb-6">
                <label class="form-label" for="idtypeproduit">Type de produit :</label>
                <select id="idtypeproduit" name="idtypeproduit" class="form-control" required>
                    <%
                        for (Typemodel typemodel : typemodels) {
                    %>
                    <option value="<%= typemodel.getId() %>"><%= typemodel.getNom() %></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>

        <a href="/model/list"><button type="button" class="btn btn-dark mt-3">Retour à la liste des modèles</button></a>
    </div>
</div>

</html>
