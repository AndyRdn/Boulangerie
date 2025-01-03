<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.main.boulangerie.fournisseur.Fournisseur" %>
<%@ page import="org.main.boulangerie.ingredient.Ingredient" %>
<%@ page import="java.util.List" %>
<%
    List<Fournisseur> fournisseurs = (List<Fournisseur>) request.getAttribute("fournisseurs");
    List<Ingredient> ingredients = (List<Ingredient>) request.getAttribute("ingredients");
%>
<!doctype html>
<html lang="en">

<div class="card mb-6">
    <div class="card-header">
        <h5 class="mb-0">Ajouter plusieurs achats</h5>
    </div>
    <div class="card-body">
        <form action="/achat/save" method="post">
            <!-- Achat 1 -->
            <div>
                <h5>Achat 1</h5>
                <input type="date" name="forms[0].daty">
                <select name="forms[0].fournisseurId">
                    <% for (Fournisseur fournisseur : fournisseurs) { %>
                    <option value="<%= fournisseur.getId() %>"><%= fournisseur.getNom() %></option>
                    <% } %>
                </select>
                <div>
                    <select name="forms[0].details[0].ingredientId">
                        <% for (Ingredient ingredient : ingredients) { %>
                        <option value="<%= ingredient.getId() %>"><%= ingredient.getId() %> - <%= ingredient.getIdmodel().getNom() %></option>
                        <% } %>
                    </select>
                    <input type="number" name="forms[0].details[0].quantite" placeholder="Quantité">
                    <input type="number" name="forms[0].details[0].prixUnitaire" placeholder="Prix Unitaire">
                </div>
            </div>

            <!-- Achat 2 -->
            <div>
                <h5>Achat 2</h5>
                <input type="date" name="forms[1].daty">
                <select name="forms[1].fournisseurId">
                    <% for (Fournisseur fournisseur : fournisseurs) { %>
                    <option value="<%= fournisseur.getId() %>"><%= fournisseur.getNom() %></option>
                    <% } %>
                </select>
                <div>
                    <select name="forms[1].details[0].ingredientId">
                        <% for (Ingredient ingredient : ingredients) { %>
                        <option value="<%= ingredient.getId() %>"><%= ingredient.getId() %> - <%= ingredient.getIdmodel().getNom() %></option>
                        <% } %>
                    </select>
                    <input type="number" name="forms[1].details[0].quantite" placeholder="Quantité">
                    <input type="number" name="forms[1].details[0].prixUnitaire" placeholder="Prix Unitaire">
                </div>
            </div>

            <button type="submit">Enregistrer</button>
        </form>

    </div>
</div>

</html>
