-- 1.) Wymień składniki nieużywane dotąd w żadnym przepisie. -- BAZA DANYCH: PrzepisyPrzyklad)

-- SPOSÓB I
SELECT skladniki.NazwaSkladnika
FROM skladniki 
WHERE skladniki.IDSkladnika NOT IN (SELECT skladniki_przepisow.IDSkladnika FROM skladniki_przepisow);

-- SPOSÓB II
SELECT skladniki.NazwaSkladnika
FROM skladniki 
LEFT OUTER JOIN skladniki_przepisow
ON skladniki.IDSkladnika=skladniki_przepisow.IDSkladnika
WHERE skladniki_przepisow.IDPrzepisu IS NULL;

-- 2.) Wyświetl agentów, którzy do tych czas nie podpisali kontrakru z żadnym wykonawcą (nie maja żadnej imprezy). -- BAZA DANYCH: AgencjaArtystycznaPrzyklad
SELECT agenci.ImieAgenta, agenci.NazwiskoAgenta FROM agenci
WHERE agenci.IDAgenta NOT IN (SELECT imprezy.IDAgenta FROM imprezy)

-- 3.) Wyświetl wszystkich klientów agencji i datę ostatniej rezerwacji każdego z nich. -- BAZA DANYCH: AgencjaArtystycznaPrzyklad
SELECT CONCAT(klienci.ImieKlienta, " ",klienci.NazwiskoKlienta) AS Klient,
  (SELECT MAX(imprezy.DzienRozpoczecia) AS DzienRozpoczecia
  FROM imprezy
  WHERE klienci.IDKlienta=imprezy.IDKlienta ) as OstRez
from klienci


