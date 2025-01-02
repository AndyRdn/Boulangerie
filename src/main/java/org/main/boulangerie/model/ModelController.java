package org.main.boulangerie.model;

import org.main.boulangerie.typemodel.Typemodel;
import org.main.boulangerie.typemodel.TypemodelService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/model")
public class ModelController {
    private final ModelService modelService;
    private final TypemodelService typemodelService;

    public ModelController(ModelService modelService, TypemodelService typemodelService) {
        this.modelService = modelService;
        this.typemodelService = typemodelService;
    }

    @GetMapping("/form")
    public ModelAndView form() {
        return new ModelAndView("template").addObject("content", "model/form.jsp");
    }

    @PostMapping("/save")
    public String save(@ModelAttribute ModelForm form) {
        Model model = new Model();
        model.setNom(form.getNom());
        Typemodel typemodel = typemodelService.getById(form.getIdtypeproduit());
        model.setIdtypeproduit(typemodel);
        modelService.save(model);
        return "redirect:/model/list";
    }

    @GetMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("template");
        mav.addObject("models", modelService.getAll());
        mav.addObject("content", "model/list.jsp");
        return mav;
    }

    @GetMapping("/formUpdate")
    public ModelAndView formUpdate(@RequestParam("id") Integer id) {
        return new ModelAndView("template")
            .addObject("content", "model/update.jsp")
            .addObject("model", modelService.getById(id))
            .addObject("typemodels", typemodelService.getAll());
    }

    @PostMapping("/update")
    public String update(@RequestParam("id") Integer id, @ModelAttribute ModelForm form) {
        modelService.update(id, form.getNom(), form.getIdtypeproduit());
        return "redirect:/model/list";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        modelService.delete(id);
        return "redirect:/model/list";
    }
}
