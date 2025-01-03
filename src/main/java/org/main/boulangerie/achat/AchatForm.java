package org.main.boulangerie.achat;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
public class AchatForm {
    private LocalDate daty;
    private Integer fournisseurId;
    private List<AchatDetailForm> details;
}

@Getter
@Setter
class AchatDetailForm {
    private Integer ingredientId;
    private Integer quantite;
    private Double prixUnitaire;
}
