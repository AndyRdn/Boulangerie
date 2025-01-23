package org.main.boulangerie.vente;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.client.Client;
import org.main.boulangerie.employe.Employer;
import org.main.boulangerie.vente.ventedetail.Ventedetail;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "vente")
public class Vente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "daty")
    private LocalDate daty;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idclient")
    private Client idclient;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idvendeur")
    private Employer idvendeur;

    @Column(name = "commission")
    private Double commission;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "idvente")
    List<Ventedetail> details;


    public double getComs(){
        double sum=0;
        for(Ventedetail v:details){
            sum+=v.getIdproduit().getPrixvente()*v.getQuantite();
        }

        return (sum*idvendeur.getCommision())/100;
    }

}