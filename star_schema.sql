SELECT SUM(k.kreditvolumen) AS Kreditvolumen, SUM(r.tilgungsanteil) + SUM(r.zinsanteil) AS Umsatz, SUM(p.hoehe)
FROM kredit k
LEFT JOIN rueckzahlung r
ON r.kreditid = k.kreditid
LEFT JOIN kreditverantwortlicher kv
ON kv.kreditid = k.kreditid
LEFT JOIN vertriebspartner v
ON kv.vertriebspartnerid = v.vertriebspartnerid
LEFT JOIN provisionsvertrag p
ON v.provisionsvertragid = p.provisionsvertragid
