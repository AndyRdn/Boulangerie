package org.main.boulangerie.categorie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/categorie")
public class CategorieproduitController {
    private final CategorieproduitService categorieproduitService;

    public CategorieproduitController(CategorieproduitService categorieproduitService) {
        this.categorieproduitService = categorieproduitService;
    }

    @GetMapping("/form")
    public ModelAndView form() {
        return new ModelAndView("template").addObject("content", "categorie/form.jsp");
    }

    @PostMapping("/save")
    public String save(@ModelAttribute CategorieproduitForm form) {
        Categorieproduit categorieproduit = new Categorieproduit();
        categorieproduit.setNom(form.getNom());
        categorieproduitService.save(categorieproduit);
        return "redirect:/categorie/list";
    }

    @GetMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("template");
        mav.addObject("categories", categorieproduitService.getAll());
        mav.addObject("content", "categorie/list.jsp");
        return mav;
    }

    @GetMapping("/formUpdate")
    public ModelAndView formUpdate(@RequestParam("id") Integer id) {
        return new ModelAndView("template")
            .addObject("content", "categorie/update.jsp")
            .addObject("categorie", categorieproduitService.getById(id));
    }

    @PostMapping("/update")
    public String update(@RequestParam("id") Integer id, @ModelAttribute CategorieproduitForm form) {
        categorieproduitService.update(id, form.getNom());
        return "redirect:/categorie/list";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        categorieproduitService.delete(id);
        return "redirect:/categorie/list";
    }
}
