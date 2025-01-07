package org.main.boulangerie.produit;

import org.main.boulangerie.categorie.CategorieproduitService;
import org.main.boulangerie.ingredient.IngredientRepository;
import org.main.boulangerie.ingredient.IngredientService;
import org.main.boulangerie.model.ModelService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/produit")
public class ProduitController {
    private final ProduitService produitService;
    private final IngredientRepository ingredientRepository;

    public ProduitController(ProduitService produitService, IngredientRepository ingredientRepository) {
        this.produitService = produitService;
        this.ingredientRepository = ingredientRepository;
    }

    @GetMapping("/form")
    public ModelAndView form() {
        return new ModelAndView("template")
            .addObject("content", "produit/form.jsp")
            .addObject("ingredients", ingredientRepository.findAll());

    }
    @GetMapping("/search")
    public ModelAndView recherche() {
        ModelAndView mav = new ModelAndView("template");
//        mav.addObject("produits", produitService.checkProduit(I));
        mav.addObject("content", "produit/list.jsp");
        return mav;
    }

    @PostMapping("/save")
    public String save(@ModelAttribute ProduitForm form) {
        produitService.save(form);
        return "redirect:/produit/list";
    }

    @GetMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("template");
        mav.addObject("produits", produitService.getAll());
        mav.addObject("content", "produit/list.jsp");
        return mav;
    }

//    @GetMapping("/formUpdate")
//    public ModelAndView formUpdate(@RequestParam("id") Integer id) {
//        return new ModelAndView("template")
//            .addObject("content", "produit/update.jsp")
//            .addObject("produit", produitService.getById(id))
//            .addObject("models", modelService.getAll())
//            .addObject("categories", categorieproduitService.getAll());
//    }

    @PostMapping("/update")
    public String update(@RequestParam("id") Integer id, @ModelAttribute ProduitForm form) {
//        produitService.update(id, form);
        return "redirect:/produit/list";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        produitService.delete(id);
        return "redirect:/produit/list";
    }
}
