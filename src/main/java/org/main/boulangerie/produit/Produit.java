package org.main.boulangerie.produit;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.categorie.Categorieproduit;
import org.main.boulangerie.model.Model;
import org.main.boulangerie.parfum.Parfum;
import org.main.boulangerie.produit.produitDetails.ProduitDetail;
import org.main.boulangerie.stock.Mvtstock;
import org.main.boulangerie.stock.mvtStockDetails.Mvtstockdetail;

import java.time.LocalDate;
import java.util.ArrayList;
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idparfum")
    private Parfum idparfum;


    @OneToMany(fetch = FetchType.LAZY , mappedBy = "idproduit")
    private List<ProduitDetail> details;

    public Mvtstock genereMvtStock(LocalDate date, int qte) throws Exception {
        Mvtstock mvtstock=new Mvtstock();
        mvtstock.setDaty(date);
        mvtstock.setMvtstockdetails(new ArrayList<>());
        for (ProduitDetail produitDetail:details){
            Mvtstockdetail mvD= new Mvtstockdetail();
            if (qte*produitDetail.getQuantite()<produitDetail.getIdingredient().getIdmodel().getStock()){
                mvD.setIdmodel(produitDetail.getIdingredient().getIdmodel());
                mvD.setSortie(qte*produitDetail.getQuantite());
                mvD.setEntree(0);
                mvD.setPrixunitaire(produitDetail.getIdingredient().getPrix());
                mvtstock.getMvtstockdetails().add(mvD);
            }else {
                throw new Exception("Quantiter insuffisant");
            }
//            mvD.setSortie(produitDetail.get);
        }
        return mvtstock;
    }

    public boolean checkIngredient(int idIngredient){
        for (ProduitDetail detail : this.getDetails()) {
//            System.out.println(detail.getIdingredient().getIdmodel().getNom());
            if (detail.getIdingredient().getId().equals(idIngredient)) {
                return true;
            }
        }
        return false;
    }

    public boolean checkParfum(int parfum){
        return parfum==idparfum.getId();
    }

}