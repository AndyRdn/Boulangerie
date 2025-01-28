package org.main.boulangerie.config;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ConfigRepository extends JpaRepository<Config, Integer> {
    Optional<Config> findByNom(String nom);
}