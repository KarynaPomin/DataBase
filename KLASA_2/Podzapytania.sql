-- 1. Wyświetl wszystkie  zamówienia wysłane 3 października 2017 roku i nazwiska klientów, którzy je złożyli.

SELECT klienci.NazwiskoKlienta, klienci.ImieKlienta, zamowienia.DataZamowienia, zamowienia.DataWysylki FROM klienci INNER join zamowienia ON klienci.IDKlienta=zamowienia.IDKlienta WHERE zamowienia.DataWysylki LIKE '2017-10-03'
 
-- 2. Wymień wszystkich klientów i liczbę zamówień złożonych przez każdego z nich.
SELECT klienci.ImieKlienta, klienci.NazwiskoKlienta, COUNT(zamowienia.NumerZamowienia) AS Liczbazamowien FROM klienci INNER join zamowienia ON klienci.IDKlienta=zamowienia.IDKlienta GROUP BY klienci.NazwiskoKlienta;

-- Podzapytanie
SELECT klienci.ImieKlienta, klienci.NazwiskoKlienta,
	(SELECT COUNT(*)
    FROM zamowienia
    WHERE zamowienia.IDKlienta=klienci.IDKlienta) AS LiczZam
FROM klienci;


-- 3. Podaj listę klientów i daty ostatniego złożonego przez nich zamówienia

SELECT klienci.ImieKlienta, klienci.NazwiskoKlienta,
	(SELECT MAX(zamowienia.DataZamowienia)
	FROM zamowienia
    WHERE klienci.IDKlienta=zamowienia.IDKlienta) AS DataOstZam
FROM klienci

-- 4. Zrób listę klientów i wszystkich szczegółów dotyczących ich ostatniego zamówienia.
SELECT klienci.ImieKlienta, klienci.NazwiskoKlienta, zamowienia.NumerZamowienia, zamowienia.DataZamowienia, zamowienia.DataWysylki, (SELECT MAX(zamowienia.DataZamowienia) FROM zamowienia WHERE klienci.IDKlienta=zamowienia.IDKlienta) AS DataOstZam FROM klienci INNER join zamowienia ON klienci.IDKlienta=zamowienia.IDKlienta GROUP BY klienci.NazwiskoKlienta;
