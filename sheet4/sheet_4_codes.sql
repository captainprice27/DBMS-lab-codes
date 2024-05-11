-- procedure to connect to mysql shell
-- \ sql ENTER
-- \ connect root@localhost
-- password (nm@y)

USE assignment_2_DBMS_lab;


DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS truck;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS shipment;

-- Create the Customer table

CREATE TABLE customer (
    cust_id INT PRIMARY KEY check ( cust_id BETWEEN 100 and 10000),
    cust_name VARCHAR(255),
    annual_revenue INT,
    cust_type ENUM('MANUFACTURER', 'WHOLESALER', 'RETAILER')
);

-- Create the Shipment table

CREATE TABLE shipment (
    shipment_no INT PRIMARY KEY,
    cust_id INT,
    -- weight DECIMAL(5, 2),
    weight INT check (weight < 1000),
    truck_no INT,
    destination VARCHAR(255),
    ship_date DATE,
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id) ON DELETE CASCADE,
    FOREIGN KEY (truck_no) REFERENCES truck(truck_no) ON DELETE SET NULL,
    FOREIGN KEY (destination) REFERENCES city(city_name)
);


-- FOREIGN KEY (cust_id) REFERENCES Customer(cust_id) ON DELETE CASCADE: This means that if a record in the Customer table is deleted, all related records in the Shipment table with the same cust_id will also be automatically deleted (cascaded)

-- Create the Truck table

CREATE TABLE truck (
    truck_no INT PRIMARY KEY,
    driver_name VARCHAR(255)
);

-- Create the City table

CREATE TABLE city (
    city_name VARCHAR(255) PRIMARY KEY,
    population INT
);

-- FILLING customer TABLE **************************************************
INSERT INTO customer(cust_id,cust_name,annual_revenue,cust_type)
VALUES 
(1001,'Anish Banerjee',458000,'WHOLESALER'),
(1002,'Devika Simlai',600000,'RETAILER'),
(1003,'Sagar Basak',4587500,'MANUFACTURER'),
(1004,'Joyabrata Acharyya',105000,'RETAILER'),
(1005,'Tanis Ahmed',785400,'WHOLESALER'),
(1006,'Subham Ghosh',458000,'RETAILER'),
(1007,'Turjo Sarkar',498000,'MANUFACTURER'),
(1008,'Karra Ashish Reddy',300000,'RETAILER'),
(1009,'Aheli Banerjee',650000,'WHOLESALER'),
(1010,'Oishika Datta',750000,'MANUFACTURER'),
(1011,'Fardeen Hossain',620000,'RETAILER'),
(1012,'Sudip Datta',580000,'RETAILER'),
(1013,'Yashwanth Kota',440000,'WHOLESALER'),
(1014,'Raksha Pahariya',690000,'RETAILER'),
(1015,'Prash Basu',478000,'WHOLESALER'),
(1016,'Ayush Yadav',210000,'MANUFACTURER'),
(1017,'Priya Samanta',710000,'RETAILER'),
(1018,'Dinesh Bhattacharya',510000,'RETAILER'),
(1019,'Aditya Agarwal',169000,'RETAILER'),
(1020,'Pantho Debnath',875000,'RETAILER'),
(1021,'Aaratrika Banerjee',458000,'MANUFACTURER'),
(1022,'Ketan Khandelwal',458000,'RETAILER'),
(1023,'Himashis Biswas',458000,'WHOLESALER'),
(1024,'Sayantan Datta',458000,'RETAILER'),
(1025,'Ankita Das',458000,'WHOLESALER');

-- FILLING truck TABLE ************************************************

