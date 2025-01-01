<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.typemodel.Typemodel" %>
<%
    List<Typemodel> typemodels = (List<Typemodel>) request.getAttribute("typemodels");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un modèle</title>
</head>
<body>
<h1>Ajouter un modèle</h1>
<form action="/model/save" method="post">
    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" required><br><br>

    <label for="idtypeproduit">Type de produit :</label>
    <select id="idtypeproduit" name="idtypeproduit" required>
        <%
            for (Typemodel typemodel : typemodels) {
        %>
        <option value="<%= typemodel.getId() %>"><%= typemodel.getNom() %></option>
        <%
            }
        %>
    </select><br><br>

    <button type="submit">Enregistrer</button>
</form>
<a href="/model/list">Retour à la liste des modèles</a>
</body>
</html>
