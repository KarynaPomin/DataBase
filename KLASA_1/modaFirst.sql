#DROP DATABASE IF EXISTS moda;

USE moda;

DROP DATABASE IF EXISTS SalonMody;

CREATE DATABASE SalonMody;

USE SalonMody;

CREATE TABLE stroje (
    idStroju INT PRIMARY KEY AUTO_INCREMENT,
    nazwaStroju VARCHAR(255),
    dataUtworzenia DATE,
    dataWaznosci DATE,
    firma VARCHAR(255),
    wlasciciel VARCHAR(255)
);

CREATE TABLE materialy (
    idMaterialu INT PRIMARY KEY AUTO_INCREMENT,
    nazwaMaterialu VARCHAR(255),
    kategoria VARCHAR(100),
    kolor VARCHAR(100),
    rozmiar VARCHAR(1)
);

CREATE TABLE kreacja (
    idKreacji INT PRIMARY KEY AUTO_INCREMENT,
    idStroju INT,
    idMaterialu INT,
    FOREIGN KEY (idStroju) REFERENCES stroje(idStroju),
    FOREIGN KEY (idMaterialu) REFERENCES materialy(idMaterialu),
    dataUtworzenia DATE
);

INSERT INTO stroje VALUES(null, "Wieczorowy", "2023-11-20", "2023-12-20", "TE19", "Bartosz");
INSERT INTO stroje VALUES(null, "Skejtpark", "2023-11-20", "2023-12-24", "Skejtpart", "Wojtek");
