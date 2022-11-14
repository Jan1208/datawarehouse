SELECT SUM(k.kreditvolumen) AS Kreditvolumen, SUM(r.tilgungsanteil) + SUM(r.zinsanteil) AS Umsatz 
FROM kredit k
INNER JOIN rueckzahlung r
ON r.kreditid = k.kreditid
INNER JOIN kreditverantwortlicher kv
ON kv.kreditid = k.kreditid
INNER JOIN vertriebspartner v
ON kv.vertriebspartnerid = v.vertriebspartnerid
INNER JOIN provisionsvertrag p
ON v.provisionsvertragid = p.provisionsvertragid
