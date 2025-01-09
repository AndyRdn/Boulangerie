package org.main.boulangerie.production;
import org.main.boulangerie.produit.Produit;
import org.main.boulangerie.produit.produitDetails.ProduitDetail;
import org.main.boulangerie.stock.MvtStockService;
import org.main.boulangerie.stock.Mvtstock;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductionService {
    private final ProductionRepository productionRepository;
    private final MvtStockService mvtStockService;

    public ProductionService(ProductionRepository productionRepository, MvtStockService mvtStockService) {
        this.productionRepository = productionRepository;
        this.mvtStockService = mvtStockService;
    }

    public void save(Production production) throws Exception {
        Mvtstock mvtstock=production.getIdproduit().genereMvtStock(production.getDaty(),production.getQuantite());
        mvtStockService.save(mvtstock);
        productionRepository.save(production);

    }

    public List<Production> getAll(){return productionRepository.findAll();}

    public List<Production> checkProduction(Integer ingredient, Integer categorie) {
        List<Production> painBeurres = new ArrayList<>();

        List<Production> produits = productionRepository.findByIdproduit_Idcategorie_Id(categorie);

        for (Production product : produits) {
            if (product.getIdproduit().checkIngredient(ingredient)) painBeurres.add(product);
            System.out.println("miditra");

        }
        return painBeurres;
    }

}
