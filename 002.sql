/*CREATE DATABASE World001;*/
USE World001;
CREATE TABLE country (
  Code CHAR(3) NOT NULL PRIMARY KEY,
  Name VARCHAR(52) NOT NULL,
  Continent VARCHAR(32) NOT NULL,
  Region VARCHAR(52) NOT NULL,
  SurfaceArea FLOAT(10,2) NOT NULL,
  IndepYear SMALLINT(6),
  Population INT(11) NOT NULL,
  LifeExpectancy FLOAT(3,1)
);

CREATE TABLE city (
  ID INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(35) NOT NULL,
  CountryCode CHAR(3) NOT NULL,
  District VARCHAR(20) NOT NULL,
  Population INT(11) NOT NULL
);

CREATE TABLE CountryLanguage(
CountryCode CHAR(3) NOT NULL PRIMARY KEY  ,
language CHAR(15) NOT NULL ,
IsOfficiall BIT,
Percentage DOUBLE 
);
SHOW TABLES;

INSERT INTO country (Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy) 
VALUES 
('ABW', 'Aruba', 'North America', 'Caribbean', 193.00, NULL, 103000, 78.4),
('AFG', 'Afghanistan', 'Asia', 'Southern and Central Asia', 652090.00, 1919, 22720000, 45.9),
('AGO', 'Angola', 'Africa', 'Central Africa', 1246700.00, 1975, 12878000, 38.3),
('AIA', 'Anguilla', 'North America', 'Caribbean', 96.00, NULL, 8000, 76.1),
('ALB', 'Albania', 'Europe', 'Southern Europe', 28748.00, 1912, 3401200, 71.6),
('AND', 'Andorra', 'Europe', 'Southern Europe', 468.00, 1278, 78000, 83.5),
('ANT', 'Netherlands Antilles', 'North America', 'Caribbean', 800.00, NULL, 217000, 74.7),
('ARE', 'United Arab Emirates', 'Asia', 'Middle East', 83600.00, 1971, 2441000, 74.1),
('ARG', 'Argentina', 'South America', 'South America', 2780400.00, 1816, 37032000, 75.1),
('ARM', 'Armenia', 'Asia', 'Middle East', 29800.00, 1991, 3520000, 66.4);

SELECT * FROM country;

INSERT INTO city (Name, CountryCode, District, Population) VALUES
('Kabul', 'AFG', 'Kabol', 1780000),
('Qandahar', 'AFG', 'Qandahar', 237500),
('Herat', 'AFG', 'Herat', 186800),
('Mazar-e-Sharif', 'AFG', 'Balkh', 127800),
('Amsterdam', 'NLD', 'Noord-Holland', 731200),
('Rotterdam', 'NLD', 'Zuid-Holland', 593321),
('Haag', 'NLD', 'Zuid-Holland', 440900),
('Utrecht', 'NLD', 'Utrecht', 234323),
('Eindhoven', 'NLD', 'Noord-Brabant', 201843),
('Tilburg', 'NLD', 'Noord-Brabant', 193238);

SELECT * FROM city;

INSERT INTO countrylanguage (CountryCode, Language, IsOfficial, Percentage) VALUES
('ABW', 'Dutch', 'T', 5.3),
('ABW', 'English', 'F', 9.5),
('ABW', 'Papiamento', 'F', 76.7),
('ABW', 'Spanish', 'F', 7.4),
('AFG', 'Balochi', 'F', 0.9),
('AFG', 'Dari', 'T', 32.1),
('AFG', 'Pashto', 'T', 52.4),
('AFG', 'Turkmenian', 'F', 1.9),
('AFG', 'Uzbek', 'F', 8.8),
('AGO', 'Ambo', 'F', 2.4);

SELECT * FROM countrylanguage;

SHOW TABLES;
