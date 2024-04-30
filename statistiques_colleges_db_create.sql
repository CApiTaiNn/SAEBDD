CREATE TABLE Region{
    code_region     VARCHAR(2),
    libelle_region  VARCHAR(50)
}

CREATE TABLE Departement{
    code_region     VARCHAR(2),
    libelle_region  VARCHAR(50)
}




CREATE TABLE(
    uai integer PRIMARY KEY,
    nom_etablissement VARCHAR(50),
    secteur VARCHAR(50),
    code_postal VARCHAR(50),
    lattitude real, 
    longitude real
);
