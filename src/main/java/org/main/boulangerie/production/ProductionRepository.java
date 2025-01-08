package org.main.boulangerie.production;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public interface ProductionRepository extends JpaRepository<Production, Integer> {
}