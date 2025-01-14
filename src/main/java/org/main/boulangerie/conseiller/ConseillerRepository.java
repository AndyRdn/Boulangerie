package org.main.boulangerie.conseiller;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ConseillerRepository extends JpaRepository<Conseiller, Integer> {
    List<Conseiller> findByMois(Integer mois);
}