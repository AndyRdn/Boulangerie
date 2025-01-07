package org.main.boulangerie.achat;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.fournisseur.Fournisseur;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "achat")
public class Achat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "daty")
    private LocalDate daty;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idfournisseur")
    private Fournisseur idfournisseur;

}