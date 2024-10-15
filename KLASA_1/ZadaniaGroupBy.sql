BAZA --> AWBackup
Otwieranie HEIDI (Ctr O)

# 1. Policz ile jest wszystkich kart
	SELECT COUNT(*) FROM creditcard;

# 2. Policz ile kart wygasa w 2008
  	SELECT ExpYear, COUNT(*) FROM creditcard
 	GROUP BY ExpYear
  	HAVING ExpYear = 2008;

# 3. Policz ile kard wygasa w 2008 roku w październiku
  	SELECT ExpYear, ExpMonth, COUNT(*) FROM creditcard
 	GROUP BY ExpMonth
  	HAVING ExpYear = 2008 AND ExpMonth = 10;

# 4. Policz ilość kart Vista
	SELECT CardType, COUNT(CardType) FROM creditcard
	WHERE CardType LIKE "Vista"
	GROUP BY CardType;
	
# 5. Stwórz zostawienie ilości kart (po CardType) wygasających w styczniu posortowane ilościowo malejąco w CardType mające literkę "a"
	SELECT CardType, COUNT(*) FROM creditcard
	WHERE ExpMonth = 1
	GROUP BY CardType
	HAVING CardType LIKE "%a%"
	ORDER BY COUNT(*) DESC;
	
# 6. Wypisz 3 najliczniejsze miesiące kiedy wygasają karty Vista w 2007 roku.
 	SELECT ExpMonth, COUNT(*) FROM creditcard
	WHERE CardType = "Vista" AND ExpYear = 2007
	GROUP BY ExpMonth
	ORDER BY 2 DESC
	LIMIT 3;
	
