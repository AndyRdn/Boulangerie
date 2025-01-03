package org.main.boulangerie.achat;

import org.main.boulangerie.fournisseur.Fournisseur;
import org.main.boulangerie.fournisseur.FournisseurRepository;
import org.main.boulangerie.ingredient.Ingredient;
import org.main.boulangerie.ingredient.IngredientService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/achat")
public class AchatController {
    private final AchatService achatService;
    private final FournisseurRepository fournisseurRepository;
    private final IngredientService ingredientService;

    public AchatController(AchatService achatService,
                           FournisseurRepository fournisseurRepository,
                           IngredientService ingredientService) {
        this.achatService = achatService;
        this.fournisseurRepository = fournisseurRepository;
        this.ingredientService = ingredientService;
    }

    @GetMapping("/form")
    public ModelAndView form() {
        ModelAndView mav = new ModelAndView("template");
        mav.addObject("fournisseurs", fournisseurRepository.findAll());
        mav.addObject("ingredients", ingredientService.getAllIngredients());
        mav.addObject("content", "achat/form.jsp");
        return mav;
    }

    @PostMapping("/save")
    public String saveMultiple(@ModelAttribute AchatFormList achatFormList) {
        for (AchatForm form : achatFormList.getForms()) {
            if (form.getDaty() != null && form.getFournisseurId() != null) {
                Achat achat = new Achat();
                achat.setDaty(form.getDaty());
                Fournisseur fournisseur = fournisseurRepository.findById(form.getFournisseurId())
                        .orElseThrow(() -> new RuntimeException("Fournisseur introuvable"));
                achat.setIdfournisseur(fournisseur);
                List<Achatdetail> details = new ArrayList<>();
                for (AchatDetailForm detailForm : form.getDetails()) {
                    Achatdetail detail = new Achatdetail();
                    detail.setQuantite(detailForm.getQuantite());
                    detail.setPrixunitaire(detailForm.getPrixUnitaire());
                    Ingredient ingredient = ingredientService.getIngredientById(detailForm.getIngredientId());
                    detail.setIdingredient(ingredient);
                    details.add(detail);
                }
                achatService.saveAchat(achat, details);
            }
        }
        return "redirect:/achat/list";
    }




    @GetMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("template");
        mav.addObject("achats", achatService.getAllAchats());
        mav.addObject("content", "achat/list.jsp");
        return mav;
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        achatService.deleteAchat(id);
        return "redirect:/achat/list";
    }
}
