// 1.

SELECT gatunki.ID_gatunku, gatunki.Nazwa_zwyczajowa
CASE 
    WHEN id_gatunku < 30 THEN 'małe ID'
    WHEN id_gatunku > 30 THEN 'duże ID'
    ELSE 'ID równe 30'
AND AS 'wielkość'
FROM Gatunki

// 2.

SELECT kol1, kol2, kol3 
FROM gatunki
