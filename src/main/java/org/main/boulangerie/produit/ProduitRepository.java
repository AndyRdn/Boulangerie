package org.main.boulangerie.produit;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProduitRepository extends JpaRepository<Produit, Integer> {
    List<Produit> findByDetails_Id(Integer id);

    List<Produit> findByIdcategorie_Id(Integer id);
}