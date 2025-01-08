package org.main.boulangerie.stock;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.main.boulangerie.stock.mvtStockDetails.Mvtstockdetail;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "mvtstock")
public class Mvtstock {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "daty")
    private LocalDate daty;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "idmvtstock")
    List<Mvtstockdetail> mvtstockdetails;

}