package org.main.boulangerie.vente.ventedetail;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.produit.Produit;
import org.main.boulangerie.vente.Vente;

@Getter
@Setter
@Entity
@Table(name = "ventedetails")
public class Ventedetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idvente")
    private Vente idvente;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idproduit")
    private Produit idproduit;

    @Column(name = "quantite")
    private Integer quantite;

}