
USE moda;

DROP TABLE IF EXISTS Kreacja;
DROP TABLE IF EXISTS Element;
DROP TABLE IF EXISTS Stroj;


CREATE TABLE Stroj (
    idStroj INT PRIMARY KEY AUTO_INCREMENT,
    nazwaStroju VARCHAR(255),
    dataUtworzenia DATE,
    dataWaznosci DATE,
    firma VARCHAR(255),
    wlasciciel VARCHAR(255)
);


CREATE TABLE Element (
    idElement INT PRIMARY KEY AUTO_INCREMENT,
    nazwaElementu VARCHAR(255),
    kategoria VARCHAR(100),
    kolor VARCHAR(100),
    rozmiar VARCHAR(5)
);



CREATE TABLE Kreacja (
    idKreacja INT PRIMARY KEY AUTO_INCREMENT,
    idStroj INT ,
    idElement INT,
    #FOREIGN KEY (idStroj) REFERENCES Stroj(idStroj),
    FOREIGN KEY (idElement) REFERENCES Element(idElement),
    dataUtworzenia DATE
);


INSERT INTO Stroj VALUES (1, "Wieczorowy", "2023-11-20", "2023-12-20", "TE19", "Bartosz");
INSERT INTO Stroj VALUES (2, "Skejtowy", "2023-11-19", "2023-12-24", "Skejpark", "Wojtek");
INSERT INTO Stroj VALUES (3, "Kazualowy", "2023-11-20", "2023-12-20", "TE19", "Bartosz");
INSERT INTO Stroj VALUES (4, "Moderny", "2023-11-19", "2023-12-24", "Skejpark", "Wojtek");

INSERT INTO Element VALUES (NULL, "Czapka", "góra", "czarny", "L");
INSERT INTO Element VALUES (NULL, "Beret", "góra", "biały", "M");
INSERT INTO Element VALUES (NULL, "Koszulka", "środek", "żółty", "M");
INSERT INTO Element VALUES (NULL, "Koszula", "środek", "niebieski", "S");
INSERT INTO Element VALUES (NULL, "Bluza", "środek", "zielony", "XL");
INSERT INTO Element VALUES (NULL, "Kurtka", "środek", "czarny", "XL");
INSERT INTO Element VALUES (NULL, "Spodnie", "dół", "czerwony", "S");
INSERT INTO Element VALUES (NULL, "Rajtuzy", "dół", "czerwony", "M");
INSERT INTO Element VALUES (NULL, "Kalesony", "dół", "czarny", "S");
INSERT INTO Element VALUES (NULL, "Skarpety", "dół", "srebrny", "S");
INSERT INTO Element VALUES (NULL, "Kolanówki", "dół", "tęczowy", "L");
INSERT INTO Element VALUES (NULL, "Buty", "dół", "czarny", "XL");

INSERT INTO Kreacja VALUES (1, 1, 2, "2023-11-20");
INSERT INTO Kreacja VALUES (2, 1, 5, "2023-11-20");
INSERT INTO Kreacja VALUES (3, 1, 6, "2023-11-20");
INSERT INTO Kreacja VALUES (4, 1, 12, "2023-11-20");
INSERT INTO Kreacja VALUES (5, 2, 4, "2023-11-21");
INSERT INTO Kreacja VALUES (6, 2, 6, "2023-11-21");
INSERT INTO Kreacja VALUES (7, 5, 10, "2023-11-21");
