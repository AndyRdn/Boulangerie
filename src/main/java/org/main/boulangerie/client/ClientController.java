package org.main.boulangerie.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/client")
public class ClientController {
    private final ClientService clientService;

    public ClientController(ClientService clientService) {
        this.clientService = clientService;
    }

    @GetMapping("/form")
    public ModelAndView form() {
        return new ModelAndView("client/form");
    }

    @PostMapping("/save")
    public String save(@ModelAttribute ClientForm form) {
        Client client = new Client();
        client.setNom(form.getNom());
        client.setDaty(form.getDaty());
        clientService.save(client);
        return "redirect:/client/list";
    }

    @GetMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("client/list");
        mav.addObject("clients", clientService.getAll());
        return mav;
    }

    @GetMapping("/formUpdate")
    public ModelAndView formUpdate(@RequestParam("id") Integer id) {
        ModelAndView mav = new ModelAndView("client/update");
        mav.addObject("client", clientService.getById(id));
        return mav;
    }

    @PostMapping("/update")
    public String update(@RequestParam("id") Integer id, @ModelAttribute ClientForm form) {
        clientService.update(id, form.getNom(), form.getDaty());
        return "redirect:/client/list";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") Integer id) {
        clientService.delete(id);
        return "redirect:/client/list";
    }
}
