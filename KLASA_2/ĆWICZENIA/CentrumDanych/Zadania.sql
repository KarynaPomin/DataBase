# SELECT *, DATE_FORMAT(naprawy.czas_naprawy, "%d") AS days FROM naprawy #TimeStamp
# SELECT DISTINCT --> pomija dublikaty

 
###############
### ZADANIE 1
# Znajdź 10 najczęstszych rodzajów dysków (czyli 10 najczęściej występujących pojemności) wśród komputerów w centrum. 
# Dla każdej ze znalezionych pojemności podaj liczbę komputerów z takim dyskiem. 
# Posortuj zestawienie nierosnąco względem liczby komputerów z dyskiem o danej pojemności.
Odp:: 
Pojemność Liczba
300 173
200 31
500 31
800 29
700 28
600 26
400 20
290 11
220 10
160 10

SELECT pojemnosc_dysku, COUNT(pojemnosc_dysku) AS Pojemnosci
FROM komputery 
GROUP BY pojemnosc_dysku
ORDER BY Pojemnosci DESC 
LIMIT 10

###############
### ZADANIE 2
# Znajdź wszystkie komputery w sekcji A, w których trzeba było przynajmniej dziesięciokrotnie wymieniać podzespoły. 
# Podaj ich numery, a także liczbę wymian podzespołów dla każdego z nich.
odp:
Komputer Liczba wymian podzespołów
Komputer 202 12
Komputer 123 11
Komputer 171 12
Komputer 42 11

SELECT komputery.numer_komputera, COUNT(*) 
FROM komputery, awarie, naprawy
WHERE komputery.numer_komputera=awarie.numer_komputera AND awarie.numer_zgloszenia=naprawy.numer_zgloszenia
AND komputery.sekcja='A' AND naprawy.rodzaj LIKE 'wymiana%'
GROUP BY komputery.numer_komputera
HAVING COUNT(*) >= 10

###############
### ZADANIE 3
# Pewnego dnia nastąpiła awaria wszystkich komputerów w jednej z sekcji. 
# Podaj datę awarii oraz symbol sekcji, w której nastąpiła awaria.
odp: 23-12-2015, sekcja Q

SELECT DATE_FORMAT(awarie.czas_awarii, '%d-%m-%Y') AS Data, komputery.sekcja
FROM komputery, awarie
WHERE komputery.numer_komputera=awarie.numer_komputera
AND DATE_FORMAT(awarie.czas_awarii, '%d-%m-%Y') = (SELECT DATE_FORMAT(awarie.czas_awarii, '%d-%m-%Y') AS AllAw
									FROM awarie GROUP BY AllAw ORDER BY COUNT(*) desc LIMIT 1)
GROUP BY komputery.sekcja
ORDER BY COUNT(*) DESC
LIMIT 1



 

