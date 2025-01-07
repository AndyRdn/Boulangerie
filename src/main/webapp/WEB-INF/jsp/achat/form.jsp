
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.main.boulangerie.fournisseur.Fournisseur" %>
<%@ page import="org.main.boulangerie.ingredient.Ingredient" %>
<%@ page import="java.util.List" %>
<%
    List<Fournisseur> fournisseurs = (List<Fournisseur>) request.getAttribute("fournisseurs");
    List<Ingredient> ingredients = (List<Ingredient>) request.getAttribute("ingredients");
%>
<!doctype html>
<html lang="en">
<script>
    function addRow() {
        const table = document.getElementById("dynamicTable");
        const row = table.insertRow(-1); // Ajouter à la fin du tableau

        // Création des cellules
        let cell1 = row.insertCell(0); // Produit (liste déroulante)
        let cell2 = row.insertCell(1); // Quantité
        let cell3 = row.insertCell(2); // PU
        let cell4 = row.insertCell(3); // Supprimer

        // Contenu des cellules
        const rowCount = table.rows.length-2;

        console.log(rowCount)
        cell1.innerHTML = '<select name="details[' + rowCount + '].ingredientId" class="form-select">' +
            '<% for (Ingredient ingredient : ingredients) { %>' +
            '<option value="<%= ingredient.getId() %>"><%= ingredient.getIdmodel().getNom() %></option>' +
            '<% } %>' +
            '</select>';
        cell2.innerHTML ='<input type="number" name="details['+rowCount+'].quantite" value="0" class="form-control" />';
        cell3.innerHTML = '<input type="number" name="details['+rowCount+'].prixUnitaire" value="0.0" class="form-control" />';
        cell4.innerHTML = '<button type="button" class="btn btn-danger" onclick="deleteRow(this)">X</button>';
    }

    function deleteRow(button) {
        const row = button.parentNode.parentNode;
        row.parentNode.removeChild(row); // Supprime la ligne
    }
</script>
<div class="card mb-6">
    <div class="card-header">
        <h5 class="mb-0">Ajouter plusieurs achats</h5>
    </div>
    <div class="card-body">
        <form action="/achat/save" method="post">

            <div class="mb-6">
                <label class="form-label" for="basic-default-date">date :</label>
                <input type="date" class="form-control" id="basic-default-date" name="daty" required>
            </div>

            <div class="mb-6">
                <label class="form-label" for="basic-default-fournisseurId">Fournisseur :</label>
                <select name="fournisseurId" id="basic-default-fournisseurId" class="form-select">
                    <% for (Fournisseur f : fournisseurs) { %>
                    <option value="<%= f.getId() %>"><%= f.getNom() %></option>
                    <% } %>
                </select>
            </div>
            <div class="table-responsive text-nowrap">
            <!-- Achat 1 -->
                <table id="dynamicTable"  class="table">
                    <thead>
                    <tr>
                        <th>Produit</th>
                        <th>Quantité</th>
                        <th>PU</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Les lignes seront ajoutées ici dynamiquement -->
                    <tr>
                        <td>
                            <select name="details[0].ingredientId" class="form-select">
                                <% for (Ingredient ingredient : ingredients) { %>
                                <option value="<%= ingredient.getId() %>"><%= ingredient.getIdmodel().getNom() %> </option>
                                <% } %>
                            </select>
                        </td>
                        <td><input type="number" name="details[0].quantite" value="1" class="form-control" /></td>
                        <td><input type="number" name="details[0].prixUnitaire" value="0.0" class="form-control" /></td>
                        <td><button type="button" class="btn btn-danger" onclick="deleteRow(this)">X</button></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <br />
            <button type="button" class="btn btn-gray" onclick="addRow()">Ajouter une ligne</button>
            <button type="submit" class="btn btn-primary">Enregistrer</button>

        </form>

    </div>
</div>

</html>






