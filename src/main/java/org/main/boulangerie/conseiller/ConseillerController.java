package org.main.boulangerie.conseiller;

import org.main.boulangerie.produit.ProduitService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/conseiller")
public class ConseillerController {
    private final ConseillerService conseillerService;
    private final ProduitService produitService;
    public ConseillerController(ConseillerService conseillerService, ProduitService produitService) {
        this.conseillerService = conseillerService;
        this.produitService = produitService;
    }

    @GetMapping("/form")
    public ModelAndView form(){
        return new ModelAndView("template")
                .addObject("content", "conseiller/form.jsp")
                .addObject("produit", produitService.getAll());
    }


    @GetMapping("/list")
    public ModelAndView List(){
        return new ModelAndView("template")
                .addObject("content", "conseiller/list.jsp")
                .addObject("produit", conseillerService.getConseillerNow());
    }

    @PostMapping("/save")
    public String save(@RequestParam Conseiller conseiller){
        conseillerService.save(conseiller);
        return "redirect:/conseiller/list";

    }
}
