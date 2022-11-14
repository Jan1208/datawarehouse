SELECT SUM(kredit.kreditvolumen) AS Kreditvolumen, SUM(rueckzahlung.tilgungsanteil) + SUM(rueckzahlung.zinsanteil) AS Umsatz 
FROM kredit
INNER JOIN rueckzahlung
ON rueckzahlung.kreditid = kredit.kreditid

