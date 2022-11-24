
-- DIMENSIONS-TABELLEN
CREATE VIEW snow_vertriebspartner AS
	SELECT vertriebspartnerid, partnerartid FROM vertriebspartner;
  
 CREATE VIEW snow_partnerart AS
	SELECT partnerartid, partnerart FROM partnerart;
  
CREATE VIEW snow_kunde AS 
	SELECT kundenid, kundentypid FROM kunde;

CREATE VIEW snow_kundentyp AS
	SELECT kundentypid, kundentyp FROM kundentyp;
  
CREATE VIEW snow_plz AS
	SELECT plzid, plz, regionname landid FROM plz;
 
 CREATE VIEW snow_land AS 
	SELECT landid, land FROM land;
