-- Zwiększ cenę książek o 10%
-- ROUND(co_zaokrąglone, do_ilu_miejsc)
    UPDATE ksiazki SET cena = ROUND(cena*1.1, 2)

-- Zmniejsz cenę największe ceny książki o 10zl.
    UPDATE ksiazki SET cena = cena - 10 ORDER BY cena DESC LIMIT 1

-- Zmień imię i nazwisko klientki Anny Kareniny
    UPDATE klienci SET imie="Anna", nazwisko="Postojewska" WHERE idklienta="10"

-- ...
  -- SP. 1
    UPDATE zamowienia SET status="wyslano" WHERE idzamowienia BETWEEN 4 AND 5
  -- SP. 2
    UPDATE zamowienia SET status="wyslano" WHERE idzamowienia >= 4 AND idzamowienia <= 5

-- INSERT --> wstawianie do nowej bazy dannych
-- Dodaj nowego klienta do bazy:
    INSERT INTO klienci VALUES(NULL, "Franciszek", "Janowski", "Chorzów")
  
-- ...
    INSERT INTO zamowienia (idzamowienia, data, status, idklienta, idksiazki) VALUES(NULL, "2016-01-01", "oczekiwanie", 7, 3)

-- Wstaw do tabeli książkę Grębosza "Symfonia C++"
    INSERT INTO ksiazki(idksiazki, nazwiskoautora, tytul) VALUES(NULL, "Grębosz", "Symfonia C++")

-- Dodaj 2 klientów za pomocą jednego zapytania
    INSERT INTO klienci VALUES(NULL, "Marilyn", "Monroe", "Los Angeles"), (NULL, "imie", "Nazwisko", "Miasto")

-- Dodaj klienta
    INSERT INTO klienci SET idklienta=NULL, imie="Steve", nazwisko="McQueen", miejscowosc="Los Angeles"

-- ZADANIA
-- ZNAJDŹ W BAZIE:
-- 1. Książki ułożone alfabetycznie wg tytułu.
    SELECT tytul FROM ksiazki ORDER BY tytul
-- 2. Najdroższą książkę w bazie.
    SELECT tytul, cena FROM ksiazki ORDER BY cena DESC LIMIT 1
-- 3. Wszystnie wysłane zamowienia.
    SELECT * FROM zamowienia WHERE zamowienia.status = "wyslano"
-- 4. Wszystkich klientow o nazwisku Rutkowski.
    SELECT imie, nazwisko FROM klienci WHERE klienci.nazwisko = "Rutkowski"
-- 5. Książki zawierające 
    SELECT tytul FROM ksiazki WHERE ksiazki.tytul LIKE "%PHP%"
-- 6. 
    SELECT * FROM zamowienia ORDER BY zamowienia.data DESC
-- 7. 
    SELECT nazwisko, imie, idzamowienia, data FROM zamowienia, klienci WHERE zamowienia.idklienta = klienci.idklienta
-- 7a.
    SELECT nazwisko AS "Nazwisko", imie AS "Imię", idzamowienia AS "ID zamówienia", data AS "Data zamówienia" FROM zamowienia, klienci WHERE zamowienia.idklienta = klienci.idklienta
-- 8.
    SELECT imie, nazwisko FROM klienci, zamowienia WHERE klienci.idklienta = zamowienia.idklienta AND idksiazki = 2
-- 9. 
    SELECT tytul, nazwiskoautora FROM zamowienia, klienci, ksiazki WHERE zamowienia.idklienta = klienci.idklienta AND zamowienia.idksiazki = ksiazki.idksiazki AND klienci.imie = "Jan" AND klienci.nazwisko = "Nowak"
-- 10.
    SELECT nazwisko, imie, idzamowienia, data, status, tytul FROM zamowienia, klienci, ksiazki WHERE zamowienia.idklienta = klienci.idklienta AND zamowienia.idksiazki = ksiazki.idksiazki AND klienci.nazwisko LIKE "Rutkowski" ORDER BY data






