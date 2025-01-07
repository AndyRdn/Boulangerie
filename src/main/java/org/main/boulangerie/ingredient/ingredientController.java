package org.main.boulangerie.ingredient;

import org.main.boulangerie.model.Model;
import org.main.boulangerie.model.ModelForm;
import org.main.boulangerie.typemodel.Typemodel;
import org.main.boulangerie.typemodel.TypemodelRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/ingredient")
public class ingredientController {

    private final IngredientService ingredientService;
    private final TypemodelRepository typemodelRepository;

    public ingredientController(IngredientService ingredientService, TypemodelRepository typemodelRepository) {
        this.ingredientService = ingredientService;
        this.typemodelRepository = typemodelRepository;
    }

    @GetMapping("/form")
    public ModelAndView form() {

        return new ModelAndView("template")
                .addObject("content", "ingredient/form.jsp")
                .addObject("typeModels", typemodelRepository.findAll());
    }


    @PostMapping("/save")
    public String save(@ModelAttribute IngredientForm form) {
        ingredientService.saveIngredient(form);
        return "redirect:/ingredient/list";
    }

    @GetMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("template");
        mav.addObject("ingredients", ingredientService.getAllIngredients());
        mav.addObject("content", "ingredient/list.jsp");
        return mav;
    }
}
