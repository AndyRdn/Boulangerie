package org.main.boulangerie.ingredient;

import org.main.boulangerie.model.Model;
import org.main.boulangerie.model.ModelRepository;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IngredientService {
    private final IngredientRepository ingredientRepository;
    private final ModelRepository modelRepository;

    public IngredientService(IngredientRepository ingredientRepository, ModelRepository modelRepository) {
        this.ingredientRepository =ingredientRepository;
        this.modelRepository = modelRepository;
    }

    public List<Ingredient> getAllIngredients() {
        return ingredientRepository.findAll();
    }

    public Ingredient getIngredientById(Integer id) {
        return ingredientRepository.findById(id).orElseThrow(() -> new RuntimeException("Very e"));
    }

    public void saveIngredient(IngredientForm ingredientForm){
        Model nouv= new Model();

        nouv.setIdtypeproduit(ingredientForm.getTypeModel());
        nouv.setNom(ingredientForm.getNom());

        Model conf=modelRepository.save(nouv);

        Ingredient iNouv= new Ingredient();
        iNouv.setPrix(ingredientForm.getPrix());
        iNouv.setIdmodel(conf);
        ingredientRepository.save(iNouv);
    }
}
