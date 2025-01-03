package org.main.boulangerie.achat;

import org.main.boulangerie.stock.Mvtstock;
import org.main.boulangerie.stock.MvtstockRepository;
import org.main.boulangerie.stock.Mvtstockdetail;
import org.springframework.stereotype.Service;
import org.main.boulangerie.stock.MvtstockdetailRepository;

import java.util.List;

@Service
public class AchatService {
    private final AchatRepository achatRepository;
    private final AchatdetailRepository achatdetailRepository;
    private final MvtstockRepository mvtStockRepository;
    private final MvtstockdetailRepository mvtStockDetailsRepository;

    public AchatService(AchatRepository achatRepository, AchatdetailRepository achatdetailRepository,
                        MvtstockRepository mvtStockRepository, MvtstockdetailRepository mvtStockDetailsRepository) {
        this.achatRepository = achatRepository;
        this.achatdetailRepository = achatdetailRepository;
        this.mvtStockRepository = mvtStockRepository;
        this.mvtStockDetailsRepository = mvtStockDetailsRepository;
    }

    public List<Achat> getAllAchats() {
        return achatRepository.findAll();
    }


    public void saveAchat(Achat achat, List<Achatdetail> details) {
        achatRepository.save(achat);
        Mvtstock mvtStock = new Mvtstock();
        mvtStock.setDaty(achat.getDaty());
        mvtStockRepository.save(mvtStock);

        for (Achatdetail detail : details) {
            detail.setIdachat(achat);
            achatdetailRepository.save(detail);

            Mvtstockdetail mvtStockDetail = new Mvtstockdetail();
            mvtStockDetail.setIdmvtstock(mvtStock);
            mvtStockDetail.setIdmodel(detail.getIdingredient().getIdmodel());
            mvtStockDetail.setEntree(detail.getQuantite());
            mvtStockDetail.setSortie(0);
            mvtStockDetail.setPrixunitaire(detail.getPrixunitaire().longValue());
            mvtStockDetailsRepository.save(mvtStockDetail);
        }
    }

    public void deleteAchat(Integer id) {
        achatdetailRepository.deleteAll(achatdetailRepository.findAll().stream().filter(detail -> detail.getIdachat().getId().equals(id)).toList());
        achatRepository.deleteById(id);
    }
}