INSERT INTO truck(truck_no,driver_name)
VALUES
(100,'Raj Shah'),
(101,'Wriddhiraj Dev'),
(102,'Roushan Das'),
(103,'Prayas Mazumder'),
(104,'Sourik Saha'),
(105,'Sayak Saha'),
(106,'Ishan Dasgupta'),
(107,'Soutrik Roy'),
(108,'Saankhaya Samanta'),
(109,'Samridhhi Mishra'),
(110,'Lasiewdor Rapsang'),
(111,'Neeharika Sharma'),
(112,'Aritra Bandyopadhyay'),
(113,'Prithijit Banerjee'),
(114,'Bipradeep Bera'),
(115,'Ananya Sutradhar'),
(116,'Puyush Gupta'),
(117,'Anubhab Sinha'),
(118,'Atrayee Samanta'),
(119,'Vaishnavi Malviya'),
(120,'Yuvraj Singh'),
(121,'Suman Kayal'),
(122,'Dipmay Biswas'),
(123,'Suman Kumar'),
(124,'Peter Parker'),
(125,'Percy Jackson');

-- Sample City entries

INSERT INTO city(city_name, population)
VALUES
  ('New York', 8622698),
  ('Los Angeles', 3990456),
  ('Chicago', 2716000),
  ('Houston', 2320268),
  ('Miami', 453579),
  ('San Francisco', 883305),
  ('Boston', 692600),
  ('Dallas', 1343573),
  ('Seattle', 744955),
  ('Denver', 727211),
  ('Phoenix', 1680992),
  ('Atlanta', 498044),
  ('Philadelphia', 1584138),
  ('Las Vegas', 603488),
  ('Detroit', 672662),
  ('Minneapolis', 429606),
  ('Portland', 653115),
  ('New Orleans', 390144),
  ('San Diego', 1425976),
  ('Austin', 978908),
  ('Kolkata', 978907),
  ('Mumbai', 978908),
  ('Delhi', 978908),
  ('Chennai', 978908),
  ('Bangalore', 978908);
  
  
-- since we forgot to update the city details for the last five entries , here is the updated part to make sure tables entries are ok
UPDATE city
SET population = 9000000
WHERE city_name = 'Kolkata';

UPDATE city
SET population = 33000000
WHERE city_name = 'Delhi';

UPDATE city
SET population = 21000000
WHERE city_name = 'Mumbai';

UPDATE city
SET population = 6700000
WHERE city_name = 'Chennai';

UPDATE city
SET population = 12500000
WHERE city_name = 'Bangalore';


SET FOREIGN_KEY_CHECKS=0;

INSERT INTO shipment(shipment_no,cust_id,weight,truck_no,destination,ship_date)
VALUES
  (1, 1001, 250, 101, 'New York', '2023-10-05'),
  (2, 1002, 350, 102, 'Los Angeles', '2023-10-06'),
  (3, 1003, 125, 103, 'Chicago', '2023-10-07'),
  (4, 1004, 425, 104, 'Houston', '2023-10-08'),
  (5, 1005, 198, 105, 'Miami', '2023-10-09'),
  (6, 1006, 532, 106, 'San Francisco', '2023-10-10'),
  (7, 1007, 288, 107, 'Boston', '2023-10-11'),
  (8, 1008, 671, 108, 'Dallas', '2023-10-12'),
  (9, 1009, 420, 109, 'Seattle', '2023-10-13'),
  (10, 1010, 319, 110, 'Denver', '2023-10-14'),
  (11, 1011, 156, 111, 'Phoenix', '2023-10-15'),
  (12, 1012, 710, 112, 'Atlanta', '2023-10-16'),
  (13, 1013, 690, 113, 'Philadelphia', '2023-10-17'),
  (14, 1014, 198, 114, 'Las Vegas', '2023-10-18'),
  (15, 1015, 452, 115, 'Detroit', '2023-10-19'),
  (16, 1016, 365, 116, 'Minneapolis', '2023-10-20'),
  (17, 1017, 575, 117, 'Portland', '2023-10-21'),
  (18, 1018, 220, 118, 'New Orleans', '2023-10-22'),
  (19, 1019, 315, 119, 'San Diego', '2023-10-23'),
  (20, 1020, 198, 120, 'Austin', '2023-10-24'),
  (21, 1021, 198, 121, 'Kolkata', '2023-10-24'),
  (22, 1022, 174, 122, 'Mumbai', '2023-10-4'),
  (23, 1023, 148, 123, 'Delhi', '2023-10-19'),
  (24, 1024, 205, 124, 'Chennai', '2023-10-8'),
  (25, 1025, 289, 125, 'Bangalore', '2023-10-17');
  
  
  
