<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.produit.Produit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<%
    List<Produit> produits= (List<Produit>) request.getAttribute("produit");
%>

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Produire</h5> <small class="text-body float-end">Nouvelle production</small>
    </div>
    <div class="card-body">
        <form action="/production/save" method="post">

            <div class="mb-3">
                <label class="form-label" for="basic-default-produit">Produit :</label>
                <select name="idproduit" id="basic-default-produit" class="form-select">
                    <% for (Produit p : produits) { %>
                    <option value="<%= p.getId() %>"><%= p.getNom() %></option>
                    <% } %>
                </select>
            </div>

            <div class="mb-6">
                <label class="form-label" for="basic-default-date">Date :</label>
                <input type="date" class="form-control" id="basic-default-date" name="daty">
            </div>
            <div class="mb-6">
                <label class="form-label" for="basic-default-quantite">Quantite :</label>
                <input type="number" class="form-control" id="basic-default-quantite" name="quantite">
            </div>
            <div class="mb-6">
                <label class="form-label" for="basic-default-Prix">Prix unitaire :</label>
                <input type="number" step="0.01" class="form-control" id="basic-default-Prix" name="prixunitaire">
            </div>

            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>

        <a href="/production/list"><button type="submit" class="btn btn-dark">Retour à la liste des productions</button></a>
    </div>
</div>

</html>

