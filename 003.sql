CREATE DATABASE QueryTest;
USE QueryTest;

CREATE TABLE Product (
  maker VARCHAR(50),
  model VARCHAR(50),
  type VARCHAR(50),
  PRIMARY KEY (model)
);

CREATE TABLE PC (
  model VARCHAR(50),
  speed DECIMAL(10,2),
  ram INT,
  hd DECIMAL(10,2),
  price DECIMAL(10,2),
  PRIMARY KEY (model),
  FOREIGN KEY (model) REFERENCES Product(model)
);

CREATE TABLE Laptop (
  model VARCHAR(50),
  speed DECIMAL(10,2),
  ram INT,
  hd DECIMAL(10,2),
  screen INT,
  price DECIMAL(10,2),
  PRIMARY KEY (model),
  FOREIGN KEY (model) REFERENCES Product(model)
);

CREATE TABLE Printer (
  model VARCHAR(50),
  color VARCHAR(50),
  type VARCHAR(50),
  price DECIMAL(10,2),
  PRIMARY KEY (model),
  FOREIGN KEY (model) REFERENCES Product(model)
);

SHOW TABLES;

INSERT INTO Product (maker, model, type) VALUES 
('A', '1001', 'pc'),
('A', '1002', 'pc'),
('A', '1003', 'pc'),
('A', '2004', 'laptop'),
('A', '2005', 'laptop'),
('A', '2006', 'laptop'),
('B', '1004', 'pc'),
('B', '1005', 'pc'),
('B', '1006', 'pc'),
('B', '2007', 'laptop'),
('C', '1007', 'pc'),
('D', '1008', 'pc'),
('D', '1009', 'pc'),
('D', '1010', 'pc'),
('D', '3004', 'printer'),
('D', '3005', 'printer'),
('E', '1011', 'pc'),
('E', '1012', 'pc'),
('E', '1013', 'pc'),
('E', '2001', 'laptop'),
('E', '2002', 'laptop'),
('E', '2003', 'laptop'),
('B', '3001', 'printer'),
('E', '3002', 'printer'),
('E', '3003', 'printer'),
('F', '2008', 'laptop'),
('F', '2009', 'laptop'),
('C', '2010', 'laptop'),
('H', '3006', 'printer'),
('H', '3007', 'printer');

select *from Product;


INSERT INTO PC (model, speed, ram, hd, price) VALUES 
('1001', 2.66, 1024, 250, 2114),
('1002', 2.10, 512, 250, 995),
('1003', 1.42, 512, 80, 478),
('1004', 2.80, 1024, 250, 649),
('1005', 3.20, 512, 250, 630),
('1006', 3.20, 1024, 320, 104),
('1007', 2.20, 1024, 200, 510),
('1008', 2.20, 2048, 250, 770),
('1009', 2.00, 1024, 250, 650),
('1010', 2.80, 2048, 300, 770),
('1011', 1.86, 2048, 160, 959),
('1012', 2.80, 1024, 160, 649),
('1013', 3.06, 512, 80, 529);

select *from PC;

INSERT INTO Laptop (model, speed, hd, ram, screen, price) VALUES 
('2001', 2.00, 2048, 240, 20.1, 3673),
('2002', 1.73, 1024, 80, 17.0, 949),
('2003', 1.80, 512, 60, 15.4, 549),
('2004', 2.00, 512, 60, 13.3, 1150),
('2005', 2.16, 1024, 120, 17.0, 2500),
('2006', 2.00, 2048, 80, 15.4, 1700),
('2007', 1.83, 1024, 120, 13.3, 1429),
('2008', 1.60, 1024, 100, 15.4, 900),
('2009', 1.60, 512, 80, 14.1, 680),
('2010', 2.00, 2048, 160, 15.4, 2300);

select *from Laptop;

INSERT INTO Printer (model, color, type, price) VALUES 
('3001', true, 'ink-jet', 99),
('3002', false, 'laser', 239),
('3003', true, 'laser', 899),
('3004', true, 'ink-jet', 120),
('3005', false, 'laser', 120),
('3006', true, 'ink-jet', 100),
('3007', true, 'laser', 200);

select *from Printer;

SELECT Product.maker, Laptop.speed
FROM Product
JOIN Laptop ON Product.model = Laptop.model
WHERE Laptop.hd >= 30;


SELECT hd, COUNT(*) AS occurrences
FROM PC
GROUP BY hd
HAVING COUNT(*) >= 2;

SELECT DISTINCT Product.maker
FROM Product
JOIN PC ON Product.model = PC.model
WHERE PC.speed > 3.0;

SELECT maker, AVG(speed) AS average_speed
FROM (
    SELECT maker, speed 
    FROM Product
    JOIN PC ON Product.model = PC.model
    UNION ALL
    SELECT maker, speed 
    FROM Product
    JOIN Laptop ON Product.model = Laptop.model
) AS union_table
GROUP BY maker
ORDER BY average_speed DESC;

SELECT AVG(speed) as average_speed
FROM PC;

SELECT AVG(screen) as average_screen
FROM Laptop;

SELECT Product.maker, AVG(Laptop.screen) as average_screen_size
FROM Product
JOIN Laptop ON Product.model = Laptop.model
GROUP BY Product.maker;

SELECT model, MAX(price) as max_price
FROM PC
WHERE speed > 2.0
GROUP BY model;
