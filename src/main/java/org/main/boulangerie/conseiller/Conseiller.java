package org.main.boulangerie.conseiller;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.produit.Produit;

@Getter
@Setter
@Entity
@Table(name = "conseiller")
public class Conseiller {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idproduit")
    private Produit idproduit;

    @Column(name = "mois")
    private Integer mois;

    @Column(name = "annee")
    private Integer annee;

}