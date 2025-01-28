package org.main.boulangerie.produit;

import org.main.boulangerie.categorie.Categorieproduit;
import org.main.boulangerie.categorie.CategorieproduitService;
import org.main.boulangerie.historiquePrixProduit.Historiqueprixproduit;
import org.main.boulangerie.historiquePrixProduit.HistoriqueprixproduitRepository;
import org.main.boulangerie.ingredient.Ingredient;
import org.main.boulangerie.ingredient.IngredientRepository;
import org.main.boulangerie.model.Model;
import org.main.boulangerie.model.ModelRepository;
import org.main.boulangerie.model.ModelService;
import org.main.boulangerie.parfum.ParfumRepository;
import org.main.boulangerie.produit.produitDetails.ProduitDetail;
import org.main.boulangerie.produit.produitDetails.ProduitDetailRepository;
import org.main.boulangerie.typemodel.TypemodelRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProduitService {
    private final ProduitRepository produitRepository;

    private final ModelService modelService;
    private final TypemodelRepository typemodelRepository;
    private final ModelRepository modelRepository;
    private final ProduitDetailRepository produitDetailRepository;
    private final ParfumRepository parfumRepository;
    private final HistoriqueprixproduitRepository historiqueprixproduitRepository;

    public ProduitService(ProduitRepository produitRepository, ModelService modelService, TypemodelRepository typemodelRepository,
                          ModelRepository modelRepository,
                          ProduitDetailRepository produitDetailRepository, ParfumRepository parfumRepository,
                          HistoriqueprixproduitRepository historiqueprixproduitRepository) {
        this.produitRepository = produitRepository;
        this.modelService = modelService;
        this.typemodelRepository = typemodelRepository;
        this.modelRepository = modelRepository;
        this.produitDetailRepository = produitDetailRepository;
        this.parfumRepository = parfumRepository;
        this.historiqueprixproduitRepository = historiqueprixproduitRepository;
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
        produit.setIdparfum(parfumRepository.findById(form.getParfum()).get());
        Produit merProd= produitRepository.save(produit);

        Historiqueprixproduit historiqueprixproduit = new Historiqueprixproduit();
        historiqueprixproduit.setIdproduit(merProd);
        historiqueprixproduit.setDaty(LocalDate.now());
        historiqueprixproduit.setPrix(merProd.getPrixvente());
        historiqueprixproduitRepository.save(historiqueprixproduit);

        for (ProduitDetailForm formD:form.getDetails()){
            ProduitDetail temp=  new ProduitDetail();
            temp.setIdingredient(formD.getIngredientId());
            temp.setQuantite(formD.getQuantite());
            temp.setIdproduit(merProd);
            produitDetailRepository.save(temp);
        }
    }

    public List<Produit> checkProduit(Integer ingredient, Integer categorie) {
        List<Produit> painBeurres = new ArrayList<>();

        List<Produit> produits = produitRepository.findByIdcategorie_Id(categorie);

        for (Produit produit : produits) {
            List<ProduitDetail> details = produit.getDetails();
            System.out.println("miditra");
            for (ProduitDetail detail : details) {
                System.out.println(detail.getIdingredient().getIdmodel().getNom());
                if (detail.getIdingredient().getId().equals(ingredient)) {
                    painBeurres.add(produit);
                    break;
                }
            }
        }
        return painBeurres;
    }

    public void update(ProduitForm form) {
        Produit prodMere= produitRepository.findById(form.getId()).get();

        prodMere.setId(form.getId());
        prodMere.setNom(form.getNom());
        prodMere.setPrixvente(form.getPrixvente());
        prodMere.setIdcategorie(form.getIdCategorie());
        prodMere.setIdparfum(parfumRepository.findById(form.getParfum()).get());
        Produit merProd= produitRepository.save(prodMere);

        Historiqueprixproduit historiqueprixproduit = new Historiqueprixproduit();
        historiqueprixproduit.setIdproduit(merProd);
        historiqueprixproduit.setDaty(form.getDaty());
        historiqueprixproduit.setPrix(merProd.getPrixvente());
        historiqueprixproduitRepository.save(historiqueprixproduit);
    }

    public void delete(Integer id) {
        produitRepository.deleteById(id);
    }
}
