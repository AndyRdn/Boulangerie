package org.main.boulangerie.production;
import org.main.boulangerie.stock.MvtStockService;
import org.main.boulangerie.stock.Mvtstock;
import org.main.boulangerie.stock.MvtstockRepository;
import org.main.boulangerie.stock.MvtstockdetailRepository;

import org.springframework.stereotype.Service;

@Service
public class ProductionService {
    private final ProductionRepository productionRepository;
    private final MvtStockService mvtStockService;

    public ProductionService(ProductionRepository productionRepository, MvtStockService mvtStockService) {
        this.productionRepository = productionRepository;
        this.mvtStockService = mvtStockService;
    }

    public void save(){

    }

}
