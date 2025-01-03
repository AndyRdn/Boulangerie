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
        return new ModelAndView("template").addObject("content", "fournisseur/form.jsp");
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
        ModelAndView mav = new ModelAndView("template");
        mav.addObject("fournisseurs", fournisseurService.getAll());
        mav.addObject("content", "fournisseur/list.jsp");
        return mav;
    }

    @GetMapping("/formUpdate")
    public ModelAndView formUpdate(@RequestParam("id") Integer id) {
        return new ModelAndView("template")
            .addObject("content", "fournisseur/update.jsp")
            .addObject("fournisseur", fournisseurService.getById(id));
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
