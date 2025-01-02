<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.main.boulangerie.produit.Produit" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.model.Model" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%
    Produit produit = (Produit) request.getAttribute("produit");
    List<Model> models = (List<Model>) request.getAttribute("models");
    List<Categorieproduit> categories = (List<Categorieproduit>) request.getAttribute("categories");
%>
<!doctype html>
<html lang="en">
<body>

<div class="container mt-4">
    <div class="card mb-6">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Modifier le produit</h5>
            <small class="text-body float-end">Mettez à jour les informations du produit</small>
        </div>
        <div class="card-body">
            <form action="/produit/update" method="post">
                <input type="hidden" name="id" value="<%= produit.getId() %>">

                <div class="mb-3">
                    <label class="form-label" for="nom">Nom :</label>
                    <input type="text" class="form-control" id="nom" name="nom" value="<%= produit.getNom() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="prixvente">Prix de vente :</label>
                    <input type="number" step="0.01" class="form-control" id="prixvente" name="prixvente" value="<%= produit.getPrixvente() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="idmodel">Modèle :</label>
                    <select class="form-control" id="idmodel" name="idmodel" required>
                        <%
                            for (Model model : models) {
                                String selected = model.getId().equals(produit.getIdmodel().getId()) ? "selected" : "";
                        %>
                        <option value="<%= model.getId() %>" <%= selected %>><%= model.getNom() %></option>
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
                                String selected = categorie.getId().equals(produit.getIdcategorie().getId()) ? "selected" : "";
                        %>
                        <option value="<%= categorie.getId() %>" <%= selected %>><%= categorie.getNom() %></option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
                <a href="/produit/list" class="btn btn-dark mt-3">Annuler</a>
            </form>
        </div>
    </div>
</div>

</body>
</html>
