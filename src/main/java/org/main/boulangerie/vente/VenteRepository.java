package org.main.boulangerie.vente;

import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface VenteRepository extends JpaRepository<Vente, Integer> {
    List<Vente> findByDaty(LocalDate daty);
}