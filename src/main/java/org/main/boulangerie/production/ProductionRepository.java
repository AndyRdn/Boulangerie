package org.main.boulangerie.production;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductionRepository extends JpaRepository<Production, Integer> {
    List<Production> findByIdproduit_Idcategorie_Id(Integer id);
}