package org.main.boulangerie.produit.produitDetails;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProduitDetailRepository extends JpaRepository<ProduitDetail, Integer> {

}