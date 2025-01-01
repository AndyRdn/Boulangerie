package org.main.boulangerie.produit;

import org.main.boulangerie.categorie.CategorieproduitService;
import org.main.boulangerie.model.ModelService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/produit")
public class ProduitController {
    private final ProduitService produitService;
    private final ModelService modelService;
    private final CategorieproduitService categorieproduitService;

    public ProduitController(ProduitService produitService, ModelService modelService, CategorieproduitService categorieproduitService) {
        this.produitService = produitService;
        this.modelService = modelService;
        this.categorieproduitService = categorieproduitService;
    }

    @GetMapping("/form")
    public ModelAndView form() {
        ModelAndView mav = new ModelAndView("produit/form");
        mav.addObject("models", modelService.getAll());
        mav.addObject("categories", categorieproduitService.getAll());
        return mav;
    }

    @PostMapping("/save")
    public String save(@ModelAttribute ProduitForm form) {
        produitService.save(form);
        return "redirect:/produit/list";
    }

    @GetMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("produit/list");
        mav.addObject("produits", produitService.getAll());
        return mav;
    }

    @GetMapping("/formUpdate")
    public ModelAndView formUpdate(@RequestParam("id") Integer id) {
        ModelAndView mav = new ModelAndView("produit/update");
        mav.addObject("produit", produitService.getById(id));
        mav.addObject("models", modelService.getAll());
        mav.addObject("categories", categorieproduitService.getAll());
        return mav;
    }

    @PostMapping("/update")
    public String update(@RequestParam("id") Integer id, @ModelAttribute ProduitForm form) {
        produitService.update(id, form);
        return "redirect:/produit/list";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        produitService.delete(id);
        return "redirect:/produit/list";
    }
}
