--kluby ktore maja niezerowa liczbe punktow
SELECT * FROM klub WHERE punkty IS NOT NULL;

--Imiona zawodnikow z klubu o id = 2
SELECT imie FROM zawodnik
WHERE klub_id='2';

--Imiona i nazwiska pracownikow przypisanych do klubow, ktorzy urodzili sie po 1995-1-1
SELECT imie, nazwisko FROM pracownik_sztabu_szkoleniowego INNER JOIN klub
ON klub_id = id_klubu AND data_urodzenia > '1995-1-1';

--Usowa zawodnikow ktorzy nie sa przypisani do klubu
DELETE from zawodnik
WHERE klub_id IS NULL;

--Imiona i nazwiska wszystkich zawodnikow
SELECT imie,nazwisko FROM zawodnik;


--Nazwa i miasto stadionow dla ktorych instnieje jakikolwiek zawodnik przypisany do tego samego klubu co stadion
SELECT nazwa, miasto
FROM stadion N
WHERE EXISTS (
 SELECT *
 FROM zawodnik
 WHERE id_zawodnika=N.klub_id
 );
 
 --Nazwa i miasto stadionow dla ktorych nie instnieje jakikolwiek zawodnik przypisany do tego samego klubu co stadion
SELECT nazwa, miasto
 SELECT nazwa, miasto
FROM klub M
WHERE NOT EXISTS (
 SELECT *
 FROM zawodnik
 WHERE klub_id=M.id_klubu
 );