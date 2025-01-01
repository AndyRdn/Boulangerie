<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.typemodel.Typemodel" %>
<%@ page import="org.main.boulangerie.model.Model" %>
<%
    Model model = (Model) request.getAttribute("model");
    List<Typemodel> typemodels = (List<Typemodel>) request.getAttribute("typemodels");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un modèle</title>
</head>
<body>
<h1>Modifier un modèle</h1>
<form action="/model/update" method="post">
    <input type="hidden" name="id" value="<%= model.getId() %>">

    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" value="<%= model.getNom() %>" required><br><br>

    <label for="idtypeproduit">Type de produit :</label>
    <select id="idtypeproduit" name="idtypeproduit" required>
            <%
            for (Typemodel typemodel : typemodels) {
        %>
        <option value="<%= typemodel.getId() %>" <%= typemodel.getId().equals(model.getIdtypeproduit().getId()) ? "selected" : "" %>><%= typemodel.getNom() %></option>
        <%
            }
        %>
    </select><br><br>

    <button type="submit">Enregistrer les modifications</button>
</form>
<a href="/model/list">Retour à la liste des modèles</a>
</body>
</html>

