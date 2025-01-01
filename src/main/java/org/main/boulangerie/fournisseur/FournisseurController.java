package org.main.boulangerie.fournisseur;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/fournisseur")
public class FournisseurController {
    private final FournisseurService fournisseurService;

    public FournisseurController(FournisseurService fournisseurService) {
        this.fournisseurService = fournisseurService;
    }

    @GetMapping("/form")
    public ModelAndView form() {
        return new ModelAndView("fournisseur/form");
    }

    @PostMapping("/save")
    public String save(@ModelAttribute FournisseurForm form) {
        Fournisseur fournisseur = new Fournisseur();
        fournisseur.setNom(form.getNom());
        fournisseurService.save(fournisseur);
        return "redirect:/fournisseur/list";
    }

    @GetMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("fournisseur/list");
        mav.addObject("fournisseurs", fournisseurService.getAll());
        return mav;
    }

    @GetMapping("/formUpdate")
    public ModelAndView formUpdate(@RequestParam("id") Integer id) {
        ModelAndView mav = new ModelAndView("fournisseur/update");
        mav.addObject("fournisseur", fournisseurService.getById(id));
        return mav;
    }

    @PostMapping("/update")
    public String update(@RequestParam("id") Integer id, @ModelAttribute FournisseurForm form) {
        fournisseurService.update(id, form.getNom());
        return "redirect:/fournisseur/list";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        fournisseurService.delete(id);
        return "redirect:/fournisseur/list";
    }
}
