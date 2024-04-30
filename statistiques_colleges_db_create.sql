drop schema if exists "sae_bdd" cascade;
create schema "sae_bdd";
set schema 'sae_bdd'; 


CREATE TABLE _region(
    code_region                VARCHAR(3),
    libelle_region             VARCHAR(50) UNIQUE
);
--alter table 
CREATE TABLE _departement(
    code_departement           VARCHAR(3),
    nom_departement            VARCHAR(50) UNIQUE,
    code_region                VARCHAR(50)
);

--alter table
CREATE TABLE _commune(
    code_insee_de_la_commune   VARCHAR(3) PRIMARY KEY,
    nom_dep_la_commune         VARCHAR(50) UNIQUE,
    code_departement           VARCHAR(50)
);


CREATE TABLE _quartier_prioritaire(
    code_quartier_prioritaire  VARCHAR(3) PRIMARY KEY ,
    nom_quartier_prioritaire   VARCHAR(50) UNIQUE
);

CREATE TABLE _type(
    code_nat VARCHAR(50)PRIMARY KEY,
    libelle_nature VARCHAR(50)
);
-- alter table
CREATE TABLE _etablissement(
    uai integer PRIMARY KEY,
    nom_etablissement VARCHAR(50),
    secteur VARCHAR(50),
    code_postal VARCHAR(50),
    lattitude real, 
    longitude real,
    code_insee_de_la_commune VARCHAR(50),
    code_academie integer,
    code_nat VARCHAR(50)
);
--alter table
CREATE TABLE _carac_tout_etablissement(
    effectifs integer,
    ips real,
    ecart_type_de_l_ips real,
    ep VARCHAR(50),
    uai VARCHAR(50),
    anne_scolaire VARCHAR

);

CREATE TABLE _annee(
    anne_scolaire VARCHAR PRIMARY KEY
);
--alter table
CREATE TABLE _carac_college(
    nb_eleves_hors_segpa_hors_ulis integer,
    nb_eleves_segpa integer,
    nb_eleves_ulis integer
    uai VARCHAR(50),
    anne_scolaire VARCHAR(50)
);

CREATE TABLE _classe(
    id_classe VARCHAR(50),
);
-- alter table
CREATE TABLE _carac_tout_etablissement(
    nb_eleves_hors_segpa_hors_ulis_selon_niveau integer,
    nb_eleves_segpa_selon_niveau integer,
    nb_eleves_ulis_selon_niveau integer,
    effectifs_filles integer,
    effectifs_garcon integer,
    uai VARCHAR(50),
    id_classe VARCHAR(50),
    anne_scolaire VARCHAR(50)
);

CREATE TABLE _a_proximite(
    uai VARCHAR(50),
    code_quartier_prioritaire VARCHAR(3)


);

alter table _carac_tout_etablissement ADD CONSTRAINT competences_fk FOREIGN KEY(lib_competence) REFERENCES _competences(lib_competence);
alter table
alter table


alter table
alter table

alter table
alter table

alter table
alter table
alter table

alter table

alter table