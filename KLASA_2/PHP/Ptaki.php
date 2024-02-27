<?PHP
	echo "http://localhost/2E/"."<br>"."<br>";
	echo "Pierwsze  połączenie z PHP"."<br>"."<br>";
	
	$serwer = "localhost";
	$user = "root";
	$haslo = "";
	$baza = "Ptaki";

	$zapytanie = "SELECT nazwa_zwyczajowa, nazwa_lacinska FROM gatunki WHERE nazwa_zwyczajowa LIKE 'b%' ORDER BY nazwa_zwyczajowa ASC";
	
	$con = new mysqli($serwer, $user, $haslo, $baza);

	if($wynik = $con -> query($zapytanie)) // wykonanie zapytania
		WHILE($row = $wynik -> fetch_array())
			echo $row["nazwa_zwyczajowa"]."  --  ".$row["nazwa_lacinska"]."<br>";
	else 
		echo $con -> errno." - ".$con -> error; // Error Number --> errno 
	
	$con -> close() // zamykamy połączenie 
	
?>
