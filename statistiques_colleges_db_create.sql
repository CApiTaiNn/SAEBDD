CREATE TABLE Region(
    code_region                VARCHAR(3),
    libelle_region             VARCHAR(50) UNIQUE
);

CREATE TABLE Departement(
    code_departement           VARCHAR(3),
    nom_departement            VARCHAR(50) UNIQUE
);


CREATE TABLE Commune(
    code_insee_de_la_commune   VARCHAR(3),
    nom_dep_la_commune         VARCHAR(50) UNIQUE
);


CREATE TABLE Quartier_prioritaire(
    code_quartier_prioritaire  VARCHAR(3),
    nom_quartier_prioritaire   VARCHAR(50) UNIQUE
);


