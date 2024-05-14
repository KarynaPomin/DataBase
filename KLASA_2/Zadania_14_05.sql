# Zbierz na wspólnejliście klientów i wykonawców. Wynik uporządkuj w kolejności malejącej. AgencjaArtstyczna
SELECT CONCAT(klienci.ImieKlienta, " ", klienci.NazwiskoKlienta) AS Personalia, 'Klient' AS Typ
FROM klienci
UNION
SELECT wykonawcy.NazwaScenicznaWykonawcy AS Personalia, 'Wykonawca' AS Typ
FROM wykonawcy
ORDER BY Personalia DESC;

# Wyszukaj wykonawców, którzy występowali dla klientów o nazwiskach Berg albo Hallmark. 
SELECT DISTINCT wykonawcy.NazwaScenicznaWykonawcy
FROM wykonawcy, klienci, imprezy
WHERE wykonawcy.IDWykonawcy = imprezy.IDWykonawcy AND imprezy.IDKlienta = klienci.IDKlienta
AND (klienci.NazwiskoKlienta LIKE "Berg" OR klienci.NazwiskoKlienta LIKE "Hallmark");

# Podaj przepisy na dania główne wraz ze wszystkimi składnikami. Otrzymane wyniki posortuj wg NazwyPrzepisu alfabetycznie. Przepisy
SELECT przepisy.NazwaPrzepisu, skladniki.NazwaSkladnika, miary.OpisMiary, skladniki_przepisow.Ilosc
FROM przepisy, skladniki_przepisow, skladniki, kategorie_przepisow, miary
WHERE przepisy.IDPrzepisu = skladniki_przepisow.IDPrzepisu 
AND skladniki_przepisow.IDSkladnika = skladniki.IDSkladnika 
AND miary.IDMiaryIlosci = skladniki_przepisow.IDMiaryIlosci
AND kategorie_przepisow.OpisKategoriiPrzepisu LIKE "dania g%"
ORDER BY przepisy.NazwaPrzepisu;
