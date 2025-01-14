package org.main.boulangerie.conseiller;

import lombok.Setter;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class ConseillerService {
    private final ConseillerRepository conseillerRepository;

    public ConseillerService(ConseillerRepository conseillerRepository) {
        this.conseillerRepository = conseillerRepository;
    }

    public List<Conseiller>getAll(){
        return conseillerRepository.findAll();
    }

    public void save(Conseiller conseiller) throws Exception {
        if (conseillerRepository.existsByIdproduit_IdAndMoisAndAnnee(conseiller.getIdproduit().getId(),conseiller.getMois(),conseiller.getAnnee())){
            throw new Exception("Produit Existant");
        }
        conseillerRepository.save(conseiller);
        return;
    }

    public List<Conseiller> getConseillerNow(){
        System.out.println();
        System.out.println();

        return conseillerRepository.findByMoisAndAnnee(LocalDate.now().getMonthValue(),LocalDate.now().getYear());
    }
    public List<Conseiller> getConseillerMandA(Integer mois, Integer annee){
        System.out.println();
        System.out.println();

        return conseillerRepository.findByMoisAndAnnee(mois, annee);
    }
}
