CREATE TABLE DANE_PERSONALNE(
    id_ucznia INT PRIMARY KEY AUTO_INCREMENT,
	  imie VARCHAR(30),
    nazwisko VARCHAR(30),
    miasto_urodzenia VARCHAR(30),
    data_urodzenia DATE,
    kod_pocztowy VARCHAR(7),
    miasto VARCHAR(30),
    ulica VARCHAR(60),
    numer_domu INT,
    numer_pesel_ucznia INT(11),
    numer_telefonu_ucznia INT(9),
    imiona_rodzicow_ucznia_matki VARCHAR(30),
    imiona_rodzicow_ucznia_ojca VARCHAR(30),
    numer_telefonu_rodzica VARCHAR(9),
    id_klasy INT
);

CREATE TABLE KLASY(
    id_klasy INT PRIMARY KEY AUTO_INCREMENT,
    nazwa_klasy VARCHAR(5),
    id_wychowawcy INT
);

CREATE TABLE NAUCZYCIELE(
    id_nauczyciela INT PRIMARY KEY AUTO_INCREMENT,
    imie_nauczyciela VARCHAR(30),
    nazwisko_nauczyciela VARCHAR(30),
    numer_pesel_nauczyciela INT(11)
);

ALTER TABLE dane_personalne
ADD FOREIGN KEY (id_klasy) REFERENCES klasy(id_klasy);

ALTER TABLE klasy
ADD FOREIGN KEY (id_wychowawcy) REFERENCES nauczyciele(id_nauczyciela);

INSERT INTO dane_personalne VALUES(1, "Lina", "Khohun", "Toruń", "2000-03-11", "64-500", "Oświęcin", "Polna", 8, 79384100009, 502501503, "Maria", "Jan", 602601603, Null);
INSERT INTO dane_personalne VALUES(2, "Stanisław", "Bonaparte", "Paryż", "2000-03-12", "64-501", "Oświęcin", "Polna", 8, 79384106609, 502501503, "Lida", "Karol", 602601603, Null);
INSERT INTO dane_personalne VALUES(3, "Aleksander", "Pośpieszny", "Hell", "2000-03-11", "64-666", "Konin", "Żan", 8, 79344106669, 502501503, "Aleksandra", "Malt", 602601603, Null);

INSERT INTO klasy VALUES(1, "1BAD", null);
INSERT INTO klasy VALUES(2, "2ADD", null);
INSERT INTO klasy VALUES(3, "2CD", null);

INSERT INTO nauczyciele VALUES(1, "Marcelina", "Kowalska", 7952473011);
INSERT INTO nauczyciele VALUES(2, "Anna", "Kuszczyńska", 7952473022);
INSERT INTO nauczyciele VALUES(3, "Dann", "Libero", 7952473666);
