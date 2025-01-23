package org.main.boulangerie.vente;

public class VenteCommissionParVendeur {
    private Integer idVendeur;
    private String nomVendeur;
    private Double totalCommission;

    public VenteCommissionParVendeur(Integer idVendeur, String nomVendeur, Double totalCommission) {
        this.idVendeur = idVendeur;
        this.nomVendeur = nomVendeur;
        this.totalCommission = totalCommission;
    }

    // Getters et Setters
    public Integer getIdVendeur() {
        return idVendeur;
    }

    public void setIdVendeur(Integer idVendeur) {
        this.idVendeur = idVendeur;
    }

    public Double getTotalCommission() {
        return totalCommission;
    }

    public void setTotalCommission(Double totalCommission) {
        this.totalCommission = totalCommission;
    }

    public String getNomVendeur() {
        return nomVendeur;
    }

    public void setNomVendeur(String nomVendeur) {
        this.nomVendeur = nomVendeur;
    }
}