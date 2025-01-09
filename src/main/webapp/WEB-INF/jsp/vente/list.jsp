<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.categorie.Categorieproduit" %>
<%@ page import="org.main.boulangerie.parfum.Parfum" %>
<%@ page import="org.main.boulangerie.vente.ventedetail.Ventedetail" %>
<%@ page import="org.main.boulangerie.vente.Vente" %>
<%
    List<Ventedetail> ventedetails = (List<Ventedetail>) request.getAttribute("details");
    List<Categorieproduit> categories = (List<Categorieproduit>) request.getAttribute("categories");
    List<Parfum> parfums = (List<Parfum>) request.getAttribute("parfums");
    Vente vente = (Vente) request.getAttribute("vente");
%>
<!doctype html>
<html lang="en">
<body>
<div class="container mt-4">
    <div class="card mb-6">
<%--        <div class="card-header d-flex justify-content-between align-items-center">--%>
<%--            <h5 class="mb-0">Détails de la vente</h5>--%>
<%--            <a href="/vente/form?venteId=<%= vente.getId() %>">--%>
<%--                <button type="button" class="btn btn-dark mb-3">Ajouter un détail</button>--%>
<%--            </a>--%>
<%--        </div>--%>
        <div class="card-body">
<%--            <h6>Vente ID: <%= vente.getId() %></h6>--%>
<%--            <h6>Date: <%= vente.getDaty() %></h6>--%>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Produit</th>
                    <th>Quantité</th>
<%--                    <th>Actions</th>--%>
                </tr>
                </thead>
                <tbody>
                    <%
                    for (Ventedetail detail : ventedetails) {
                %>
                <tr>
                    <td><%= detail.getId() %></td>
                    <td><%= detail.getIdproduit().getNom() %></td>
                    <td><%= detail.getQuantite() %></td>
<%--                    <td>--%>
<%--&lt;%&ndash;                        <a href="/vente/formUpdate?id=<%= detail.getId() %>" class="btn btn-warning                        btn-sm">Modifier</a>&ndash;%&gt;--%>
<%--                        <form action="/vente/delete" method="post" style="display: inline;">--%>
<%--                            <input type="hidden" name="id" value="<%= detail.getId() %>">--%>
<%--                            <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>--%>
<%--                        </form>--%>
<%--                    </td>--%>
                </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>

