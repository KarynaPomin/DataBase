-- Wymień składniki nieużywane dotąd w żadnym przepisie -- Baza danych: PrzepisyPrzyklad)

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

-- Wyświetl agentów, którzy do tych czas nie podpisali kontrakru z żadnym wykonawcą (nie maja żadnej imprezy) -- BAZA DANYCH: AgencjaArtystycznaPrzyklad


