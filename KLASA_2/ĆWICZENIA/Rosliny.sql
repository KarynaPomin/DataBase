# 1. Wypisz wszystkie miasta z tabeli osoby.
  SELECT DISTINCT osoby.Miasto 
  FROM osoby;

# 2. Wypisz numery zamówień, które dotyczą klientów z Jeleniej Góry
  SELECT zamowienia.Lp
  FROM zamowienia
	  INNER JOIN osoby ON zamowienia.Id_klienta = osoby.Id_klienta
  WHERE osoby.Miasto = "Jelenia Góra";

# 3. Wyszukaj pozycje zamówień, które dotyczą więcej niż 10 sadzonek roślin o kwiatach w kolorze bialo-liliowe.
  SELECT zamowienia.Lp
  FROM zamowienia
	  INNER JOIN rosliny ON zamowienia.Id_rosliny = rosliny.Id_rosliny
  WHERE zamowienia.Liczba_sadzonek > 10
	  AND rosliny.Kolor_kwiatow = "bialo-liliowe";

# 4. Podaj nazwy roślin, które nie zostały uwzględnione w żadnym zamówieniu.
  SELECT rosliny.Nazwa 
  FROM rosliny
  WHERE rosliny.Id_rosliny NOT IN (SELECT zamowienia.Id_rosliny 
                                  FROM zamowienia);

# 5. Podaj trzy najbardziej popularne kolory roślin.
  SELECT rosliny.Kolor_kwiatow, COUNT(*) AS Ile
  FROM rosliny
  GROUP BY rosliny.Kolor_kwiatow
  ORDER BY Ile DESC
  LIMIT 3;

# 6. Oblicz sumę objętości wszystkich doniczek roślin w cenie do 5 zł włącznie.
  SELECT SUM(rosliny.Rozmiary_doniczki) AS ObjetoscDoniczek
  FROM rosliny
  WHERE rosliny.Rozmiary_doniczki >= 5;

# 7. Podaj 3 najpopularniejsze imiona osób.
  SELECT osoby.Imie
  FROM osoby
  GROUP BY osoby.Imie
  HAVING COUNT(*)
  ORDER BY COUNT(*) DESC
  LIMIT 3;

# 8. Wypisz unikalne imiona, czyli takie, które występuja na liście dokładnie 1 raz.
  SELECT osoby.Imie
  FROM osoby
  GROUP BY osoby.Imie
  HAVING COUNT(*) 
	  AND COUNT(*) = 1
  ORDER BY COUNT(*);


9. Utwórz zestawienie, w którym podasz liczbę pozycji złożonych przez osoby z poszczególnych miast zamówień 
na rośliny kwitnące dokładnie w okresie VII–VIII.
  SELECT osoby.Miasto, COUNT(zamowienia.Id_klienta) AS LiczbaPozycji
  FROM zamowienia
	  INNER JOIN rosliny ON zamowienia.Id_rosliny = rosliny.Id_rosliny
    INNER JOIN osoby ON zamowienia.Id_klienta = osoby.Id_klienta
  WHERE rosliny.Okres_kwitnienia = "VII" OR rosliny.Okres_kwitnienia = "VIII"
  GROUP BY osoby.Miasto;

# 10. Na zakończenie dnia sklep przygotowywał dla każdego klienta specyfikację zamówionego 
# w ciągu całego dnia towaru i na tej podstawie sporządzał fakturę, która była dołączana do 
# wysyłki (kumulowanie zakupów od jednego klienta zmniejsza liczbę przesyłek kurierskich). 
# To oznacza, że na jednej fakturze były umieszczane pozycje z zamówień złożonych tego samego dnia. 
# Wartość faktury to suma wartości zakupionych towarów.
# oblicz, ile faktur wystawił sklep ogrodniczy, oraz podaj najwyższą wartość wystawionej faktury. 
# Podaj też, ilu klientom wystawiono więcej niż jedną fakturę.

# Wartośc największej faktóry
  SELECT zamowienia.Data, SUM(rosliny.Cena) AS WartoscFaktury
  FROM rosliny
	  INNER JOIN zamowienia ON rosliny.Id_rosliny = zamowienia.Id_rosliny
  GROUP BY zamowienia.Data
  ORDER BY WartoscFaktury DESC
  LIMIT 1;

# Ile wystawiono faktór
  SELECT COUNT(DISTINCT zamowienia.Data) AS IleFaktor
  FROM zamowienia;
