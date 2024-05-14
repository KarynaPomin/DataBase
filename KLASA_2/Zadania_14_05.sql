# Zbierz na wspólnejliście klientów i wykonawców. Wynik uporządkuj w kolejności malejącej. AgencjaArtstyczna
SELECT CONCAT(klienci.ImieKlienta, " ", klienci.NazwiskoKlienta) AS Personalia, 'Klient' AS Typ
FROM klienci
UNION
SELECT wykonawcy.NazwaScenicznaWykonawcy AS Personalia, 'Wykonawca' AS Typ
FROM wykonawcy
ORDER BY Personalia DESC;
