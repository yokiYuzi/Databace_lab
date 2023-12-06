USE world001;
SELECT * FROM  country;
ALTER  TABLE country ADD headOfState varchar(10);

CREATE TEMPORARY TABLE tmp_country
SELECT Code
FROM country
WHERE lifeExpectancy > 75;

UPDATE country
SET lifeExpectancy = lifeExpectancy + 1
WHERE Code IN (SELECT Code FROM tmp_country) AND lifeExpectancy > 75;

SELECT * FROM  country;

SELECT * FROM  city;

