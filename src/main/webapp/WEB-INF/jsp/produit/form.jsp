<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.model.Model" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%@ page import="org.main.boulangerie.ingredient.Ingredient" %>
<%
    List<Ingredient> ingredients= (List<Ingredient>) request.getAttribute("ingredient");
    List<Categorieproduit> categorieproduits= (List<Categorieproduit>) request.getAttribute("categories");
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
        let cell3 = row.insertCell(2); // Supprimer

        // Contenu des cellules
        const rowCount = table.rows.length-2;

        console.log(rowCount)
        cell1.innerHTML = '<select name="details[' + rowCount + '].ingredientId" class="form-select">' +
            '<% for (Ingredient ingredient : ingredients) { %>' +
            '<option value="<%= ingredient.getId() %>"><%= ingredient.getIdmodel().getNom() %></option>' +
            '<% } %>' +
            '</select>';
        cell2.innerHTML ='<input type="number" name="details['+rowCount+'].quantite" value="0" class="form-control" />';
        cell3.innerHTML = '<button type="button" class="btn btn-danger" onclick="deleteRow(this)">X</button>';
    }

    function deleteRow(button) {
        const row = button.parentNode.parentNode;
        row.parentNode.removeChild(row); // Supprime la ligne
    }
</script>

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
                <label class="form-label" for="basic-default-fournisseurId">Categorie :</label>
                <select name="idCategorie" id="basic-default-fournisseurId" class="form-select">
                    <% for (Categorieproduit c : categorieproduits) { %>
                    <option value="<%= c.getId() %>"><%= c.getNom() %></option>
                    <% } %>
                </select>
            </div>

            <div class="table-responsive text-nowrap">
                <!-- Achat 1 -->
                <table id="dynamicTable"  class="table">
                    <thead>
                    <tr>
                        <th>Ingredient</th>
                        <th>Quantité</th>
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
                        <td><button type="button" class="btn btn-danger" onclick="deleteRow(this)">X</button></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <button type="button" class="btn btn-gray" onclick="addRow()">Ajouter une ligne</button>
            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>

        <a href="/produit/list"><button type="button" class="btn btn-dark mt-3">Retour à la liste des produits</button></a>
    </div>
</div>

</html>
