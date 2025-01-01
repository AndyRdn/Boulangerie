package org.main.boulangerie.typemodel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/typemodel")
public class TypemodelController {
    private final TypemodelService typemodelService;

    public TypemodelController(TypemodelService typemodelService) {
        this.typemodelService = typemodelService;
    }

    @GetMapping("/form")
    public ModelAndView form() {
        return new ModelAndView("typemodel/form");
    }

    @PostMapping("/save")
    public String save(@ModelAttribute TypemodelForm form) {
        Typemodel typemodel = new Typemodel();
        typemodel.setNom(form.getNom());
        typemodelService.save(typemodel);
        return "redirect:/typemodel/list";
    }

    @GetMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("typemodel/list");
        mav.addObject("typemodels", typemodelService.getAll());
        return mav;
    }

    @GetMapping("/formUpdate")
    public ModelAndView formUpdate(@RequestParam("id") Integer id) {
        ModelAndView mav = new ModelAndView("typemodel/update");
        mav.addObject("typemodel", typemodelService.getById(id));
        return mav;
    }

    @PostMapping("/update")
    public String update(@RequestParam("id") Integer id, @ModelAttribute TypemodelForm form) {
        typemodelService.update(id, form.getNom());
        return "redirect:/typemodel/list";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        typemodelService.delete(id);
        return "redirect:/typemodel/list";
    }
}
