<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.model.Model" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%@ page import="org.main.boulangerie.typemodel.Typemodel" %>
<%
    List<Typemodel> tModels = (List<Typemodel>) request.getAttribute("typeModels");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Ajouter un Ingredient</h5>
        <small class="text-body float-end">Remplissez le formulaire pour ajouter une nouvelle ingredient</small>
    </div>
    <div class="card-body">
        <form action="/ingredient/save" method="post">
            <div class="mb-3">
                <label class="form-label" for="nom">Nom :</label>
                <input type="text" class="form-control" id="nom" name="nom" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="prix">Prix:</label>
                <input type="number" step="0.01" class="form-control" id="prix" name="prix" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="typeModel">TypeModèle :</label>
                <select class="form-control" id="typeModel" name="typeModel" required>
                    <%
                        for (Typemodel tModel : tModels) {
                    %>
                    <option value="<%= tModel.getId() %>"><%= tModel.getNom() %></option>
                    <%
                        }
                    %>
                </select>
            </div>


            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>

        <a href="/produit/list"><button type="button" class="btn btn-dark mt-3">Retour à la liste des produits</button></a>
    </div>
</div>

</html>
