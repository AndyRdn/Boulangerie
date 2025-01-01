package org.main.boulangerie.employe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/employe")
public class EmployerController {
    private final EmployerService employerService;

    public EmployerController(EmployerService employerService) {
        this.employerService = employerService;
    }

    @GetMapping("/form")
    public ModelAndView form() {
        return new ModelAndView("employe/form");
    }

    @PostMapping("/save")
    public String save(@ModelAttribute EmployerForm form) {
        Employer employer = new Employer();
        employer.setNom(form.getNom());
        employer.setSalaire(form.getSalaire());
        employer.setDateembauche(form.getDateembauche());
        employerService.save(employer);
        return "redirect:/employe/list";
    }

    @GetMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("employe/list");
        mav.addObject("employes", employerService.getAll());
        return mav;
    }

    @GetMapping("/formUpdate")
    public ModelAndView formUpdate(@RequestParam("id") Integer id) {
        ModelAndView mav = new ModelAndView("employe/update");
        mav.addObject("employe", employerService.getById(id));
        return mav;
    }

    @PostMapping("/update")
    public String update(@RequestParam("id") Integer id, @ModelAttribute EmployerForm form) {
        employerService.update(id, form.getNom(), form.getSalaire(), form.getDateembauche());
        return "redirect:/employe/list";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        employerService.delete(id);
        return "redirect:/employe/list";
    }
}
