package org.main.boulangerie.model;

import org.main.boulangerie.stock.mvtStockDetails.Mvtstockdetail;
import org.main.boulangerie.typemodel.Typemodel;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "model")
public class Model {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "nom")
    private String nom;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idtypeproduit")
    private Typemodel idtypeproduit;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "idmodel")
    List<Mvtstockdetail> mvtstockdetails;

    public double getStock(){
        double total=0;
        for (Mvtstockdetail m: mvtstockdetails){
            total+=m.getEntree();
            total-=m.getSortie();
        }
        return total;
    }

}