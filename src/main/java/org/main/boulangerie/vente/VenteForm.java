package org.main.boulangerie.vente;

import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.client.Client;
import org.main.boulangerie.employe.Employer;
import org.main.boulangerie.produit.Produit;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
public class VenteForm {
    private LocalDate daty;
    private Client clientId;
    private Employer vendeurId;
    private List<VenteDetailForm> details;
}

@Getter
@Setter
class VenteDetailForm {
    private Produit produitId;
    private Integer quantite;
}
