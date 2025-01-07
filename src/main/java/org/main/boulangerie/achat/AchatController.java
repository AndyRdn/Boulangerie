package org.main.boulangerie.achat;

import org.main.boulangerie.achat.achatDetails.Achatdetail;
import org.main.boulangerie.achat.achatDetails.AchatdetailRepository;
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
    private final AchatRepository achatRepository;
    private final AchatdetailRepository achatdetailRepository;

    public AchatController(AchatService achatService,
                           FournisseurRepository fournisseurRepository,
                           IngredientService ingredientService,
                           AchatRepository achatRepository,
                           AchatdetailRepository achatdetailRepository) {
        this.achatService = achatService;
        this.fournisseurRepository = fournisseurRepository;
        this.ingredientService = ingredientService;
        this.achatRepository = achatRepository;
        this.achatdetailRepository = achatdetailRepository;
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
    public String saveMultiple(@ModelAttribute AchatForm form) {

        System.out.println(form.getDaty());
        System.out.println(form.getFournisseurId());

//        for (AchatDetailForm achatDetailForm: achatForm.getDetails()){
//            System.out.println(achatDetailForm.getIngredientId());
//            System.out.println(achatDetailForm.getQuantite());
//            System.out.println(achatDetailForm.getPrixUnitaire());
//        }

            if (form.getDaty() != null && form.getFournisseurId() != null) {
                Achat achat = new Achat();
                achat.setDaty(form.getDaty());
                Fournisseur fournisseur = fournisseurRepository.findById(form.getFournisseurId())
                        .orElseThrow(() -> new RuntimeException("Fournisseur introuvable"));
                achat.setIdfournisseur(fournisseur);
                Achat src=achatRepository.save(achat);
                List<Achatdetail> details=new ArrayList<>();
                for (AchatDetailForm detailForm : form.getDetails()) {
                    Achatdetail detail = new Achatdetail();
                    detail.setIdachat(src);
                    detail.setQuantite(detailForm.getQuantite());
                    detail.setPrixunitaire(detailForm.getPrixUnitaire());
                    Ingredient ingredient = ingredientService.getIngredientById(detailForm.getIngredientId());
                    detail.setIdingredient(ingredient);

                    details.add(achatdetailRepository.save(detail));
                }
                achatService.saveAchat(achat, details);
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
