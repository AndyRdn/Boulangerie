package org.main.boulangerie.client;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class ClientForm {
    private String nom;
    private LocalDate daty;
}
