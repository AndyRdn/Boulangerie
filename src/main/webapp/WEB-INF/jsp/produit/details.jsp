<%@ page import="java.util.List" %>
<%@ page import="org.main.boulangerie.produit.Produit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<%
    Produit produits= (Produit) request.getAttribute("produit");
%>

<div class="card mb-6">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Details du produit</h5> <small class="text-body float-end">Ingredient composant</small>
    </div>
    <div class="card-body">
        <form action="/production/save" method="post">
            

            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>

        <a href="/production/list"><button type="submit" class="btn btn-dark">Retour à la liste des productions</button></a>
    </div>
</div>

</html>

