package org.main.boulangerie.employe;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class EmployerForm {
    private String nom;
    private Double salaire;
    private LocalDate dateembauche;
}
