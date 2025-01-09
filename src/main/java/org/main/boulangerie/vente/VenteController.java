package org.main.boulangerie.vente;

import org.main.boulangerie.client.ClientRepository;
import org.main.boulangerie.produit.ProduitRepository;
import org.main.boulangerie.produit.ProduitService;
import org.main.boulangerie.stock.MvtstockRepository;
import org.main.boulangerie.vente.ventedetail.Ventedetail;
import org.main.boulangerie.vente.ventedetail.VentedetailRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/vente")
public class VenteController {
    private final VenteService venteService;
    private final VenteRepository venteRepository;
    private final VentedetailRepository ventedetailRepository;
    private final MvtstockRepository mvtStockRepository;
    private final ProduitService produitService;
    private final ClientRepository clientRepository;

    public VenteController(VenteService venteService, VenteRepository venteRepository,
                           VentedetailRepository ventedetailRepository, MvtstockRepository mvtStockRepository, ProduitService produitService,
                           ClientRepository clientRepository) {
        this.venteService = venteService;
        this.venteRepository = venteRepository;
        this.ventedetailRepository = ventedetailRepository;
        this.mvtStockRepository = mvtStockRepository;
        this.produitService = produitService;
        this.clientRepository = clientRepository;
    }

    @GetMapping("/form")
    public ModelAndView form() {
        ModelAndView mav = new ModelAndView("template");
        mav.addObject("produits", produitService.getAll());
        mav.addObject("clients",clientRepository.findAll());
        mav.addObject("content", "vente/form.jsp");
        return mav;
    }

    @PostMapping("/save")
    public String saveVente(@ModelAttribute VenteForm form) {
        if (form.getDaty() != null) {
            Vente vente = new Vente();
            vente.setDaty(form.getDaty());
            vente.setIdclient(form.getClientId());
            System.out.println(form.getClientId());
            Vente savedVente = venteRepository.save(vente);

            List<Ventedetail> details = new ArrayList<>();
            for (VenteDetailForm detailForm : form.getDetails()) {
                Ventedetail detail = new Ventedetail();
                detail.setIdvente(savedVente);
                detail.setQuantite(detailForm.getQuantite());
//                detail.setPrixunitaire(detailForm.getPrixUnitaire());
                detail.setIdproduit(produitService.getById(detailForm.getProduitId()));

                details.add(ventedetailRepository.save(detail));
            }
            venteService.saveVente(savedVente, details);
        }
        return "redirect:/vente/form";
    }

}
