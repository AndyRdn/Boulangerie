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

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Modifier un modèle</h5> <small class="text-body float-end">Mise à jour des informations</small>
    </div>
    <div class="card-body">
        <form action="/model/update" method="post">
            <input type="hidden" name="id" value="<%= model.getId() %>">

            <div class="mb-3">
                <label class="form-label" for="nom">Nom :</label>
                <input type="text" class="form-control" id="nom" name="nom" value="<%= model.getNom() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="idtypeproduit">Type de produit :</label>
                <select id="idtypeproduit" name="idtypeproduit" class="form-control" required>
                    <%
                        for (Typemodel typemodel : typemodels) {
                    %>
                    <option value="<%= typemodel.getId() %>" <%= typemodel.getId().equals(model.getIdtypeproduit().getId()) ? "selected" : "" %>><%= typemodel.getNom() %></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
        </form>

        <a href="/model/list"><button type="button" class="btn btn-dark mt-3">Retour à la liste des modèles</button></a>
    </div>
</div>

</html>
