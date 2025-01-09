package org.main.boulangerie.vente;

import jakarta.persistence.criteria.CriteriaBuilder;
import org.main.boulangerie.production.Production;
import org.main.boulangerie.stock.Mvtstock;
import org.main.boulangerie.stock.MvtstockRepository;
import org.main.boulangerie.stock.mvtStockDetails.Mvtstockdetail;
import org.main.boulangerie.vente.ventedetail.Ventedetail;
import org.main.boulangerie.vente.ventedetail.VentedetailRepository;
import org.springframework.stereotype.Service;
import org.main.boulangerie.stock.mvtStockDetails.MvtstockdetailRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Service
public class VenteService {
    private final VenteRepository venteRepository;
    private final VentedetailRepository ventedetailRepository;
    private final MvtstockRepository mvtStockRepository;
    private final MvtstockdetailRepository mvtStockDetailsRepository;


    public VenteService(VenteRepository venteRepository, VentedetailRepository ventedetailRepository,
                        MvtstockRepository mvtStockRepository, MvtstockdetailRepository mvtStockDetailsRepository) {
        this.venteRepository = venteRepository;
        this.ventedetailRepository = ventedetailRepository;
        this.mvtStockRepository = mvtStockRepository;
        this.mvtStockDetailsRepository = mvtStockDetailsRepository;
    }

    public List<Vente> getAllVentes() {
        return venteRepository.findAll();
    }

    public void saveVente(Vente vente, List<Ventedetail> details) {
        Mvtstock mvtStock = new Mvtstock();
        mvtStock.setDaty(vente.getDaty());
        Mvtstock savedMvtStock = mvtStockRepository.save(mvtStock);

        for (Ventedetail detail : details) {
            detail.setIdvente(vente);
            ventedetailRepository.save(detail);

            Mvtstockdetail mvtStockDetail = new Mvtstockdetail();
            mvtStockDetail.setIdmvtstock(savedMvtStock);
            mvtStockDetail.setIdmodel(detail.getIdproduit().getIdmodel());
            mvtStockDetail.setSortie(detail.getQuantite());
            mvtStockDetail.setEntree(0);
//            mvtStockDetail.setPrixunitaire(detail.);
            mvtStockDetailsRepository.save(mvtStockDetail);
        }

    }

    public List<Ventedetail> checkParfum(Integer idcateg, Integer idParf){
        List<Ventedetail> ventedetails=new ArrayList<>();
        List<Ventedetail> vDs=ventedetailRepository.findByIdproduit_Idcategorie_Id(idcateg);
        for (Ventedetail v : vDs) {
            if (v.getIdproduit().checkParfum(idParf)) ventedetails.add(v);
            System.out.println("miditra");

        }
        return ventedetails;
    }
}
