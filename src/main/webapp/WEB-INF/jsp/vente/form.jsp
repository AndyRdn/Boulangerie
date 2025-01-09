<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.main.boulangerie.produit.Produit" %>
<%@ page import="org.main.boulangerie.client.Client" %>
<%@ page import="java.util.List" %>
<%
    List<Produit> produits = (List<Produit>) request.getAttribute("produits");
    List<Client> clients = (List<Client>) request.getAttribute("clients");
%>
<!doctype html>
<html lang="en">
<script>
    function addRow() {
        const table = document.getElementById("dynamicTable");
        const row = table.insertRow(-1);

        let cell1 = row.insertCell(0); // Produit
        let cell2 = row.insertCell(1); // Quantité
        let cell3 = row.insertCell(2); // Supprimer

        const rowCount = table.rows.length - 2;

        cell1.innerHTML = '<select name="details[' + rowCount + '].produitId" class="form-select">' +
            '<% for (Produit produit : produits) { %>' +
            '<option value="<%= produit.getId() %>"><%= produit.getNom() %></option>' +
            '<% } %>' +
            '</select>';
        cell2.innerHTML = '<input type="number" name="details[' + rowCount + '].quantite" value="1" class="form-control" />';
        cell3.innerHTML = '<button type="button" class="btn btn-danger" onclick="deleteRow(this)">X</button>';
    }

    function deleteRow(button) {
        const row = button.parentNode.parentNode;
        row.parentNode.removeChild(row);
    }
</script>
<div class="card mb-6">
    <div class="card-header">
        <h5 class="mb-0">Ajouter une vente</h5>
    </div>
    <div class="card-body">
        <form action="/vente/save" method="post">
            <div class="mb-6">
                <label class="form-label" for="basic-default-client">Client :</label>
                <select name="clientId" id="basic-default-client" class="form-select" required>
                    <% for (Client client : clients) { %>
                    <option value="<%= client.getId() %>"><%= client.getNom() %></option>
                    <% } %>
                </select>
            </div>
            <div class="mb-6">
                <label class="form-label" for="basic-default-date">Date :</label>
                <input type="date" class="form-control" id="basic-default-date" name="daty" required>
            </div>
            <div class="table-responsive text-nowrap">
                <table id="dynamicTable" class="table">
                    <thead>
                    <tr>
                        <th>Produit</th>
                        <th>Quantité</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <select name="details[0].produitId" class="form-select">
                                <% for (Produit produit : produits) { %>
                                <option value="<%= produit.getId() %>"><%= produit.getNom() %></option>
                                <% } %>
                            </select>
                        </td>
                        <td><input type="number" name="details[0].quantite" value="1" class="form-control" /></td>
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
