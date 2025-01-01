package org.main.boulangerie.employe;

import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class EmployerService {
    private final EmployerRepository employerRepository;

    public EmployerService(EmployerRepository employerRepository) {
        this.employerRepository = employerRepository;
    }

    public List<Employer> getAll() {
        return employerRepository.findAll();
    }

    public Employer getById(Integer id) {
        return employerRepository.findById(id).orElseThrow(() -> new RuntimeException("Employer not found"));
    }

    public void save(Employer employer) {
        employerRepository.save(employer);
    }

    public void update(Integer id, String nom, Double salaire, LocalDate dateembauche) {
        Employer employer = employerRepository.findById(id).orElse(null);
        if (employer != null) {
            employer.setNom(nom);
            employer.setSalaire(salaire);
            employer.setDateembauche(dateembauche);
            employerRepository.save(employer);
        }
    }


    public void delete(Integer id) {
        employerRepository.deleteById(id);
    }
}
