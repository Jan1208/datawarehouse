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






CREATE VIEW kredit_provision AS
  SELECT k.kreditid, pv.hoehe as Provisionshoehe
  FROM kredit k
  LEFT JOIN kreditverantwortlicher kv
  ON kv.kreditid = k.kreditid
  LEFT JOIN vertriebspartner vp
  ON vp.vertriebspartnerid = kv.vertriebspartnerid
  LEFT JOIN provisionsvertrag pv
  ON pv.provisionsvertragid = vp.provisionsvertragid
  
CREATE VIEW kredit_gesamtRueckzahlung AS 
	SELECT SUM(tilgungsanteil) AS tilgungen, SUM(zinsanteil) as zinsen, SUM(tilgungsanteil) + SUM(zinsanteil) AS Gesamt
	FROM rueckzahlung
