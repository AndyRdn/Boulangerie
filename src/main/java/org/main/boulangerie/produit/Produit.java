package org.main.boulangerie.produit;

import org.main.boulangerie.categorie.Categorieproduit;
import org.main.boulangerie.model.Model;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.produit.produitDetails.ProduitDetail;
import org.main.boulangerie.stock.Mvtstock;
import org.main.boulangerie.stock.mvtStockDetails.Mvtstockdetail;

import java.time.LocalDate;
import java.util.List;

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

    @OneToMany(fetch = FetchType.LAZY , mappedBy = "idproduit")
    private List<ProduitDetail> details;

    public Mvtstock genereMvtStock(LocalDate date, int qte){
        Mvtstock mvtstock=new Mvtstock();
        mvtstock.setDaty(date);
        for (ProduitDetail produitDetail:details){
            Mvtstockdetail mvD= new Mvtstockdetail();
            if (qte*produitDetail.getQuantite()<produitDetail.getIdingredient().getIdmodel().getStock()){
                mvD.setIdmodel(produitDetail.getIdproduit().getIdmodel());
                mvD.setSortie(qte*produitDetail.getQuantite());
                mvD.setEntree(0);
                mvD.setPrixunitaire(produitDetail.getIdingredient().getPrix());
                mvtstock.getMvtstockdetails().add(mvD);
            }
//            mvD.setSortie(produitDetail.get);
        }
        return mvtstock;
    }

}