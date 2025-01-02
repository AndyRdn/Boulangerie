<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.model.Model" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%
    List<Model> models = (List<Model>) request.getAttribute("models");
    List<Categorieproduit> categories = (List<Categorieproduit>) request.getAttribute("categories");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Ajouter un produit</h5>
        <small class="text-body float-end">Remplissez le formulaire pour ajouter un nouveau produit</small>
    </div>
    <div class="card-body">
        <form action="/produit/save" method="post">
            <div class="mb-3">
                <label class="form-label" for="nom">Nom :</label>
                <input type="text" class="form-control" id="nom" name="nom" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="prixvente">Prix de vente :</label>
                <input type="number" step="0.01" class="form-control" id="prixvente" name="prixvente" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="idmodel">Modèle :</label>
                <select class="form-control" id="idmodel" name="idmodel" required>
                    <%
                        for (Model model : models) {
                    %>
                    <option value="<%= model.getId() %>"><%= model.getNom() %></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label" for="idcategorie">Catégorie :</label>
                <select class="form-control" id="idcategorie" name="idcategorie" required>
                    <%
                        for (Categorieproduit categorie : categories) {
                    %>
                    <option value="<%= categorie.getId() %>"><%= categorie.getNom() %></option>
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
