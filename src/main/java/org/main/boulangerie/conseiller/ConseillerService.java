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

    public void save(Conseiller conseiller){
        conseillerRepository.save(conseiller);
        return;
    }

    public List<Conseiller> getConseillerNow(){
        return conseillerRepository.findByMois(LocalDate.now().getMonthValue());
    }
}