INSERT INTO shipment(shipment_no,cust_id,weight,truck_no,destination,ship_date)
VALUES
  (26, 1008, 250, 106, 'Kolkata', '2023-10-07'),
  (27, 1007, 85, 107, 'Los Angeles', '2023-10-16'),
  (28, 1010, 125, 112, 'Chicago', '2023-10-4'),
  (29, 1005, 425, 119, 'Houston', '2023-10-08'),
  (30, 1005, 106, 104, 'Kolkata', '2023-10-16'),
  (31, 1006, 56, 116, 'San Francisco', '2023-10-10'),
  (32, 1007, 288, 113, 'Boston', '2023-10-11'),
  (33, 1002, 671, 118, 'Dallas', '2023-10-12'),
  (34, 1009, 148, 123, 'Kolkata', '2023-10-13'),
  (35, 1010, 348, 114, 'Denver', '2023-10-14'),
  (36, 1011, 514, 101, 'Phoenix', '2023-10-15'),
  (37, 1012, 478, 103, 'Atlanta', '2023-10-16'),
  (38, 1013, 321, 102, 'Chennai', '2023-10-17'),
  (39, 1017, 654, 105, 'Las Vegas', '2023-10-29'),
  (40, 1015, 789, 109, 'Detroit', '2023-10-17'),
  (41, 1014, 954, 107, 'Chennai', '2023-10-4'),
  (42, 1017, 123, 117, 'Portland', '2023-10-21'),
  (43, 1018, 456, 118, 'New Orleans', '2023-10-22'),
  (44, 1019, 147, 106, 'San Diego', '2023-10-23'),
  (45, 1024, 369, 117, 'Austin', '2023-10-24'),
  (46, 1021, 951, 120, 'Kolkata', '2023-10-25'),
  (47, 1022, 159, 101, 'Bangalore', '2023-10-4'),
  (48, 1018, 657, 125, 'Delhi', '2023-10-27'),
  (49, 1021, 753, 108, 'Chennai', '2023-10-28'),
  (50, 1025, 357, 112, 'Bangalore', '2023-10-17'),
  
  (51, 1001, 258, 101, 'Denver', '2023-10-05'),
  (52, 1002, 58, 102, 'Los Angeles', '2023-10-06'),
  (53, 1003, 125, 103, 'Chicago', '2023-10-07'),
  (54, 1004, 42, 104, 'Houston', '2023-10-08'),
  (55, 1005, 158, 105, 'Miami', '2023-10-09'),
  (56, 1006, 292, 106, 'San Francisco', '2023-10-10'),
  (57, 1007, 488, 107, 'Miami', '2023-10-11'),
  (58, 1008, 671, 108, 'Dallas', '2023-10-12'),
  (59, 1009, 420, 109, 'Seattle', '2023-10-13'),
  (60, 1010, 519, 107, 'Denver', '2023-10-14'),
  (61, 1011, 356, 111, 'Phoenix', '2023-10-15'),
  (62, 1012, 710, 112, 'Atlanta', '2023-10-16'),
  (63, 1013, 690, 113, 'Philadelphia', '2023-10-17'),
  (64, 1014, 198, 114, 'Las Vegas', '2023-10-18'),
  (65, 1015, 452, 115, 'Detroit', '2023-10-19'),
  (66, 1016, 365, 116, 'Delhi', '2023-10-20'),
  (67, 1017, 575, 117, 'Portland', '2023-10-21'),
  (68, 1018, 220, 118, 'New Orleans', '2023-10-22'),
  (69, 1019, 315, 107, 'San Diego', '2023-10-23'),
  (70, 1020, 198, 108, 'Kolkata', '2023-10-24'),
  (71, 1021, 198, 106, 'Kolkata', '2023-10-24'),
  (72, 1022, 174, 122, 'Mumbai', '2023-10-15'),
  (73, 1023, 148, 123, 'Delhi', '2023-10-4'),
  (74, 1024, 205, 124, 'Chennai', '2023-10-17'),
  (75, 1025, 289, 125, 'Bangalore', '2023-10-24'),
  
  (76, 1001, 254, 104, 'New York', '2023-10-17'),
  (77, 1002, 354, 104, 'Los Angeles', '2023-10-19'),
  (78, 1003, 15, 104, 'Chicago', '2023-10-20'),
  (79, 1014, 475, 104, 'Houston', '2023-10-21'),
  (80, 1015, 198, 104, 'Miami', '2023-10-22'),
  (81, 1006, 42, 104, 'San Francisco', '2023-10-19'),
  (82, 1017, 88, 104, 'Boston', '2023-10-14'),
  (83, 1008, 61, 104, 'Dallas', '2023-10-22'),
  (84, 1009, 420, 104, 'Seattle', '2023-10-23'),
  (85, 1010, 319, 104, 'Denver', '2023-10-24'),
  (86, 1011, 156, 104, 'Phoenix', '2023-10-25'),
  (87, 1002, 710, 104, 'Atlanta', '2023-10-23'),
  (88, 1013, 69, 104, 'Philadelphia', '2023-10-28'),
  (89, 1014, 128, 104, 'Las Vegas', '2023-10-20'),
  (90, 1005, 452, 104, 'Detroit', '2023-10-5'),
  (91, 1016, 365, 104, 'Minneapolis', '2023-10-20'),
  (92, 1017, 57, 104, 'Portland', '2023-10-31'),
  (93, 1008, 220, 104, 'New Orleans', '2023-10-24'),
  (94, 1019, 31, 104, 'San Diego', '2023-10-17'),
  (95, 1010, 198, 104, 'Austin', '2023-10-11'),
  (96, 1021, 148, 104, 'Kolkata', '2023-10-5'),
  (97, 1022, 174, 104, 'Mumbai', '2023-10-08'),
  (98, 1023, 148, 104, 'Delhi', '2023-10-09'),
  (99, 1014, 205, 104, 'Chennai', '2023-10-04'),
  (100, 1025, 239, 104, 'Bangalore', '2023-10-01'),
  
  (101, 1001, 250, 101, 'Portland', '2023-10-02'),
  (102, 1002, 240, 102, 'Portland', '2023-10-06'),
  (103, 1003, 125, 103, 'Portland', '2023-10-07'),
  (104, 1004, 225, 104, 'Portland', '2023-10-08'),
  (105, 1005, 198, 105, 'Portland', '2023-10-09'),
  (106, 1006, 332, 106, 'Portland', '2023-10-10'),
  (107, 1007, 288, 107, 'Portland', '2023-10-11'),
  (108, 1008, 171, 108, 'Portland', '2023-10-12'),
  (109, 1009, 220, 109, 'Portland', '2023-10-13'),
  (110, 1010, 318, 110, 'Portland', '2023-10-14'),
  (111, 1011, 156, 111, 'Portland', '2023-10-15'),
  (112, 1012, 710, 112, 'Portland', '2023-10-16'),
  (113, 1013, 690, 113, 'Portland', '2023-10-17'),
  (114, 1014, 658, 114, 'Portland', '2023-10-18'),
  (115, 1015, 452, 115, 'Portland', '2023-10-19'),
  (116, 1016, 175, 116, 'Portland', '2023-10-20'),
  (117, 1017, 585, 117, 'Portland', '2023-10-21'),
  (118, 1018, 360, 118, 'Portland', '2023-10-22'),
  (119, 1019, 485, 119, 'Portland', '2023-10-23'),
  (120, 1020, 198, 120, 'Portland', '2023-10-24'),
  (121, 1021, 148, 121, 'Portland', '2023-10-24'),
  (122, 1022, 154, 122, 'Portland', '2023-10-25'),
  (123, 1023, 147, 123, 'Portland', '2023-10-26'),
  (124, 1024, 245, 124, 'Portland', '2023-10-27'),
  (125, 1025, 249, 125, 'Portland', '2023-10-27');
