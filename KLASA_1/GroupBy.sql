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

# 7. W którym roku wygasa najmniej kart w miesiącach letnich?
	SELECT ExpYear FROM creditcard 
	WHERE ExpMonth REGEXP "^[6-8]$"
	GROUP BY ExpYear
	ORDER BY COUNT(*) ASC 
	LIMIT 1;
#####
# [a-z] => .{}
#	SELECT CardType FROM creditcard 
#	WHERE CardType REGEXP "^.{0,}$"
#	GROUP BY CardType;
#####
	SELECT ExpMonth FROM creditcard
	WHERE ExpMonth REGEXP "^[4-7]$"
	GROUP BY ExpMonth;
	
# 8. Utwórz zestawienie typów kart zakładając, 
# że wygasają w miesiącach nieparzystych 
# MOD or % or MOD(ExpMonth, 2) = 1

	SELECT CardType, COUNT(*) FROM creditcard 
	WHERE ExpMonth % 2 = 1
	GROUP BY CardType;
