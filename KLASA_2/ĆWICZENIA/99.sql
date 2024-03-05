99.1.
Podaj liczbę wszystkich ankietowanych dziewcząt i wszystkich ankietowanych chłopców.

SELECT 
	(SELECT COUNT(ankiety.Plec) FROM ankiety WHERE Plec = 'k') AS dziwczyny, 
	(SELECT COUNT(ankiety.Plec) FROM ankiety WHERE Plec = 'm') as chlopcy;

99.2.
Dla każdego rodzaju szkoły podaj średnią ocenę odpowiedzi na każde pytanie. Wyniki 
  podaj w zaokrągleniu do dwóch miejsc po przecinku.

SELECT szkoly.Rodzaj_szkoly, ROUND(AVG(ankiety.pyt1), 2) as p1, ROUND(AVG(ankiety.pyt2), 2) as p2, 
      ROUND(AVG(ankiety.pyt3), 2) as p3, ROUND(AVG(ankiety.pyt4), 2) as p4,
      ROUND(AVG(ankiety.pyt5), 2) as p5, ROUND(AVG(ankiety.pyt6), 2) as p6
FROM szkoly, ankiety
WHERE szkoly.Id_szkoly = ankiety.Id_szkoly
GROUP BY szkoly.Rodzaj_szkoly;

99.3.
Dla każdej gminy wyznacz średnią ocenę uczniów, z jej terenu podaną w odpowiedzi na ostatnie (szóste) pytanie.
Wyniki umieść w zestawieniu zawierającym dwie kolumny: kod gminy, średnią ocenę uczniów. Zestawienie uporządkuj 
malejąco ze względu na średnią oce-nę. Średnie podaj w zaokrągleniu do dwóch miejsc po przecinku.

SELECT gminy.Kod_gminy, ROUND(AVG(ankiety.pyt6), 2) as SrPyt6
FROM gminy, ankiety, szkoly
WHERE szkoly.Id_szkoly = ankiety.Id_szkoly
	AND szkoly.Kod_gminy = gminy.Kod_gminy
GROUP BY gminy.Kod_gminy
ORDER BY SrPyt6 desc;

99.4.
Utwórz zestawienie zawierające dla każdego rodzaju szkoły informacje o liczbie uczniów, którzy podali ocenę 5 na 
pytanie trzecie. Zestawienie posortuj alfabetycznie według rodzaju szkoły.

SELECT szkoly.Rodzaj_szkoly, COUNT(ankiety.pyt3) Ile5NaPyt3
FROM szkoly, ankiety
WHERE szkoly.Id_szkoly = ankiety.Id_szkoly
	AND ankiety.pyt3 = 5
GROUP BY szkoly.Rodzaj_szkoly;

99.5.
Podaj nazwę gminy z największą liczbą uczniów biorących udział w badaniu oraz liczbę tych uczniów.

SELECT gminy.Nazwa_gminy, COUNT(ankiety.Nr_ankiety) AS IleAnkiet
FROM gminy, ankiety, szkoly
WHERE gminy.Kod_gminy = szkoly.Kod_gminy
	AND szkoly.Id_szkoly = ankiety.Id_szkoly
GROUP BY gminy.Kod_gminy
ORDER BY IleAnkiet DESC
LIMIT 1;

99.6.
Utwórz zestawienie zawierające informacje o liczbie dziewcząt i chłopców (osobno) z poszczególnych rodzajów szkół,
którzy podali najwyższą ocenę 5 na pytanie 1.

SELECT szkoly.Rodzaj_szkoly, 
	SUM(CASE WHEN ankiety.Plec = 'k' THEN 1 ELSE 0 END) AS Dziewczynki,
    SUM(CASE WHEN ankiety.Plec = 'm' THEN 1 ELSE 0 END) AS Chlopcy
FROM szkoly, ankiety
WHERE szkoly.Id_szkoly = ankiety.Id_szkoly
	AND ankiety.pyt1 = 5
GROUP BY szkoly.Rodzaj_szkoly;
