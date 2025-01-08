package org.main.boulangerie.stock.mvtStockDetails;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.model.Model;
import org.main.boulangerie.stock.Mvtstock;

@Getter
@Setter
@Entity
@Table(name = "mvtstockdetails")
public class Mvtstockdetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idmvtstock")
    private Mvtstock idmvtstock;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idmodel")
    private Model idmodel;

    @Column(name = "entree")
    private Integer entree;

    @Column(name = "sortie")
    private Integer sortie;

    @Column(name = "prixunitaire")
    private Double prixunitaire;

}