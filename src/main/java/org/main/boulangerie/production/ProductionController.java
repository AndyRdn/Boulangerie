package org.main.boulangerie.production;

import jakarta.servlet.http.HttpSession;
import org.main.boulangerie.categorie.CategorieproduitRepository;
import org.main.boulangerie.ingredient.IngredientRepository;
import org.main.boulangerie.produit.ProduitService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/production")
public class ProductionController {

    private final ProductionService productionService;
    private final ProduitService produitService;
    private final IngredientRepository ingredientRepository;
    private final CategorieproduitRepository categorieproduitRepository;
    private final HttpSession session;

    public ProductionController(ProductionService productionService, ProduitService produitService, IngredientRepository ingredientRepository, CategorieproduitRepository categorieproduitRepository, HttpSession session) {
        this.productionService = productionService;
        this.produitService = produitService;
        this.ingredientRepository = ingredientRepository;
        this.categorieproduitRepository = categorieproduitRepository;
        this.session = session;
    }

    @GetMapping("/list")
    public ModelAndView getProd(){
        return new ModelAndView("template").addObject("content","production/list.jsp")
                                                    .addObject("prod",productionService.getAll())
                                                    .addObject("categ", categorieproduitRepository.findAll())
                                                    .addObject("ing", ingredientRepository.findAll());
    }

    @PostMapping("/search")
    public ModelAndView recherche(@RequestParam Integer idIngredient, @RequestParam Integer idCategorie) {
        ModelAndView mav = new ModelAndView("template");
        System.out.println(idIngredient);
        System.out.println(idCategorie);
        mav.addObject("prod", productionService.checkProduction(idIngredient,idCategorie));
        mav.addObject("categ", categorieproduitRepository.findAll());
        mav.addObject("ing", ingredientRepository.findAll());
        mav.addObject("content", "produit/list.jsp");
        return mav;
    }

    @GetMapping("/form")
    public ModelAndView getForm(){
        return new ModelAndView("template").addObject("content","production/form.jsp")
                .addObject("produit",produitService.getAll());
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Production prod) throws Exception {
        try{
            productionService.save(prod);
            return "redirect:/production/list";
        }catch (Exception e){
            session.setAttribute("error","Quantiter de stock insuffisant");
            return "redirect:/production/form";

        }

    }


}
