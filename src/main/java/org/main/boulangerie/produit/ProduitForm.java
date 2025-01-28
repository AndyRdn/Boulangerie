package org.main.boulangerie.produit;

import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.categorie.Categorieproduit;
import org.main.boulangerie.ingredient.Ingredient;

import java.util.List;

@Getter
@Setter
public class ProduitForm {
    private String nom;
    private Double prixvente;
    private Categorieproduit idCategorie;
    private Integer parfum;
    List<ProduitDetailForm> details;
}

@Getter
@Setter
class ProduitDetailForm {
    private Ingredient ingredientId;
    private Integer quantite;
}