-- TO SEE THE TABLE ENTRIES **************************

SELECT *
FROM truck ;

SELECT *
FROM city ;

SELECT *
FROM customer ;

SELECT *
FROM shipment ;


-- ASSIGNMENT 8 *************************************************************************************************************
-- ****************************************************************************************************************************


-- 1.) Give names of customer who have sent packages (shipments) to Kolkata, Chennai AND Mumbai

SELECT DISTINCT c.cust_name		-- distinct beacause One customer may send to different cities
FROM customer AS c
JOIN shipment s ON c.cust_id = s.cust_id
WHERE s.destination IN ('Kolkata', 'Chennai', 'Mumbai');


-- 2.) List the names of the driver who have delivered shipments weighing over 200 pounds.

SELECT DISTINCT t.driver_name
FROM truck t
JOIN shipment s ON t.truck_no = s.truck_no
WHERE s.weight > 200;

-- 3.) Retrieve the maximum and minimum weights of the shipments. Rename the output as Max_Weight and Min_Weight respectively.

SELECT
  MAX(weight) AS Max_Weight,
  MIN(weight) AS Min_Weight
FROM shipment;

-- 4.) For each customer, what is the average weight of package sent by the customer?

SELECT c.cust_id,
	   c.cust_name, 
       AVG(s.weight) AS Average_Weight
