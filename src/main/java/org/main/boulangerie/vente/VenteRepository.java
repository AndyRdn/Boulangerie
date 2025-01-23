package org.main.boulangerie.vente;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface VenteRepository extends JpaRepository<Vente, Integer> {
    List<Vente> findByDaty(LocalDate daty);
    @Query("SELECT NEW org.main.boulangerie.vente.VenteCommissionParVendeur(v.idvendeur.id, v.idvendeur.nom, SUM(v.commission)) " +
            "FROM Vente v " +
            "WHERE v.daty >= coalesce(:dateDebut, v.daty) and v.daty<= coalesce(:dateFin, v.daty) " +
            "GROUP BY v.idvendeur.id, v.idvendeur.nom")
    List<VenteCommissionParVendeur> findCommissionParVendeurBetweenDates(
            @Param("dateDebut") LocalDate dateDebut,
            @Param("dateFin") LocalDate dateFin);

//    @Query("SELECT NEW org.main.boulangerie.vente.VenteCommissionParVendeur(v.idvendeur.id, v.idvendeur.nom, SUM(v.commission)) " +
//            "FROM Vente v " +
//            "GROUP BY v.idvendeur.id, v.idvendeur.nom")
//    List<VenteCommissionParVendeur> findCommissionParVendeur();
}