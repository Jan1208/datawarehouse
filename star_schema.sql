CREATE VIEW star_faktentabelle AS
SELECT k.kreditid, k.kreditvolumen AS Kreditvolumen, kp.provisionshoehe,
(SELECT SUM(zinsanteil) FROM rueckzahlung WHERE kreditid = k.kreditid) 
+ (SELECT SUM(tilgungsanteil) FROM rueckzahlung WHERE kreditid = k.kreditid) AS Umsatz, ku.kundenid, ad.adressid, v.vertriebspartnerid
FROM public.kredit_provision kp, kredit k
JOIN rueckzahlung r ON r.kreditid = k.kreditid
JOIN kreditverantwortlicher kv ON kv.kreditid = k.kreditid
JOIN vertriebspartner v ON kv.vertriebspartnerid = v.vertriebspartnerid
JOIN provisionsvertrag p ON v.provisionsvertragid = p.provisionsvertragid
JOIN kunde ku ON ku.kundenid = k.kundenid
JOIN adresse ad ON ku.adressid = ad.adressid
WHERE k.kreditid = kp.kreditid
GROUP BY k.kreditid, kp.provisionshoehe, ku.kundenid, ad.adressid, v.vertriebspartnerid





-- Dimensions Tabellen
CREATE VIEW star_ort AS
	SELECT 
	adressid, a.plzid, p.plz, p.regionname,l.landid, l.land
	FROM adresse a
	JOIN plz p ON a.plzid = p.plzid
	JOIN land l ON l.landid = p.landid

CREATE VIEW star_partner AS
	SELECT v.vertriebspartnerid, v.firmenname, v.partnerartid, p.partnerart
	FROM vertriebspartner v
	LEFT JOIN partnerart p ON v.partnerartid = p.partnerartid

CREATE VIEW star_kunde AS
	SELECT kundenid, kt.kundentypid, kt.kundentyp
	FROM kunde k
	LEFT JOIN kundentyp kt ON k.kundentypid = kt.kundentypid




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
