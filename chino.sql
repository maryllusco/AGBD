/*ejercicio 1*/
select FirstName, LastName from employees 
order by FirstName ASC, LastName ASC

/*ejercicio 2*/
select t.name, t.Milliseconds from tracks t 
INNER JOIN albums a ON t.AlbumId = t.AlbumId
where Title like "Big Ones" 
order by Milliseconds ASC

/*ejercicio 3*/
SELECT g.Name, COUNT(t.TrackId) AS cantidad_canciones
FROM  genres g
INNER JOIN tracks t ON g.GenreId = t.GenreId
GROUP BY g.GenreId, g.Name
ORDER BY  cantidad_canciones DESC;

/*ejercicio 4*/
SELECT a.Title, count(t.TrackId)/*muestra en la pantalla*/
FROM albums a
INNER JOIN tracks t ON a.AlbumId = t.AlbumId
GROUP BY a.AlbumId, a.Title
HAVING COUNT(t.TrackId) >= 5;

/*ejercicio 5*/
SELECT a.Title AS albums, SUM(t.UnitPrice) AS Preciototal
FROM albums a
INNER JOIN tracks t ON a.AlbumId = t.AlbumId
GROUP BY a.AlbumId
ORDER BY Preciototal ASC
LIMIT 10;

/*ejercicio 6*/
SELECT g.Name AS "Género", al.Title AS "Nombre del disco", t.name AS "Nombre de la canción" FROM tracks t
INNER JOIN genres g ON t.GenreId = g.GenreId
INNER JOIN albums al ON t.AlbumId = al.AlbumId
WHERE t.UnitPrice = 0.99;

/*ejercicio 7*/
SELECT  t.name, t.Milliseconds, a.Title, at.name
FROM  tracks t
INNER JOIN albums a ON t.AlbumId = a.AlbumId
INNER JOIN artists at ON a.ArtistId = at.ArtistId
ORDER BY t.Milliseconds ASC
LIMIT 20;

/*ejercicio 8*/
SELECT e.LastName AS "Empleado", e.Title AS "Puesto", m.LastName AS "Apellido del jefe",
COUNT(c.CustomerId) AS "Cantidad de clientes" FROM employees e
INNER JOIN employees m ON e.ReportsTo = m.EmployeeId
INNER JOIN customers c ON e.EmployeeId = c.SupportRepId
GROUP BY e.EmployeeId, e.LastName, e.Title, m.LastName
ORDER BY "Cantidad de Clientes" DESC;

/*ejercicio 9*/
INSERT INTO tracks (TrackId,Name, MediaTypeId, Milliseconds, UnitPrice)
VALUES 
(3512,'ramen para dos' ,1, 354000, 0.99),
(3513,'ella' ,1, 354001, 0.99),
(3514,'ciudad magica' ,1, 354002, 0.99),
(3515,'acaramelao' ,1, 354003, 0.99);

/*ejercicio 10*/
SELECT t.TrackId, t.Name
FROM tracks t
ORDER BY  t.TrackId DESC
LIMIT 4;

/*ejercicio 11*/
UPDATE tracks
SET Name = 'Atardecer Digital'
WHERE TrackId = 3512;

UPDATE tracks
SET Name = 'bronceado'
WHERE TrackId = 3513;

/*ejercicio 12*/
SELECT * FROM tracks
WHERE TrackId IN (3512, 3513);

/*ejercicio 13*/
DELETE FROM tracks
WHERE TrackId IN (3512, 3513);

