package org.main.boulangerie.vente.ventedetail;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface VentedetailRepository extends JpaRepository<Ventedetail, Integer> {
    List<Ventedetail> findByIdproduit_Idcategorie_Id(Integer id);
}