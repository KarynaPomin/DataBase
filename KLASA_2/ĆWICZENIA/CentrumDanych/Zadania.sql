# SELECT *, DATE_FORMAT(naprawy.czas_naprawy, "%d") AS days FROM naprawy #TimeStamp

###############
### ZADANIE 1
# Znajdź 10 najczęstszych rodzajów dysków (czyli 10 najczęściej występujących pojemności) wśród komputerów w centrum. 
# Dla każdej ze znalezionych pojemności podaj liczbę komputerów z takim dyskiem. 
# Posortuj zestawienie nierosnąco względem liczby komputerów z dyskiem o danej pojemności.

SELECT pojemnosc_dysku, COUNT(pojemnosc_dysku) AS Pojemnosci
FROM komputery 
GROUP BY pojemnosc_dysku
ORDER BY Pojemnosci DESC 
LIMIT 10

###############
### ZADANIE 2
# Znajdź wszystkie komputery w sekcji A, w których trzeba było przynajmniej dziesięciokrotnie wymieniać podzespoły. 
# Podaj ich numery, a także liczbę wymian podzespołów dla każdego z nich.

SELECT komputery.numer_komputera, COUNT(*) 
FROM komputery, awarie, naprawy
WHERE komputery.numer_komputera=awarie.numer_komputera AND awarie.numer_zgloszenia=naprawy.numer_zgloszenia
AND komputery.sekcja='A' AND naprawy.rodzaj LIKE 'wymiana%'
GROUP BY komputery.numer_komputera
HAVING COUNT(*) >= 10





 

