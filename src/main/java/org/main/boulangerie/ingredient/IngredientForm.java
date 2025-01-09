package org.main.boulangerie.ingredient;

import org.main.boulangerie.typemodel.Typemodel;

import java.time.LocalDate;

public class IngredientForm {
    String nom;
    Typemodel typeModel;
    double prix;

    int prafum;

    public int getPrafum() {
        return prafum;
    }

    public void setPrafum(int prafum) {
        this.prafum = prafum;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Typemodel getTypeModel() {
        return typeModel;
    }

    public void setTypeModel(Typemodel typeModel) {
        this.typeModel = typeModel;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }
}
