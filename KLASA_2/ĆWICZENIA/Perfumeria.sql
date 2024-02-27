
### ZADANIE 1
# Podaj listę wszystkich nazw perfum, których jednym ze składników jest „absolut jasminu”.
# Odp:: Ologne Doud, Oyal Priather, Uelques FleuE

SELECT nazwa_p 
FROM perfumy, sklad
WHERE perfumy.id_perfum=sklad.id_perfum
	AND nazwa_skladnika LIKE "%absolut jasminu%"

	
### ZADANIE 2
# Podaj listę różnych rodzin zapachów. Dla każdej rodziny podaj jej nazwę,
# cenę najtańszych perfum z tej rodziny i ich nazwę.
# odp:
# aromatyczna	Ibrary Ollec Damore 	124
# cytrusowa	Sian Grad	259
# cytrusowo-aromatyczna	Re Nostrum,ir	178
# drzewna	Pperlee Bouquet	123
# kwiatowa	Ose Deurmaline	110
# kwiatowo-drzewna	Rougna	104
# kwiatowo-orientalna	Arla : Vivace	103
# kwiatowo-szyprowa	Etish Pothal	287
# orientalna	Anille La Tosca	113
# orientalna lagodna	Ndy Warhol S Rose	122
# orientalno-drzewna	LackNight	138
# owocowa	Ake Perfucturne 	154
# pudrowa	Ivm Cristal	139
# skorzana	Ui Mare	112
# szyprowa	Usk ti 1888	226
# szyprowo-skorzana	Uir OtPlace	158
# wodna	Ilver Mounaya 	146
# zielona	EOman	406

SELECT nazwa_p, rodzina_zapachow, cena
FROM perfumy,
	(SELECT rodzina_zapachow AS Rdz_zap, MIN(cena) AS Cena_Min
	FROM perfumy
	GROUP BY rodzina_zapachow) AS tp
WHERE rodzina_zapachow=Rdz_zap AND cena=Cena_Min
ORDER BY rodzina_zapachow

	
### ZADANIE 3
# Utwórz uporządkowaną alfabetycznie listę wszystkich nazw marek, 
# które nie zawierają w swoich perfumach żadnego składnika mającego
# w nazwie słowo „paczula”.
# odp: Aison Eranciro, Arthbey, Embert Lucas, Enmith, Nnick a Kieffo

SELECT nazwa_m FROM marki
WHERE id_marki NOT IN (SELECT marki.id_marki FROM marki, perfumy, sklad
								WHERE marki.id_marki = perfumy.id_marki AND perfumy.id_perfum = sklad.id_perfum
								AND nazwa_skladnika LIKE '%paczula%')
ORDER BY nazwa_m


### ZADANIE 4
# Ceny wszystkich perfum marki Mou De Rosine z rodziny o nazwie „orientalno-drzewna” zostały obniżone o 15%.
# Podaj listę zawierającą wszystkie nazwy takich perfum i ich ceny po obniżce.
# Listę posortuj niemalejąco według ceny.
#odp:
#Ourn Boise	141,95
#Onou Back	222,7
#Pic An	230,35
#Nterl Bambola	292,4
#Ubilatio Champs	381,65
#Ibrary Ollec Dor	489,6
#Ate An	544,85
#Elov & Musc	660,45

SELECT nazwa_p, (cena*0.85) AS cena_obnizka
FROM marki, perfumy
WHERE marki.id_marki = perfumy.id_marki
	AND rodzina_zapachow = 'orientalno-drzewna'
	AND nazwa_m = 'Mou De Rosine'
ORDER BY cena_obnizka



