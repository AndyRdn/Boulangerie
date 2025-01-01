package org.main.boulangerie.fournisseur;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FournisseurService {
    private final FournisseurRepository fournisseurRepository;

    public FournisseurService(FournisseurRepository fournisseurRepository) {
        this.fournisseurRepository = fournisseurRepository;
    }

    public List<Fournisseur> getAll() {
        return fournisseurRepository.findAll();
    }

    public Fournisseur getById(Integer id) {
        return fournisseurRepository.findById(id).orElseThrow(() -> new RuntimeException("Fournisseur not found"));
    }

    public void save(Fournisseur fournisseur) {
        fournisseurRepository.save(fournisseur);
    }

    public void update(Integer id, String nom) {
        Fournisseur fournisseur = fournisseurRepository.findById(id).orElse(null);
        if (fournisseur != null) {
            fournisseur.setNom(nom);
            fournisseurRepository.save(fournisseur);
        }
    }

    public void delete(Integer id) {
        fournisseurRepository.deleteById(id);
    }
}
