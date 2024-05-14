# Zbierz na wspólnejliście klientów i wykonawców. Wynik uporządkuj w kolejności malejącej. AgencjaArtstyczna
SELECT wykonawcy.NazwaScenicznaWykonawcy, CONCAT(klienci.ImieKlienta, " ", klienci.NazwiskoKlienta) AS Klient
FROM wykonawcy, klienci, imprezy
WHERE wykonawcy.IDWykonawcy = imprezy.IDWykonawcy AND imprezy.IDKlienta = klienci.IDKlienta;
