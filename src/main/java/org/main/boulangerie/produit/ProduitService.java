package org.main.boulangerie.produit;

import org.main.boulangerie.categorie.CategorieproduitService;
import org.main.boulangerie.model.Model;
import org.main.boulangerie.model.ModelRepository;
import org.main.boulangerie.model.ModelService;
import org.main.boulangerie.produit.produitDetails.ProduitDetail;
import org.main.boulangerie.produit.produitDetails.ProduitDetailRepository;
import org.main.boulangerie.typemodel.TypemodelRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProduitService {
    private final ProduitRepository produitRepository;
    private final ModelService modelService;
    private final TypemodelRepository typemodelRepository;
    private final CategorieproduitService categorieproduitService;
    private final ModelRepository modelRepository;
    private final ProduitDetailRepository produitDetailRepository;

    public ProduitService(ProduitRepository produitRepository, ModelService modelService, TypemodelRepository typemodelRepository, CategorieproduitService categorieproduitService,
                          ModelRepository modelRepository,
                          ProduitDetailRepository produitDetailRepository) {
        this.produitRepository = produitRepository;
        this.modelService = modelService;
        this.typemodelRepository = typemodelRepository;
        this.categorieproduitService = categorieproduitService;
        this.modelRepository = modelRepository;
        this.produitDetailRepository = produitDetailRepository;
    }

    public List<Produit> getAll() {
        return produitRepository.findAll();
    }

    public Produit getById(Integer id) {
        return produitRepository.findById(id).orElseThrow(() -> new RuntimeException("Produit introuvable"));
    }

    public void save(ProduitForm form) {
        Model model=new Model();
        model.setNom(form.getNom());
        model.setIdtypeproduit(typemodelRepository.findById(2). get());
        Model merModel= modelRepository.save(model);
        Produit produit = new Produit();
        produit.setNom(form.getNom());
        produit.setPrixvente(form.getPrixvente());
        produit.setIdmodel(modelService.getById(merModel.getId()));
        produit.setIdcategorie(form.getIdCategorie());
        Produit merProd= produitRepository.save(produit);

        for (ProduitDetailForm formD:form.getDetails()){
            ProduitDetail temp=  new ProduitDetail();
            temp.setIdingredient(formD.getIngredientId());
            temp.setQuantite(formD.getQuantite());
            temp.setIdproduit(merProd);
            produitDetailRepository.save(temp);
        }
    }

//    public void update(Integer id, ProduitForm form) {
//        Produit produit = produitRepository.findById(id).orElseThrow(() -> new RuntimeException("Produit introuvable"));
//        produit.setNom(form.getNom());
//        produit.setPrixvente(form.getPrixvente());
//        produit.setIdmodel(modelService.getById(form.getIdmodel()));
//        produit.setIdcategorie(categorieproduitService.getById(form.getIdcategorie()));
//        produitRepository.save(produit);
//    }

    public void delete(Integer id) {
        produitRepository.deleteById(id);
    }
}
