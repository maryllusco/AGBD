SELECT * FROM crime_scene_report 
WHERE type= "murder" AND city like "sql city" AND date=20180115

Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

SELECT * FROM person 
WHERE name like "Annabel%"AND address_street_name like "Franklin Ave"

SELECT * FROM person 
WHERE address_street_name like "Northwestern Dr" order by address_number desc limit 1