FROM customer AS c
JOIN shipment AS s ON c.cust_id = s.cust_id
GROUP BY c.cust_id;

-- 5.) List the names and populations of cities that have received a shipment weighing over 100 pounds.

SELECT DISTINCT ct.city_name, ct.population
FROM city AS ct   -- c is taken for customer
JOIN shipment s ON ct.city_name = s.destination
WHERE s.weight > 100;
-- here we have used JOIN(inner join)  instead of LEFT JOIN because 
-- in left join , the cities that haven't received anything >100 will come up also

-- 6.) List cities that have received shipments from every customer

SELECT s.destination AS city_name , c.cust_name as CUSTOMER_NAME 
FROM shipment AS s
JOIN customer AS c ON c.cust_id = s.cust_id
GROUP BY s.destination
HAVING COUNT(DISTINCT s.cust_id) = (SELECT COUNT(DISTINCT cust_id) FROM customer);
-- here the total number of distinct customers in customer table , i.e. #customers = 
-- # distinct customers in shipment table , means every distinct customer available .


-- 7.) For each city, what is the maximum weight of a package sent to that city?

SELECT destination AS city_name, 
       MAX(weight) AS Max_Weight
FROM shipment
GROUP BY destination;



-- 8.) List the name and annual revenue of customers whose shipments have been delivered
--   by truck driver ‘PRAYAS MAZUMDER’.

SELECT DISTINCT c.cust_name, c.annual_revenue
FROM customer AS c
JOIN shipment AS s ON c.cust_id = s.cust_id
JOIN truck AS t ON s.truck_no = t.truck_no
WHERE t.driver_name = 'Prayas Mazumder';


-- 9.) List drivers who have delivered shipments to every city.

SELECT t.driver_name
FROM truck AS t
JOIN shipment AS s ON t.truck_no = s.truck_no
GROUP BY t.driver_name
HAVING COUNT(DISTINCT s.destination) = (SELECT COUNT(*) FROM city);


-- 10.) For each city, with population over 1 million, what is the minimum weight of a
-- package sent to that city.

SELECT s.destination AS city_name, 
       MIN(s.weight) AS Min_Weight
FROM shipment AS s
JOIN city AS c ON s.destination = c.city_name
WHERE c.population > 10000000	-- 1 million
GROUP BY s.destination;

SELECT * from city
where city.population > 10000000; 
