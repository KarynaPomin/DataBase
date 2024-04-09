# BAZA DANYCH -- Agencja artystyczna
# Podaj wszystkich wykonawców oraz miasta, w których znajduje się ich siedziba, i posortuj resultaty rosnąco według miasta i nazwy wykonawców.
  SELECT wykonawcy.IDWykonawcy, wykonawcy.MiastoWykonawcy
  FROM wykonawcy
  ORDER BY wykonawcy.MiastoWykonawcy;

# Podaj daty występów, ale tak, żeby się nie powtarzały; liczba występów odbywający się jednego dnia jest dla mnie nie istotna.
  SELECT DISTINCT imprezy.DzienRozpoczecia
  FROM imprezy;

# BAZA DANYCH -- Grafika uczelni
# Podaj listę budynków kampusu oraz liczbę piętr w każdym budynku. Posortuj listę według budynków, rosnąco
