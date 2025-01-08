package org.main.boulangerie.stock;

import org.main.boulangerie.stock.mvtStockDetails.Mvtstockdetail;
import org.main.boulangerie.stock.mvtStockDetails.MvtstockdetailRepository;
import org.springframework.stereotype.Service;

@Service
public class MvtStockService {
    private final MvtstockRepository mvtstockRepository;
    private final MvtstockdetailRepository mvtstockdetailRepository;

    public MvtStockService(MvtstockRepository mvtstockRepository, MvtstockdetailRepository mvtstockdetailRepository) {
        this.mvtstockRepository = mvtstockRepository;
        this.mvtstockdetailRepository = mvtstockdetailRepository;
    }

    public Mvtstock save(Mvtstock mvtstock){
        Mvtstock src= mvtstockRepository.save(mvtstock);
        for (Mvtstockdetail mD: mvtstock.getMvtstockdetails()){
            mD.setIdmvtstock(src);
            mvtstockdetailRepository.save(mD);
        }
        return mvtstockRepository.getById(src.getId());
    }
}
