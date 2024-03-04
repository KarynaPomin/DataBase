### ZADANIE 1
# Utwórz zestawienie, które dla każdej rodziny językowej podaje, 
# ile języków do niej należy.
# Posortuj zestawienie nierosnąco według liczby języków.
Odp::
nigero-kongijska 137
austronezyjska 65
indoeuropejska 63
sino-tybetanska 43
nilo-saharyjska 30
...
keczua 1
tupi 1


SELECT jezyki.Rodzina, COUNT(jezyki.Jezyk) AS IleJez
FROM jezyki
GROUP BY jezyki.Rodzina
ORDER BY IleJez DESC


### ZADANIE 2
# Podaj liczbę języków, które nie są językami urzędowymi w żadnym państwie. 
# Przy rozwiązywaniu zadania pamiętaj, że w jednym państwie może być kilka języków 
# urzędowych oraz że dany język może być językiem urzędowym w jednym państwie, 
# a w innym – nie.
odp:445

SELECT COUNT(jezyki.Jezyk) AS IleNieUz
FROM jezyki
WHERE jezyki.Jezyk NOT IN (SELECT uzytkownicy.jezyk FROM uzytkownicy WHERE uzytkownicy.Urzedowy = "tak")


### ZADANIE 3
# Podaj wszystkie języki, którymi posługują się użytkownicy na co najmniej czterech kontynentach.
# Uwaga: dla uproszczenia przyjmujemy, 
# że państwo leży na tym kontynencie, na którym znajduje się jego stolica.
odp: angielski, arabski, gudzaracki, tamilski

SELECT uzytkownicy.Jezyk, COUNT(distinct panstwa.Kontynent) AS IleKont
FROM uzytkownicy 
INNER JOIN panstwa 
ON uzytkownicy.Panstwo = panstwa.Panstwo
GROUP BY uzytkownicy.Jezyk 
HAVING IleKont >= 4


### ZADANIE 4
# Znajdź 6 języków, którymi posługuje się łącznie najwięcej mieszkańców
# obu Ameryk („Ameryka Polnocna” i „Ameryka Poludniowa”), 
# a które nie należą do rodziny indoeuropejskiej („indoeuropejska”). 
# Dla każdego z nich podaj nazwę, rodzinę językową i liczbę użytkowników 
# w obu Amerykach łącznie.
odp:
mandarynski sino-tybetanska 3,1
arabski afroazjatycka 2,7
tagalog austronezyjska 1,9
wietnamski austroazjatycka 1,5
nahuatl uto-aztecka 1,4
koreanski jezyk izolowany 1,2

SELECT uzytkownicy.Jezyk, jezyki.Rodzina, SUM(Uzytkownicy)
FROM uzytkownicy, panstwa, jezyki
WHERE uzytkownicy.Panstwo = panstwa.Panstwo
	AND uzytkownicy.Jezyk = jezyki.Jezyk
	AND (panstwa.Kontynent LIKE "Ameryka Polnocna" 
	OR panstwa.Kontynent LIKE "Ameryka Poludniowa")
	AND jezyki.Rodzina NOT LIKE 'indoeuropejska'
GROUP BY uzytkownicy.Jezyk
HAVING COUNT(panstwa.Panstwo) 
ORDER BY SUM(Uzytkownicy)  DESC 
LIMIT 6


### ZADANIE 5
# Znajdź państwa, w których co najmniej 30% populacji posługuje się językiem, 
# który nie jest językiem urzędowym obowiązującym w tym państwie. 
# Dla każdego takiego państwa podaj jego nazwę i język, 
# którym posługuje się co najmniej 30% populacji, a który nie jest urzędowym 
# językiem w tym państwie, oraz procent populacji posługującej się tym językiem.
odp:
Etiopia 35,51 oromo
Indonezja 32,73 jawajski
Pakistan 40,44 pendzabski

SELECT panstwa.Panstwo, jezyki.Jezyk, ROUND(uzytkownicy.Uzytkownicy / panstwa.Populacja, 3) * 100 AS ProcentPopupalcji
FROM panstwa, jezyki, uzytkownicy
WHERE uzytkownicy.Panstwo = panstwa.Panstwo
	AND uzytkownicy.Jezyk = jezyki.Jezyk
	AND uzytkownicy.Urzedowy = 'nie'
	AND (panstwa.Populacja * 0.3) <= uzytkownicy.Uzytkownicy
