package org.main.boulangerie.historiquePrixProduit;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HistoriqueprixproduitRepository extends JpaRepository<Historiqueprixproduit, Integer> {
    List<Historiqueprixproduit> findByIdproduit_Id(Integer id);
}