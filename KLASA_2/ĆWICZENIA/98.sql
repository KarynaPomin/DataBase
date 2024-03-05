98.1.
Imiona dziewcząt w zestawieniu kończą się na literę „a”. Podaj klasy, w których ponad 50%
wszystkich uczniów to dziewczęta.

SELECT uczniowie.Klasa
FROM uczniowie
GROUP BY Klasa
HAVING SUM(CASE WHEN Imie LIKE '%a' THEN 1 ELSE 0 END) > COUNT(*) / 2


98.2.
Podaj daty, kiedy w szkole wystawiono więcej niż 10 jedynek jednego dnia.
  
SELECT oceny.Data, COUNT(oceny.ocena)
FROM oceny
WHERE oceny.Ocena = 1
GROUP BY oceny.Data
HAVING COUNT(oceny.Ocena) > 10;


98.3.
Podaj, z dokładnością do dwóch miejsc po przecinku, średnie ocen z języka polskiego dla każdej klasy czwartej.
  
SELECT uczniowie.Klasa, ROUND(AVG(oceny.Ocena), 2) as SrediaPol
FROM uczniowie, oceny, przedmioty
WHERE uczniowie.Id_ucznia = oceny.Id_ucznia
	AND przedmioty.Id_przedmiotu = oceny.Id_przedmiotu
	AND uczniowie.Klasa LIKE "IV%"
    AND przedmioty.Nazwa_przedmiotu LIKE '%polski%'
GROUP BY uczniowie.Klasa;

98.4.
Podaj zestawienie zawierające dla każdego przedmiotu liczbę piątek wystawionych w kolej-nych miesiącach od września do grudnia łącznie we wszystkich klasach.

SELECT przedmioty.Nazwa_przedmiotu, MONTH(oceny.Data) AS miesiac, COUNT(oceny.Ocena) as ileOcen
FROM przedmioty, oceny
WHERE przedmioty.Id_przedmiotu = oceny.Id_przedmiotu
	AND oceny.Ocena = 5
    AND MONTH(oceny.Data) BETWEEN 9 AND 12
GROUP BY przedmioty.Nazwa_przedmiotu, MONTH(oceny.Data);

98.5.
Podaj zestawienie imion i nazwisk uczniów klasy II A, którzy nie otrzymali żadnej oceny z przedmiotu sieci komputerowe.

SELECT uczniowie.Imie, uczniowie.Nazwisko
FROM uczniowie
WHERE uczniowie.Klasa = "II A"
AND uczniowie.Id_ucznia NOT IN (SELECT oceny.Id_ucznia 
                                FROM oceny, przedmioty 
                                WHERE oceny.Id_przedmiotu = przedmioty.Id_przedmiotu 
                                	AND przedmioty.Nazwa_przedmiotu = 'sieci komputerowe');
