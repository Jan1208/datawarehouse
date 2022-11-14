CREATE TABLE Kredit (
	KreditID SERIAL PRIMARY KEY, 
	Zinsen float,
	Kreditvolumen float,
	Abschlusskosten float,
	Geforderte_garantie float,
	Personalkosten float,
	Anfangstermin DATE,
	Endtermin DATE,
	KundenID INT,
	KreditartID INT,
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);

CREATE TABLE Kreditart (
	KreditID INT NOT NULL,
	Kreditart VARCHAR(50),
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);

CREATE TABLE Kunde (
	KundenID SERIAL PRIMARY KEY,
	Vorname VARCHAR(50),
	Nachname VARCHAR(50),
	Geburtstag DATE,
	Nettoeinkommen_monat float,
	AdressID INT,
	BerufID INT,
	KundentypID INT,
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);

CREATE TABLE Beruf (
	BerufID SERIAL PRIMARY KEY,
	Berufname varchar(50),
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);

CREATE TABLE Mitarbeiter (
	MitarbeiterID SERIAL PRIMARY KEY,
	Vorname VARCHAR NOT NULL,
	Nachname VARCHAR NOT NULL,
	AdressID INT NOT NULL,
	KreditID INT NOT NULL,
	Alter INT,
	Gehalt float,
	Beruf VARCHAR(50),
	Gueltig_ab TIMESTAMP,
	Gueltig_bis TIMESTAMP
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
	PartnerartenID SERIAL PRIMARY KEY,
	Partnerart VARCHAR(50),
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);


CREATE TABLE Vertriebspartner (
	VertriebspartnerID SERIAL PRIMARY KEY,
	Firmenname VARCHAR(50),
	PartnerartID INT,
	ProvisionsvertragID INT,
	Telefonnummer VARCHAR,
	gueltig_ab TIMESTAMP,
	gueltig_bis TIMESTAMP
);

CREATE TABLE Kreditverantwortlicher (
	KreditID INTEGER NOT NULL PRIMARY KEY REFERENCES Kredit(KreditID),
	MitarbeiterID INTEGER NOT NULL PRIMARY KEY REFERENCES Mitarbeiter(MitarbeiterID),
	VertriebspartnerID INTEGER PRIMARY KEY REFERENCES Vertriebspartner(VPartnerID)
);

CREATE TABLE Person (
	RueckzahlungsID SERIAL NOT NULL PRIMARY KEY,
	KreditID INTEGER NOT NULL REFERENCES Kredit(KreditID),
	Tilgungsanteil FLOAT NOT NULL,
	Zisnanteil FLOAT NOT NULL,
	Datum DATE NOT NULL,
	gueltig_ab TIMESTAMP NOT NULL,
	gueltig_bis TIMESTAMP NOT NULL
);

CREATE TABLE buergt (
	KundenID INTEGER NOT NULL PRIMARY KEY REFERENCES Kunde(KundenID),
	BuergenID INTEGER NOT NULL PRIMARY KEY REFERENCES Buergen(BuergenID)
);

CREATE TABLE Kundentyp (
	kundentypID INT NOT NULL SERIAL PRIMARY KEY,
	gueltig_ab TIMESTAMP NOT NULL,
	gueltig_bis TIMESTAMP NOT NULL
);

CREATE TABLE Buergen (
	buergenID INT NOT NULL SERIAL PRIMARY KEY,
	adressID INT NOT NULL FOREIGN KEY,
	vorname VARCHAR NOT NULL,
	nachname VARCHAR NOT NULL,
	gueltig_ab TIMESTAMP NOT NULL,
	gueltig_bis TIMESTAMP NOT NULL
);

CREATE TABLE Provisionsvertrag (
	pvertragID INT NOT NULL SERIAL PRIMARY KEY,
	kreditID INT NOT NULL FOREIGN KEY,
	hoehe FLOAT NOT NULL,
	gueltig_ab TIMESTAMP NOT NULL,
	gueltig_bis TIMESTAMP NOT NULL
);
