package org.main.boulangerie.produit;

import org.main.boulangerie.categorie.Categorieproduit;
import org.main.boulangerie.categorie.CategorieproduitRepository;
import org.main.boulangerie.categorie.CategorieproduitService;
import org.main.boulangerie.ingredient.Ingredient;
import org.main.boulangerie.ingredient.IngredientRepository;
import org.main.boulangerie.ingredient.IngredientService;
import org.main.boulangerie.model.ModelService;
import org.main.boulangerie.parfum.ParfumRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/produit")
public class ProduitController {
    private final ProduitService produitService;
    private final IngredientRepository ingredientRepository;
    private final CategorieproduitRepository categorieproduitRepository;
    private final ParfumRepository parfumRepository;

    public ProduitController(ProduitService produitService, IngredientRepository ingredientRepository, CategorieproduitRepository categorieproduitRepository, ParfumRepository parfumRepository) {
        this.produitService = produitService;
        this.ingredientRepository = ingredientRepository;
        this.categorieproduitRepository = categorieproduitRepository;
        this.parfumRepository = parfumRepository;
    }

    @GetMapping("/form")
    public ModelAndView form() {
        return new ModelAndView("template")
            .addObject("content", "produit/form.jsp")
            .addObject("categories", categorieproduitRepository.findAll())
            .addObject("ingredient", ingredientRepository.findAll())
            .addObject("parf", parfumRepository.findAll());


    }
    @PostMapping("/search")
    public ModelAndView recherche(@RequestParam Integer idIngredient, @RequestParam Integer idCategorie) {
        ModelAndView mav = new ModelAndView("template");
        System.out.println(idIngredient);
        System.out.println(idCategorie);
        mav.addObject("produits", produitService.checkProduit(idIngredient,idCategorie));
        mav.addObject("categ", categorieproduitRepository.findAll());
        mav.addObject("ing", ingredientRepository.findAll());
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
        mav.addObject("categ", categorieproduitRepository.findAll());
        mav.addObject("ing", ingredientRepository.findAll());
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

    @GetMapping("/details")
    public ModelAndView details(@RequestParam Produit id){
        return new ModelAndView("template")
                .addObject("content", "produit/details.jsp")
                .addObject("produit", id);

    }
}
