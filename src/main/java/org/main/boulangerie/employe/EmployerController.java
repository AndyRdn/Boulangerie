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
        return new ModelAndView("template").addObject("content", "employe/form.jsp");
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
        ModelAndView mav = new ModelAndView("template");
        mav.addObject("employes", employerService.getAll());
        mav.addObject("content", "employe/list.jsp");
        return mav;
    }

    @GetMapping("/formUpdate")
    public ModelAndView formUpdate(@RequestParam("id") Integer id) {
        return new ModelAndView("template")
            .addObject("content", "employe/update.jsp")
            .addObject("employe", employerService.getById(id));
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
