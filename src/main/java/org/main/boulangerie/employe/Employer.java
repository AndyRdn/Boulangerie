package org.main.boulangerie.employe;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.genre.Genre;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "employer")
public class Employer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "nom")
    private String nom;

    @Column(name = "salaire")
    private Double salaire;

    @Column(name = "dateembauche")
    private LocalDate dateembauche;

    @Column(name = "commision")
    private Double commision;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idgenre")
    private Genre idgenre;

}