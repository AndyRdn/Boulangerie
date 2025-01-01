package org.main.boulangerie.produit;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProduitForm {
    private String nom;
    private Double prixvente;
    private Integer idmodel;
    private Integer idcategorie;
}
