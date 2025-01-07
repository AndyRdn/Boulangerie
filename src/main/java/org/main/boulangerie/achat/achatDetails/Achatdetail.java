package org.main.boulangerie.achat.achatDetails;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.achat.Achat;
import org.main.boulangerie.ingredient.Ingredient;

@Getter
@Setter
@Entity
@Table(name = "achatdetails")
public class Achatdetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idachat")
    private Achat idachat;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idingredient")
    private Ingredient idingredient;

    @Column(name = "quantite")
    private Integer quantite;

    @Column(name = "prixunitaire")
    private Double prixunitaire;

}