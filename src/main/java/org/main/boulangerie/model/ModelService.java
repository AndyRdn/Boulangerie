package org.main.boulangerie.model;

import org.main.boulangerie.typemodel.Typemodel;
import org.main.boulangerie.typemodel.TypemodelService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ModelService {
    private final ModelRepository modelRepository;
    private final TypemodelService typemodelService;

    public ModelService(ModelRepository modelRepository, TypemodelService typemodelService) {
        this.modelRepository = modelRepository;
        this.typemodelService = typemodelService;
    }

    public List<Model> getAll() {
        return modelRepository.findAll();
    }

    public Model getById(Integer id) {
        return modelRepository.findById(id).orElseThrow(() -> new RuntimeException("Model not found"));
    }

    public void save(Model model) {
        modelRepository.save(model);
    }

    public void update(Integer id, String nom, Integer idtypeproduit) {
        Model model = modelRepository.findById(id).orElse(null);
        if (model != null) {
            model.setNom(nom);
            Typemodel typemodel = typemodelService.getById(idtypeproduit);
            model.setIdtypeproduit(typemodel);
            modelRepository.save(model);
        }
    }

    public void delete(Integer id) {
        modelRepository.deleteById(id);
    }
}
