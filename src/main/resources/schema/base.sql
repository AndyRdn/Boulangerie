CREATE TABLE Employer (
                          id SERIAL PRIMARY KEY,
                          nom VARCHAR(255),
                          salaire DOUBLE PRECISION,
                          dateEmbauche DATE
);

CREATE TABLE Client (
                        id SERIAL PRIMARY KEY,
                        nom VARCHAR(255),
                        daty DATE
);

CREATE TABLE Fournisseur (
                             id SERIAL PRIMARY KEY,
                             nom VARCHAR(255)
);

CREATE TABLE typeModel (
                           id SERIAL PRIMARY KEY,
                           nom VARCHAR(255)
);

CREATE TABLE Model (
                       id SERIAL PRIMARY KEY,
                       nom VARCHAR(255),
                       idTypeProduit INT REFERENCES typeModel(id)
);

CREATE TABLE CategorieProduit (
                                  id SERIAL PRIMARY KEY,
                                  nom VARCHAR(255)
);

CREATE TABLE Ingredient (
                            id SERIAL PRIMARY KEY,
                            idModel INT REFERENCES Model(id),
                            prix DOUBLE PRECISION,
                            idparfum int references parfum(id)
);

CREATE TABLE Produit (
                         id SERIAL PRIMARY KEY,
                         nom VARCHAR(255),
                         idModel INT REFERENCES Model(id),
                         prixVente DOUBLE PRECISION,
                         idCategorie BIGINT REFERENCES CategorieProduit(id)
);

CREATE TABLE ProduitDetails (
                                id SERIAL PRIMARY KEY,
                                quantite INT,
                                idProduit INT REFERENCES Produit(id),
                                idIngredient INT REFERENCES Ingredient(id)
);

CREATE TABLE achat (
                       id SERIAL PRIMARY KEY,
                       daty DATE,
                       idFournisseur INT REFERENCES Fournisseur(id)
);

CREATE TABLE achatDetails (
                              id SERIAL PRIMARY KEY,
                              idAchat INT REFERENCES achat(id),
                              idIngredient INT REFERENCES Ingredient(id),
                              quantite INT,
                              prixUnitaire DOUBLE PRECISION
);

CREATE TABLE Vente (
                       id SERIAL PRIMARY KEY,
                       daty DATE,
                       idClient INT REFERENCES Client(id)

);

CREATE TABLE VenteDetails (
                              id SERIAL PRIMARY KEY,
                              idVente INT REFERENCES Vente(id),
                              idProduit INT REFERENCES Produit(id),
                              quantite INT
);

CREATE TABLE MvtStock (
                          id SERIAL PRIMARY KEY,
                          daty DATE
);

CREATE TABLE MvtStockDetails (
                                 id SERIAL PRIMARY KEY,
                                 idMvtStock INT REFERENCES MvtStock(id),
                                 idModel INT REFERENCES Model(id),
                                 entree INT,
                                 sortie INT,
                                 prixUnitaire BIGINT
);
INSERT INTO Ingredient (idModel, prix)
VALUES
    (1, 5.99),
    (1, 3.49),
    (1, 7.99);
ALTER TABLE Ingredient
    ADD COLUMN nom VARCHAR(255);

CREATE TABLE production (
                            id SERIAL PRIMARY KEY ,
                            idProduit int REFERENCES Produit(id),
                            quantite int,
                            prixUnitaire double precision,
                            daty DATE
 );

create table parfum(
                    id serial primary key ,
                    nom varchar(255)
);

CREATE TABLE Produit (
                        id SERIAL PRIMARY KEY,
                        nom VARCHAR(255),
                        idModel INT REFERENCES Model(id),
                        prixVente DOUBLE PRECISION,
                        idCategorie BIGINT REFERENCES CategorieProduit(id),
                        idparfum int references parfum(id)
);

CREATE TABLE Ingredient (
                            id SERIAL PRIMARY KEY,
                            idModel INT REFERENCES Model(id),
                            prix DOUBLE PRECISION
);

CREATE TABLE Conseiller (
                            id serial primary key ,
                            idProduit int references Produit(id),
                            mois int,
                            annee int
);