package org.main.boulangerie.typemodel;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypemodelService {
    private final TypemodelRepository typemodelRepository;

    public TypemodelService(TypemodelRepository typemodelRepository) {
        this.typemodelRepository = typemodelRepository;
    }

    public List<Typemodel> getAll() {
        return typemodelRepository.findAll();
    }

    public Typemodel getById(Integer id) {
        return typemodelRepository.findById(id).orElseThrow(() -> new RuntimeException("Typemodel not found"));
    }

    public void save(Typemodel typemodel) {
        typemodelRepository.save(typemodel);
    }

    public void update(Integer id, String nom) {
        Typemodel typemodel = typemodelRepository.findById(id).orElse(null);
        if (typemodel != null) {
            typemodel.setNom(nom);
            typemodelRepository.save(typemodel);
        }
    }

    public void delete(Integer id) {
        typemodelRepository.deleteById(id);
    }
}
