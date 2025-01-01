package org.main.boulangerie.categorie;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategorieproduitService {
    private final CategorieproduitRepository categorieproduitRepository;

    public CategorieproduitService(CategorieproduitRepository categorieproduitRepository) {
        this.categorieproduitRepository = categorieproduitRepository;
    }

    public List<Categorieproduit> getAll() {
        return categorieproduitRepository.findAll();
    }

    public Categorieproduit getById(Integer id) {
        return categorieproduitRepository.findById(id).orElseThrow(() -> new RuntimeException("CategorieProduit not found"));
    }

    public void save(Categorieproduit categorieproduit) {
        categorieproduitRepository.save(categorieproduit);
    }

    public void update(Integer id, String nom) {
        Categorieproduit categorieproduit = categorieproduitRepository.findById(id).orElse(null);
        if (categorieproduit != null) {
            categorieproduit.setNom(nom);
            categorieproduitRepository.save(categorieproduit);
        }
    }

    public void delete(Integer id) {
        categorieproduitRepository.deleteById(id);
    }
}
