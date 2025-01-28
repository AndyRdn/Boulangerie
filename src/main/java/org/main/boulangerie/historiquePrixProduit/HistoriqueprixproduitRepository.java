package org.main.boulangerie.historiquePrixProduit;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HistoriqueprixproduitRepository extends JpaRepository<Historiqueprixproduit, Integer> {
}