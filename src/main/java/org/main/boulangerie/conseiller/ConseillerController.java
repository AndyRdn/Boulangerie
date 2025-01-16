package org.main.boulangerie.conseiller;

import jakarta.servlet.http.HttpSession;
import org.main.boulangerie.produit.ProduitService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/conseiller")
public class ConseillerController {
    private final ConseillerService conseillerService;
    private final ProduitService produitService;
    private final HttpSession session;
    public ConseillerController(ConseillerService conseillerService, ProduitService produitService, HttpSession session) {
        this.conseillerService = conseillerService;
        this.produitService = produitService;
        this.session = session;
    }

    @GetMapping("/form")
    public ModelAndView form(){
        return new ModelAndView("template")
                .addObject("content", "conseiller/insererProduitMois.jsp")
                .addObject("produit", produitService.getAll());
    }


    @GetMapping("/list")
    public ModelAndView List(){
        return new ModelAndView("template")
                .addObject("content", "conseiller/ListProduitMois.jsp")
                .addObject("conseillers", conseillerService.getConseillerNow());
    }

    @GetMapping("/search")
    public ModelAndView SearchList(@RequestParam Integer mois, @RequestParam Integer annee){
        return new ModelAndView("template")
                .addObject("content", "conseiller/ListProduitMois.jsp")
                .addObject("conseillers", conseillerService.getConseillerMandA(mois, annee));
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Conseiller conseiller){
        try {
            conseillerService.save(conseiller);
            return "redirect:/conseiller/list";
        }catch (Exception e){
//            System.out.println("errorooooooo");
            session.setAttribute("error",e.getMessage());
            return "redirect:/conseiller/form";
        }


    }
}
