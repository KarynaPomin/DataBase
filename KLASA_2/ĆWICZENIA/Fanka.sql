###############
### ZADANIE 1
# a) Podaj, ile T-towarzyskich, ile Ligowych oraz ile Pucharowych meczów rozegrała drużyna 
	# Galop Kucykowo z drużynami ze swego miasta.
# b) W którym roku drużyna Galop Kucykowo rozegrała najwięcej meczów z drużynami ze 
	# swego miasta (łącznie wszystkie rodzaje meczów)? Podaj rok i liczbę tych meczów.
Odp: a) T 6, L 113, P 25 b) 2007r, 21

# A.

SELECT wyniki.rodzaj_meczu, COUNT(*) AS 'IleGrali'
FROM wyniki, druzyny
WHERE wyniki.id_druzyny=druzyny.id_druzyny
	AND druzyny.miasto LIKE '%Kucykow%'
GROUP BY wyniki.rodzaj_meczu

# B.

SELECT YEAR(wyniki.data_meczu) AS Rok, COUNT(*) AS IleMeczow
FROM druzyny, wyniki
WHERE wyniki.id_druzyny=druzyny.id_druzyny
	AND druzyny.miasto LIKE '%Kucykow%'
GROUP BY Rok
ORDER BY IleMeczow DESC
LIMIT 1

###############
### ZADANIE 2
# Podaj listę zawierającą nazwy drużyn, z którymi drużyna Galop Kucykowo ma zerowy bilans bramkowy, 
# tzn. łączna liczba bramek zdobytych we wszystkich meczach rozegranych z daną drużyną jest równa łącznej liczbie bramek straconych w tych meczach.
Odp:Zwinne Mewy, Nocne Pumy

SELECT druzyny.nazwa, SUM(wyniki.bramki_zdobyte), SUM(wyniki.bramki_stracone)
FROM druzyny, wyniki
WHERE druzyny.id_druzyny=wyniki.id_druzyny
GROUP BY druzyny.nazwa
HAVING SUM(wyniki.bramki_zdobyte) = SUM(wyniki.bramki_stracone)

###############
### ZADANIE 3
# Podaj liczby meczów wyjazdowych – Wygranych, Przegranych i Zremisowanych – przez drużynę Galop Kucykowo.
Odp: P 452 Z 170 W 579

SELECT 
	(SELECT COUNT(*) FROM wyniki 
		WHERE wyniki.bramki_zdobyte>wyniki.bramki_stracone
		AND wyniki.gdzie LIKE 'W') 
		as wygrane, 
	(SELECT COUNT(*) FROM wyniki 
		WHERE wyniki.bramki_zdobyte<wyniki.bramki_stracone
		AND wyniki.gdzie LIKE 'W')
		as przegrane, 
	(SELECT COUNT(*) FROM wyniki 
		WHERE wyniki.bramki_zdobyte=wyniki.bramki_stracone
		AND wyniki.gdzie LIKE 'W') 
		as zremisowamie

###############
### ZADANIE 4
# Podaj, ilu sędziów spośród tych zapisanych w pliku sedziowie.txt nie sędziowało żadnego pucharowego meczu drużyny Galop Kucykowo.
Odp: 22

SELECT COUNT(*)
FROM sedziowie
WHERE nr_licencji NOT IN 
(
	SELECT DISTINCT nr_licencji 
	FROM wyniki
	WHERE rodzaj_meczu LIKE 'P'
)
