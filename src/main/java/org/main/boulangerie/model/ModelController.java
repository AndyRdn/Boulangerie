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
        ModelAndView mav = new ModelAndView("model/form");
        List<Typemodel> typemodels = typemodelService.getAll();
        mav.addObject("typemodels", typemodels);
        return mav;
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
        ModelAndView mav = new ModelAndView("model/list");
        mav.addObject("models", modelService.getAll());
        return mav;
    }

    @GetMapping("/formUpdate")
    public ModelAndView formUpdate(@RequestParam("id") Integer id) {
        ModelAndView mav = new ModelAndView("model/update");
        Model model = modelService.getById(id);
        List<Typemodel> typemodels = typemodelService.getAll();
        mav.addObject("model", model);
        mav.addObject("typemodels", typemodels);
        return mav;
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
