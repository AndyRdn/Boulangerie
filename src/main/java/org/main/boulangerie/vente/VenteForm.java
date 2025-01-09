package org.main.boulangerie.vente;

import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.client.Client;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
public class VenteForm {
    private LocalDate daty;
    private Client clientId;
    private List<VenteDetailForm> details;
}

@Getter
@Setter
class VenteDetailForm {
    private Integer produitId;
    private Integer quantite;
}
