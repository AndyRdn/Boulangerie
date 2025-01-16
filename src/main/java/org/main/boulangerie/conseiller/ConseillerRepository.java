package org.main.boulangerie.conseiller;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ConseillerRepository extends JpaRepository<Conseiller, Integer> {
    List<Conseiller> findByMois(Integer mois);

    List<Conseiller> findByMoisAndAnnee(Integer mois, Integer annee);

    @Override
    boolean existsById(Integer integer);

    boolean existsByIdproduit_IdAndMoisAndAnnee(Integer id, Integer mois, Integer annee);

    List<Conseiller> findByAnnee(Integer annee);
}