DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TABLE Kreditart (
	KreditartID SERIAL PRIMARY KEY,
	Kreditart VARCHAR(50),
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);

CREATE TABLE Beruf (
	BerufID SERIAL PRIMARY KEY,
	Berufname VARCHAR(50),
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);

CREATE TABLE Adresse (
	AdressID SERIAL PRIMARY KEY,
	Hausnummer INT,
	Straße VARCHAR (50),
	Stadt VARCHAR (50),
	PLZ INT,
	Land VARCHAR (50),
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);

CREATE TABLE Partnerart (
	PartnerartID SERIAL PRIMARY KEY,
	Partnerart VARCHAR(50),
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);

CREATE TABLE Kundentyp (
	KundentypID SERIAL PRIMARY KEY,
	gueltig_ab TIMESTAMP NOT NULL,
	gueltig_bis TIMESTAMP NOT NULL
);

CREATE TABLE Buergen (
	BuergenID SERIAL PRIMARY KEY,
	AdressID INT NOT NULL REFERENCES Adresse(AdressID),
	Vorname VARCHAR NOT NULL,
	Nachname VARCHAR NOT NULL,
	gueltig_ab TIMESTAMP NOT NULL,
	gueltig_bis TIMESTAMP NOT NULL
);

CREATE TABLE Provisionsvertrag (
	ProvisionsvertragID SERIAL PRIMARY KEY,
	hoehe FLOAT NOT NULL,
	gueltig_ab TIMESTAMP NOT NULL,
	gueltig_bis TIMESTAMP NOT NULL
);

CREATE TABLE Mitarbeiter (
	MitarbeiterID SERIAL PRIMARY KEY,
	Vorname VARCHAR NOT NULL,
	Nachname VARCHAR NOT NULL,
	Geburtstag DATE,
	Gehalt float,
	AdressID INT NOT NULL REFERENCES Adresse(AdressID),
	BerufID INT NOT NULL REFERENCES Beruf(BerufID),
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);

CREATE TABLE Kunde (
	KundenID SERIAL PRIMARY KEY,
	Vorname VARCHAR(50),
	Nachname VARCHAR(50),
	Geburtstag DATE,
	Nettoeinkommen_monat FLOAT,
	AdressID INT NOT NULL REFERENCES Adresse(AdressID),
	BerufID INT NOT NULL REFERENCES Beruf(BerufID),
	KundentypID INT,
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);

CREATE TABLE Kredit (
	KreditID SERIAL PRIMARY KEY, 
	Zinsen float,
	Kreditvolumen float,
	Abschlusskosten float,
	Geforderte_garantie float,
	Personalkosten float,
	Anfangstermin DATE,
	Endtermin DATE,
	KundenID INT NOT NULL REFERENCES Kunde(KundenID),
	KreditartID INT NOT NULL REFERENCES Kreditart(KreditartID),
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);

CREATE TABLE Vertriebspartner (
	VertriebspartnerID SERIAL PRIMARY KEY,
	Firmenname VARCHAR(50),
	PartnerartID INT NOT NULL REFERENCES Partnerart(PartnerartID),
	ProvisionsvertragID INT NOT NULL REFERENCES Provisionsvertrag(ProvisionsvertragID),
	Telefonnummer VARCHAR,
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);

CREATE TABLE Kreditverantwortlicher (
	KreditverantwortlicherID SERIAL PRIMARY KEY,
	KreditID INT NOT NULL REFERENCES Kredit(KreditID),
	MitarbeiterID INT NOT NULL REFERENCES Mitarbeiter(MitarbeiterID),
	VertriebspartnerID INT NOT NULL REFERENCES Vertriebspartner(VertriebspartnerID)
);

CREATE TABLE Rückzahlung (
	RueckzahlungsID SERIAL PRIMARY KEY,
	KreditID INTEGER NOT NULL REFERENCES Kredit(KreditID),
	Tilgungsanteil FLOAT NOT NULL,
	Zisnanteil FLOAT NOT NULL,
	Datum DATE NOT NULL,
	gueltig_ab TIMESTAMP NOT NULL,
	gueltig_bis TIMESTAMP NOT NULL
);

CREATE TABLE Buergschaft (
	BuergschaftsID SERIAL NOT NULL PRIMARY KEY,
	KundenID INT NOT NULL REFERENCES Kunde(KundenID),
	BuergenID INT NOT NULL REFERENCES Buergen(BuergenID),
	gueltig_ab TIMESTAMP NOT NULL,
	gueltig_bis TIMESTAMP NOT NULL
);
