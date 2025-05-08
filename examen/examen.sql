/*examen practico*/
/*no esperes mucho, lo que cuenta es la intencion*/
/*merezco mi 10 :) */

/*ejercicio 1*/
select count (*) AS totalCanciones from tracks t
inner join albums a ON t.AlbumId = a.AlbumId
where a.Title like "unplugged"
/*ejercicio 2*/
SELECT artists.Name AS artista, COUNT(tracks.TrackId) AS canciones FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
GROUP BY artists.Name
HAVING canciones >= 30
ORDER BY canciones DESC
/*ejercicio 3*/
INSERT into tracks  (name, MediaTypeId, Milliseconds, UnitPrice)
VALUES('feliz cumpleaños', 1, 180000, 0.99),
('ella dijo', 1, 150000, 1.99), 
('ella', 1, 130000, 0.99), 
('ciudad magica', 1, 230000, 2.99), 
('hola noviembre', 5, 300000, 0.99), 
('frances limon', 1, 333000, 1.99);
/*ejercicio 4*/
UPDATE tracks set name = 'ciudad',Milliseconds = '77777'
WHERE name = 'ciudad no magica'; 
/*ejercicio 5*/
DELETE  from tracks
where TrackId >= 3504 and TrackId <= 3505