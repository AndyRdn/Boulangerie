package org.main.boulangerie.produit.produitDetails;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.ingredient.Ingredient;
import org.main.boulangerie.produit.Produit;

@Getter
@Setter
@Entity
@Table(name = "produitdetails")
public class ProduitDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "quantite")
    private Integer quantite;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idproduit")
    private Produit idproduit;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idingredient")
    private Ingredient idingredient;

}