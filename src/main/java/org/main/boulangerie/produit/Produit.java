package org.main.boulangerie.produit;

import org.main.boulangerie.categorie.Categorieproduit;
import org.main.boulangerie.model.Model;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "produit")
public class Produit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "nom")
    private String nom;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idmodel")
    private Model idmodel;

    @Column(name = "prixvente")
    private Double prixvente;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idcategorie")
    private Categorieproduit idcategorie;

}