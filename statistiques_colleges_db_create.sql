drop schema if exists "pg_sae204_k12" cascade;
create schema "pg_sae204_k12";
set schema 'pg_sae204_k12'; 


CREATE TABLE _region(
    code_region                VARCHAR(3) PRIMARY KEY,
    libelle_region             VARCHAR(50) UNIQUE
);


CREATE TABLE _departement(
    code_departement           VARCHAR(3) PRIMARY KEY,
    nom_departement            VARCHAR(50) UNIQUE,
    code_region                VARCHAR(3)
);



CREATE TABLE _commune(
    code_insee_de_la_commune   VARCHAR(3) PRIMARY KEY,
    nom_dep_la_commune         VARCHAR(50) UNIQUE,
    code_departement           VARCHAR(50) NULL 
);


CREATE TABLE _quartier_prioritaire(
    code_quartier_prioritaire  VARCHAR(3) PRIMARY KEY ,
    nom_quartier_prioritaire   VARCHAR(50) UNIQUE
);


CREATE TABLE _type(
    code_nature                VARCHAR(50)PRIMARY KEY,
    libelle_nature             VARCHAR(50)
);


CREATE TABLE _academie(
    code_academie              INTEGER PRIMARY KEY,
    lib_academie               VARCHAR(50) UNIQUE
);

CREATE TABLE _etablissement(
    uai                        integer PRIMARY KEY,
    nom_etablissement          VARCHAR(50),
    secteur                    VARCHAR(50),
    code_postal                VARCHAR(50),
    lattitude                  real, 
    longitude                  real,
    code_academie              integer,
    code_nat                   VARCHAR(50),
    code_commune               VARCHAR(3),
    code_academie              VARCHAR(50)              
);



CREATE TABLE _carac_tout_etablissement(
    effectifs                  integer,
    ips                        real,
    ecart_type_de_l_ips        real,
    ep                         VARCHAR(50),
    uai                        VARCHAR(50),
    annee_scolaire              VARCHAR(4)
);


CREATE TABLE _annee(
    annee_scolaire              VARCHAR(4) PRIMARY KEY
);


CREATE TABLE _carac_college(
    nb_eleves_hors_segpa_hors_ulis integer,
    nb_eleves_segpa            integer,
    nb_eleves_ulis             integer
    uai                        VARCHAR(50),
    annee_scolaire              VARCHAR(50)
);

CREATE TABLE _classe(
    id_classe                  VARCHAR(50),
);


CREATE TABLE _a_proximite(
    uai                        VARCHAR(50),
    code_quartier_prioritaire  VARCHAR(3)
);

CREATE TABLE _carac_selon_classe(
    nb_eleves_hors_segpa_hors_ulis_selon_niveau INTEGER,
    nb_eleves_hors_segpa_selon_niveau INTEGER,
    nb_eleves_ulis_selon_niveau INTEGER,
    effectif_filles            INTEGER,
    effectif_garçons           INTEGER,
    uai                        VARCHAR(50),
    annee_scolaire             VARCHAR(4),
    classe                     VARCHAR(50)
);


--contrainte carac_tout_etablissement
alter table _carac_tout_etablissement ADD CONSTRAINT uai_fk FOREIGN KEY(uai) REFERENCES _etablissement(uai);
alter table _carac_tout_etablissement ADD CONSTRAINT annee_fk FOREIGN KEY(annee_scolaire) REFERENCES _annee(annee_scolaire);

--contrainte carac_college
alter table _carac_college ADD CONSTRAINT uai_fk FOREIGN KEY(uai) REFERENCES _etablissement(uai);
alter table _carac_college ADD CONSTRAINT annee_fk FOREIGN KEY(anne_scolaire) REFERENCES _annee(annee_scolaire);

--contrainte departement
alter table _departement ADD CONSTRAINT fk_departement_region FOREIGN KEY (code_region) REFERENCES _region(code_region);

--contrainte commmune
alter table _commune ADD CONSTRAINT fk_commune_departement FOREIGN KEY (code_departement) REFERENCES _departement(code_departement);

--contrainte de etablissement
alter table _etablissement ADD CONSTRAINT fk_etablissement_commune FOREIGN KEY (code_commune) REFERENCES _commune(code_insee_de_la_commune);
alter table _etablissement ADD CONSTRAINT fk_etablissement_type FOREIGN KEY (code_nat) REFERENCES _type(code_nature);
alter table _etablissement ADD CONSTRAINT fk_etablissement_academie FOREIGN KEY (code_academie) REFERENCES _academie(code_academie);

--quartier prioritaire
alter table _a_proximite ADD CONSTRAINT uai_fk FOREIGN KEY (uai) REFERENCES _etablissement(uai);
alter table _a_proximite ADD CONSTRAINT code_quartier_fk FOREIGN KEY (code_quartier_prioritaire) REFERENCES _quartier_prioritaire(code_quartier_prioritaire);

--contrainte carac_selon_classe
alter table _carac_selon_classe ADD CONSTRAINT etablissement_fk FOREIGN KEY (uai) REFERENCES _etablissement(uai);
alter table _carac_selon_classe ADD CONSTRAINT _annee_fk FOREIGN KEY (annee_scolaire) REFERENCES _annee(annee_scolaire);
alter table _carac_selon_classe ADD CONSTRAINT _classe_fk FOREIGN KEY (classe) REFERENCES _classe(id_classe);