package org.main.boulangerie.production;


import org.main.boulangerie.stock.Mvtstock;
import org.main.boulangerie.stock.MvtstockRepository;
import org.main.boulangerie.stock.MvtstockdetailRepository;
import org.springframework.stereotype.Service;

@Service
public class ProductionService {
    private final ProductionRepository productionRepository;
    public ProductionService(ProductionRepository productionRepository) {
        this.productionRepository = productionRepository;
    }


}
