CREATE TABLE klub(
nazwa char(40) NOT NULL,
miasto char(30) NOT NULL,
punkty int,
id_klubu char(6) NOT NULL,
UNIQUE(id_klubu),
CONSTRAINT klub_nr_pk PRIMARY KEY(id_klubu)
);

CREATE TABLE stadion(
nazwa char(30) NOT NULL,
miasto char(40) NOT NULL,
adres varchar(50) NOT NULL,
id_stadionu char(6) NOT NULL,
klub_id char(6) NOT NULL,
CONSTRAINT klub_nr_fk FOREIGN KEY(klub_id)
REFERENCES klub(id_klubu)
ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT stadion_klub_nr_pk PRIMARY KEY(klub_id)
);

CREATE TABLE zawodnik(
imie char(30) NOT NULL,
nazwisko char(50) NOT NULL,
rola char(20),
data_urodzenia date NOT NULL,
id_zawodnika char(6) NOT NULL,
klub_id char(6),
CONSTRAINT zawodnik_nr_pk PRIMARY KEY(id_zawodnika),
CONSTRAINT klub_fk FOREIGN KEY(klub_id)
REFERENCES klub(id_klubu) 
ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE pracownik_sztabu_szkoleniowego(
funkcja char(40),
imie char(30) NOT NULL,
nazwisko char(50) NOT NULL,
data_urodzenia date NOT NULL,
id_pracownika char(6) NOT NULL,
klub_id char(6),
CONSTRAINT pracownik_nr_pk PRIMARY KEY(id_pracownika),
CONSTRAINT klub_fk FOREIGN KEY(klub_id)
REFERENCES klub(id_klubu) 
ON UPDATE NO ACTION ON DELETE NO ACTION
);

create table mecz(
data_rozpoczecia date,
godzina_rozpoczecia time,
godzina_zakonczenia time,
gole_goscia int,
gole_gospodarza int,
id_gospodarza char(6) NOT NULL,
id_meczu char(6) NOT NULL,
PRIMARY KEY (id_meczu)
);

create table gra
(
 klubu1_id char(6) NOT NULL,
 klubu2_id char(6) NOT NULL,
 meczu_id char(6) NOT NULL,
 CONSTRAINT gra_pk
 PRIMARY KEY(klubu1_id,klubu2_id,meczu_id),
 CONSTRAINT gra_klub1_nr_fk
 FOREIGN KEY(klubu1_id)
 REFERENCES klub(id_klubu)
 ON UPDATE CASCADE ON DELETE CASCADE,
 CONSTRAINT gra_klub2_nr_fk
 FOREIGN KEY(klubu2_id)
 REFERENCES klub(id_klubu)
 ON UPDATE CASCADE ON DELETE CASCADE,
 CONSTRAINT gra_mecz_nr_fk
 FOREIGN KEY(meczu_id)
 REFERENCES mecz(id_meczu)
);

create table sedzia(
imie char(30),
nazwisko char(50),
data_urodzenia date,
id_sedziego char(6) NOT NULL,
PRIMARY KEY (id_sedziego)
);

create table sedziuje
(
 sedziego_id char(6) not null,
 meczu_id char(6) not null,
 CONSTRAINT sedziuje_pk
 PRIMARY KEY(sedziego_id, meczu_id),
 CONSTRAINT sedziuje_sedziego_nr_fk
 FOREIGN KEY(sedziego_id)
 REFERENCES sedzia(id_sedziego)
 ON UPDATE CASCADE ON DELETE CASCADE,
 CONSTRAINT sedziuje_mecz_nr_fk
 FOREIGN KEY(meczu_id)
 REFERENCES mecz(id_meczu)
);