/*ejercicio 1*/
select FirstName, LastName from employees 
order by FirstName ASC, LastName ASC
/*ejercicio 2*/
select t.name, t.Milliseconds from tracks t 
INNER JOIN albums a ON t.AlbumId = t.AlbumId
where Title like "Big Ones" 
order by Milliseconds ASC
/*ejercicio 3*/
