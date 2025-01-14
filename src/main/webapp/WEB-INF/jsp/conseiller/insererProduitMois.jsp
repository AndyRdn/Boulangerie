<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.produit.Produit" %>
<%
    List<Produit> produits = (List<Produit>) request.getAttribute("produit");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Ajouter un produit conseils du mois</h5> <small class="text-body float-end"></small>
    </div>
    <div class="card-body">
        <form action="/conseiller/save" method="post">

            <div class="mb-6">
                <label class="form-label" for="idproduit">Produit</label>
                <select id="idproduit" name="idproduit" class="form-control" required>
                    <%
                        for (Produit produit : produits) {
                    %>
                    <option value="<%= produit.getId() %>"><%= produit.getNom() %></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="mb-4">
                <label class="form-label" for="basic-default-month">Mois :</label>
                <select name="mois" id="basic-default-month" class="form-select">
                    <option value="1">Janvier</option>
                    <option value="2">Février</option>
                    <option value="3">Mars</option>
                    <option value="4">Avril</option>
                    <option value="5">Mai</option>
                    <option value="6">Juin</option>
                    <option value="7">Juillet</option>
                    <option value="8">Août</option>
                    <option value="9">Septembre</option>
                    <option value="10">Octobre</option>
                    <option value="11">Novembre</option>
                    <option value="12">Décembre</option>
                </select>
            </div>
            <div class="mb-6">
                <label class="form-label" for="basic-default-name">Année :</label>
                <input type="number" class="form-control" id="basic-default-name" name="annee" required>
            </div>

            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>

         </div>
</div>

</html>
