# Wymień wszystkie przepisy i wszystkie skladniki każdego przepisu dla takich przepisów , które zawierają owoce morza. (BAZA: PRZEPISY PZYKLAD)

SELECT przepisy.NazwaPrzepisu, skladniki.NazwaSkladnika
FROM skladniki_przepisow INNER JOIN przepisy
	ON skladniki_przepisow.IDPrzepisu = przepisy.IDPrzepisu
    INNER JOIN skladniki
    ON skladniki_przepisow.IDSkladnika = skladniki.IDSkladnika
WHERE przepisy.IDPrzepisu IN (SELECT IDPrzepisu
                                FROM (skladniki_przepisow
                              		INNER JOIN skladniki
                              			ON skladniki.IDKategoriiSkladnika = skladniki_przepisow.IDKategoriiSkladnika)
                                    INNER JOIN kategorie_skladnikow ON skladniki_przepisow.IDSkladnika = kategorie_skladnikow.IDSkladnika
                                WHERE kategorie_skladnikow.OpisKategoriiSkladnika LIKE 'Owoce morza')

# Zrób listę klientów i wszystkich szczegułów dotyczących ich ostaniego zamówienia. (BAZA: ZAMOWIENIA PRZYKLAD)

SELECT klienci.NazwiskoKlienta, klienci.NazwiskoKlienta, zamowienia.NumerZamowienia, zamowienia.DataZamowienia, dane_zamowien.NumerProduktu, produkty.NazwaProduktu, dane_zamowien.ZamowionaIlosc
FROM ((klienci INNER JOIN zamowienia ON klienci.IDKlienta = zamowienia.IDKlienta) 
      INNER JOIN dane_zamowien ON zamowienia.NumerZamowienia = dane_zamowien.NumerZamowienia)
      INNER JOIN produkty ON produkty.NumerProduktu = dane_zamowien.NumerProduktu
WHERE zamowienia.DataZamowienia = (SELECT MAX(zamowienia.DataZamowienia) 
                                   FROM zamowienia AS ZAM2 
                                   WHERE ZAM2.IDKlienta =  klienci.IDKlienta)
