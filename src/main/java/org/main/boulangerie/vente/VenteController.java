package org.main.boulangerie.vente;

import org.main.boulangerie.categorie.CategorieproduitRepository;
import org.main.boulangerie.client.ClientRepository;
import org.main.boulangerie.parfum.ParfumRepository;
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
    private final ProduitService produitService;
    private final ClientRepository clientRepository;

    private final CategorieproduitRepository categorieproduitRepository;
    private final ParfumRepository parfumRepository;

    public VenteController(VenteService venteService, VenteRepository venteRepository,
                           VentedetailRepository ventedetailRepository, ProduitService produitService,
                           ClientRepository clientRepository, CategorieproduitRepository categorieproduitRepository, ParfumRepository parfumRepository) {
        this.venteService = venteService;
        this.venteRepository = venteRepository;
        this.ventedetailRepository = ventedetailRepository;
        this.categorieproduitRepository = categorieproduitRepository;
        this.parfumRepository = parfumRepository;
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

    @GetMapping("/list")
    public ModelAndView listeVenteDetail(){
        return new ModelAndView("template").addObject("content","vente/list.jsp")
                .addObject("vente",ventedetailRepository.findAll())
                .addObject("categ", categorieproduitRepository.findAll())
                .addObject("parf", parfumRepository.findAll());
    }

    @PostMapping("/search")
    public ModelAndView recherche(@RequestParam Integer idparfum, @RequestParam Integer idCategorie) {
        ModelAndView mav = new ModelAndView("template");
        System.out.println(idparfum);
        System.out.println(idCategorie);
        mav.addObject("vente", venteService.checkParfum(idCategorie,idparfum));
        mav.addObject("categ", categorieproduitRepository.findAll());
        mav.addObject("parf", parfumRepository.findAll());
        mav.addObject("content", "vente/list.jsp");
        return mav;
    }

}
