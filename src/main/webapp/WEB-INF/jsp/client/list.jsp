<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.client.Client" %>
<%
    List<Client> clients = (List<Client>) request.getAttribute("clients");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des clients</title>
</head>
<body>
<h1>Liste des clients</h1>
<a href="/client/form">Ajouter un nouveau client</a>
<table border="1">
    <thead>
    <tr>
        <th>Id</th>
        <th>Nom</th>
        <th>Date de naissance</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Client client : clients) {
    %>
    <tr>
        <td><%= client.getId() %></td>
        <td><%= client.getNom() %></td>
        <td><%= client.getDaty() %></td>
        <td>
            <a href="/client/formUpdate?id=<%= client.getId() %>">Modifier</a>
            <form action="/client/delete" method="post" style="display: inline;">
                <input type="hidden" name="id" value="<%= client.getId() %>">
                <button type="submit">Supprimer</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
