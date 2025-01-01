package org.main.boulangerie.produit;

import org.main.boulangerie.categorie.CategorieproduitService;
import org.main.boulangerie.model.ModelService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProduitService {
    private final ProduitRepository produitRepository;
    private final ModelService modelService;
    private final CategorieproduitService categorieproduitService;

    public ProduitService(ProduitRepository produitRepository, ModelService modelService, CategorieproduitService categorieproduitService) {
        this.produitRepository = produitRepository;
        this.modelService = modelService;
        this.categorieproduitService = categorieproduitService;
    }

    public List<Produit> getAll() {
        return produitRepository.findAll();
    }

    public Produit getById(Integer id) {
        return produitRepository.findById(id).orElseThrow(() -> new RuntimeException("Produit introuvable"));
    }

    public void save(ProduitForm form) {
        Produit produit = new Produit();
        produit.setNom(form.getNom());
        produit.setPrixvente(form.getPrixvente());
        produit.setIdmodel(modelService.getById(form.getIdmodel()));
        produit.setIdcategorie(categorieproduitService.getById(form.getIdcategorie()));
        produitRepository.save(produit);
    }

    public void update(Integer id, ProduitForm form) {
        Produit produit = produitRepository.findById(id).orElseThrow(() -> new RuntimeException("Produit introuvable"));
        produit.setNom(form.getNom());
        produit.setPrixvente(form.getPrixvente());
        produit.setIdmodel(modelService.getById(form.getIdmodel()));
        produit.setIdcategorie(categorieproduitService.getById(form.getIdcategorie()));
        produitRepository.save(produit);
    }

    public void delete(Integer id) {
        produitRepository.deleteById(id);
    }
}
