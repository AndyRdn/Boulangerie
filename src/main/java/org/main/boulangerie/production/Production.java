package org.main.boulangerie.production;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.produit.Produit;

@Getter
@Setter
@Entity
@Table(name = "production")
public class Production {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idproduit")
    private Produit idproduit;

    @Column(name = "quantite")
    private Integer quantite;

    @Column(name = "prixunitaire")
    private Double prixunitaire;

}