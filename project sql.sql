create database sql_project
use sql_project;

CREATE TABLE Passengers (
    Passenger_ID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    Gender CHAR(1),
    Phone VARCHAR(15),
    Email VARCHAR(50),
    Address VARCHAR(100)
);

CREATE TABLE Trains (
    Train_No VARCHAR(5) PRIMARY KEY,
    Train_Name VARCHAR(50) NOT NULL,
    Source VARCHAR(10) NOT NULL,
    Destination VARCHAR(10) NOT NULL,
    Type VARCHAR(20),
    Distance_KM INT
);

CREATE TABLE Stations (
    Station_Code VARCHAR(5) PRIMARY KEY,
    Station_Name VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Train_Routes (
    Train_No VARCHAR(5),
    Station_Code VARCHAR(5),
    Sequence_No INT,
    PRIMARY KEY (Train_No, Sequence_No),
    FOREIGN KEY (Train_No) REFERENCES Trains(Train_No),
    FOREIGN KEY (Station_Code) REFERENCES Stations(Station_Code)
);

CREATE TABLE Schedules (
    Train_No VARCHAR(5),
    Station_Code VARCHAR(5),
    Arrival TIME,
    Departure TIME,
    PRIMARY KEY (Train_No, Station_Code),
    FOREIGN KEY (Train_No) REFERENCES Trains(Train_No),
    FOREIGN KEY (Station_Code) REFERENCES Stations(Station_Code)
);

CREATE TABLE Seats (
    Train_No VARCHAR(5),
    Travel_Date DATE,
    Class VARCHAR(5),
    Total_Seats INT,
    Booked_Seats INT,
    PRIMARY KEY (Train_No, Travel_Date, Class),
    FOREIGN KEY (Train_No) REFERENCES Trains(Train_No)
);

CREATE TABLE Bookings (
    Booking_ID VARCHAR(10) PRIMARY KEY,
    Passenger_ID VARCHAR(5),
    Train_No VARCHAR(5),
    Travel_Date DATE,
    Class VARCHAR(5),
    Seat_No VARCHAR(5),
    Status VARCHAR(10),
    FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID),
    FOREIGN KEY (Train_No) REFERENCES Trains(Train_No)
);

CREATE TABLE Payments (
    Payment_ID VARCHAR(10) PRIMARY KEY,
    Booking_ID VARCHAR(10),
    Amount DECIMAL(10,2),
    Method VARCHAR(20),
    Status VARCHAR(10),
    FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID)
);

INSERT INTO Passengers VALUES
('P001','Ravi Kumar',28,'M','9876543210','ravi@gmail.com','Chennai'),
('P002','Priya Sharma',24,'F','9123456780','priya@gmail.com','Bangalore'),
('P003','Arjun Rao',32,'M','9988776655','arjun@gmail.com','Hyderabad'),
('P004','Sita Reddy',27,'F','9871122334','sita@gmail.com','Chennai'),
('P005','Karthik',29,'M','9123451234','karthik@gmail.com','Bangalore'),
('P006','Neha Patel',25,'F','9988771122','neha@gmail.com','Mumbai'),
('P007','Amit Singh',31,'M','9874432211','amit@gmail.com','Delhi'),
('P008','Ananya',22,'F','9123344556','ananya@gmail.com','Bangalore'),
('P009','Vikram',35,'M','9988112233','vikram@gmail.com','Hyderabad'),
('P010','Meena',28,'F','9876655443','meena@gmail.com','Chennai'),
('P011','Rohit',30,'M','9122788991','rohit@gmail.com','Delhi'),
('P012','Divya',26,'F','9988332211','divya@gmail.com','Mumbai'),
('P013','Suresh',33,'M','9877112233','suresh@gmail.com','Bangalore'),
('P014','Anjali',24,'F','9123456677','anjali@gmail.com','Chennai'),
('P015','Manish',29,'M','9988773344','manish@gmail.com','Hyderabad'),
('P016','Ritika',27,'F','9871234455','ritika@gmail.com','Delhi'),
('P017','Sandeep',31,'M','9123344112','sandeep@gmail.com','Bangalore'),
('P018','Pooja',23,'F','9988114455','pooja@gmail.com','Chennai'),
('P019','Nikhil',28,'M','9876677889','nikhil@gmail.com','Mumbai'),
('P020','Sneha',26,'F','9122788332','sneha@gmail.com','Bangalore'),
('P021','Harish',32,'M','9988775566','harish@gmail.com','Hyderabad'),
('P022','Rashmi',24,'F','9871123445','rashmi@gmail.com','Chennai'),
('P023','Vikas',29,'M','9123344778','vikas@gmail.com','Bangalore'),
('P024','Shreya',25,'F','9988115566','shreya@gmail.com','Mumbai'),
('P025','Kiran',30,'M','9876655778','kiran@gmail.com','Delhi');

INSERT INTO Trains VALUES
('12601','Chennai Express','MAS','SBC','Superfast',350),
('12602','Bangalore Mail','SBC','MAS','Mail',350),
('12603','Hyderabad SF','HYB','MAS','Superfast',700),
('12604','Mumbai Express','CSTM','MAS','Express',1200),
('12605','Delhi Mail','NDLS','MAS','Mail',2150),
('12606','Chennai SF','MAS','HYB','Superfast',700),
('12607','Bangalore Express','SBC','CSTM','Express',850),
('12608','Mumbai Mail','CSTM','SBC','Mail',1000),
('12609','Hyderabad Mail','HYB','SBC','Mail',600),
('12610','Delhi Express','NDLS','SBC','Express',2150),
('12611','Chennai Mail','MAS','CSTM','Mail',1200),
('12612','Bangalore SF','SBC','HYB','Superfast',700),
('12613','Mumbai SF','CSTM','HYB','Superfast',900),
('12614','Delhi SF','NDLS','HYB','Superfast',1500),
('12615','Chennai Express 2','MAS','SBC','Superfast',350),
('12616','Bangalore Mail 2','SBC','MAS','Mail',350),
('12617','Hyderabad SF 2','HYB','MAS','Superfast',700),
('12618','Mumbai Express 2','CSTM','MAS','Express',1200),
('12619','Delhi Mail 2','NDLS','MAS','Mail',2150),
('12620','Chennai SF 2','MAS','HYB','Superfast',700),
('12621','Bangalore Express 2','SBC','CSTM','Express',850),
('12622','Mumbai Mail 2','CSTM','SBC','Mail',1000),
('12623','Hyderabad Mail 2','HYB','SBC','Mail',600),
('12624','Delhi Express 2','NDLS','SBC','Express',2150),
('12625','Chennai Mail 2','MAS','CSTM','Mail',1200);

INSERT INTO Stations VALUES
('MAS','Chennai Central','Chennai'),
('SBC','Bangalore City','Bangalore'),
('HYB','Hyderabad','Hyderabad'),
('CSTM','Mumbai CST','Mumbai'),
('NDLS','New Delhi','Delhi'),
('CGL','Krishnagiri','Krishnagiri'),
('TPTY','Tirupati','Tirupati'),
('KRN','Kurnool','Kurnool'),
('SC','Secunderabad','Hyderabad'),
('BLR','Bangalore Cantonment','Bangalore'),
('CHG','Chengalpattu','Chennai'),
('PTA','Patna','Patna'),
('BPL','Bhopal','Bhopal'),
('AGR','Agra','Agra'),
('LKO','Lucknow','Lucknow'),
('AJM','Ajmer','Ajmer'),
('JP','Jaipur','Jaipur'),
('SUR','Surat','Surat'),
('VSK','Visakhapatnam','VSKP'),
('VZD','Vijayawada','Vijayawada'),
('MAO','Mangalore','Mangalore'),
('COA','Cochin','Cochin'),
('TIR','Tiruchirappalli','Tiruchirappalli'),
('ECR','Erode','Erode'),
('MDU','Madurai','Madurai');

INSERT INTO Train_Routes VALUES
('12601','MAS',1),('12601','CGL',2),('12601','SBC',3),
('12602','SBC',1),('12602','CGL',2),('12602','MAS',3),
('12603','HYB',1),('12603','KRN',2),('12603','MAS',3),
('12604','CSTM',1),('12604','MAO',2),('12604','MAS',3),
('12605','NDLS',1),('12605','BPL',2),('12605','MAS',3),
('12606','MAS',1),('12606','SC',2),('12606','HYB',3),
('12607','SBC',1),('12607','BLR',2),('12607','CSTM',3),
('12608','CSTM',1),('12608','SUR',2),('12608','SBC',3),
('12609','HYB',1),('12609','VSK',2),('12609','SBC',3);

INSERT INTO Schedules VALUES
('12601','MAS',NULL,'08:00'),('12601','CGL','11:00','11:10'),('12601','SBC','14:00',NULL),
('12602','SBC',NULL,'09:00'),('12602','CGL','12:00','12:10'),('12602','MAS','15:00',NULL),
('12603','HYB',NULL,'07:00'),('12603','KRN','11:00','11:15'),('12603','MAS','17:00',NULL),
('12604','CSTM',NULL,'06:00'),('12604','MAO','12:00','12:10'),('12604','MAS','20:00',NULL),
('12605','NDLS',NULL,'05:00'),('12605','BPL','12:00','12:15'),('12605','MAS','22:00',NULL),
('12606','MAS',NULL,'08:30'),('12606','SC','14:30','14:40'),('12606','HYB','18:00',NULL),
('12607','SBC',NULL,'07:30'),('12607','BLR','10:00','10:10'),('12607','CSTM','18:00',NULL),
('12608','CSTM',NULL,'09:00'),('12608','SUR','14:00','14:10'),('12608','SBC','20:00',NULL);

INSERT INTO Seats VALUES
('12601','2025-09-26','SL',72,40),('12601','2025-09-26','3A',50,30),
('12602','2025-09-26','SL',72,20),('12602','2025-09-26','3A',50,25),
('12603','2025-09-26','SL',80,60),('12603','2025-09-26','3A',60,40),
('12604','2025-09-26','SL',90,50),('12604','2025-09-26','3A',70,30),
('12605','2025-09-26','SL',100,60),('12605','2025-09-26','3A',80,50),
('12606','2025-09-26','SL',72,35),('12606','2025-09-26','3A',50,28),
('12607','2025-09-26','SL',85,45),('12607','2025-09-26','3A',60,30),
('12608','2025-09-26','SL',90,50),('12608','2025-09-26','3A',60,30),
('12609','2025-09-26','SL',80,55),('12609','2025-09-26','3A',50,35),
('12601','2025-09-27','SL',72,20),('12601','2025-09-27','3A',50,15),
('12602','2025-09-27','SL',72,25),('12602','2025-09-27','3A',50,10),
('12603','2025-09-27','SL',80,40),('12603','2025-09-27','3A',60,20),
('12604','2025-09-27','SL',90,45);

INSERT INTO Bookings VALUES
('B1001','P001','12601','2025-09-26','SL','S12','Booked'),
('B1002','P002','12601','2025-09-26','3A','A15','Booked'),
('B1003','P003','12602','2025-09-26','SL','S03','Booked'),
('B1004','P004','12602','2025-09-26','3A','A12','Booked'),
('B1005','P005','12603','2025-09-26','SL','S25','Booked'),
('B1006','P006','12603','2025-09-26','3A','A20','Booked'),
('B1007','P007','12604','2025-09-26','SL','S18','Booked'),
('B1008','P008','12604','2025-09-26','3A','A10','Booked'),
('B1009','P009','12605','2025-09-26','SL','S22','Booked'),
('B1010','P010','12605','2025-09-26','3A','A05','Booked'),
('B1011','P011','12606','2025-09-26','SL','S14','Booked'),
('B1012','P012','12606','2025-09-26','3A','A08','Booked'),
('B1013','P013','12607','2025-09-26','SL','S20','Booked'),
('B1014','P014','12607','2025-09-26','3A','A02','Booked'),
('B1015','P015','12608','2025-09-26','SL','S16','Booked'),
('B1016','P016','12608','2025-09-26','3A','A12','Booked'),
('B1017','P017','12609','2025-09-26','SL','S11','Booked'),
('B1018','P018','12609','2025-09-26','3A','A07','Booked'),
('B1019','P019','12601','2025-09-27','SL','S05','Booked'),
('B1020','P020','12601','2025-09-27','3A','A03','Booked'),
('B1021','P021','12602','2025-09-27','SL','S08','Booked'),
('B1022','P022','12602','2025-09-27','3A','A06','Booked'),
('B1023','P023','12603','2025-09-27','SL','S15','Booked'),
('B1024','P024','12603','2025-09-27','3A','A09','Booked'),
('B1025','P025','12604','2025-09-27','SL','S20','Booked');

INSERT INTO Payments VALUES
('PAY501','B1001',350,'UPI','Paid'),
('PAY502','B1002',700,'Card','Paid'),
('PAY503','B1003',350,'UPI','Paid'),
('PAY504','B1004',700,'Card','Paid'),
('PAY505','B1005',400,'UPI','Paid'),
('PAY506','B1006',750,'Card','Paid'),
('PAY507','B1007',360,'UPI','Paid'),
('PAY508','B1008',700,'Card','Paid'),
('PAY509','B1009',450,'UPI','Paid'),
('PAY510','B1010',800,'Card','Paid'),
('PAY511','B1011',350,'UPI','Paid'),
('PAY512','B1012',700,'Card','Paid'),
('PAY513','B1013',360,'UPI','Paid'),
('PAY514','B1014',700,'Card','Paid'),
('PAY515','B1015',400,'UPI','Paid'),
('PAY516','B1016',750,'Card','Paid'),
('PAY517','B1017',350,'UPI','Paid'),
('PAY518','B1018',700,'Card','Paid'),
('PAY519','B1019',360,'UPI','Paid'),
('PAY520','B1020',700,'Card','Paid'),
('PAY521','B1021',400,'UPI','Paid'),
('PAY522','B1022',750,'Card','Paid'),
('PAY523','B1023',350,'UPI','Paid'),
('PAY524','B1024',700,'Card','Paid'),
('PAY525','B1025',360,'UPI','Paid');

-- List all passengers with name, age, and phone.
SELECT Name, Age, Phone FROM Passengers;

-- Show all trains with train number, name, source, and destination.
SELECT Train_No, Train_Name, Source, Destination FROM Trains;

-- Display all stations in the city 'Bangalore'.
SELECT * FROM Stations WHERE City='Bangalore';

-- List all trains of type 'Superfast'.
SELECT * FROM Trains WHERE Type='Superfast';

-- Show all bookings for passenger 'Ravi Kumar'.
SELECT b.Booking_ID, b.Train_No, b.Travel_Date, b.Seat_No
FROM Bookings b
JOIN Passengers p ON b.Passenger_ID = p.Passenger_ID
WHERE p.Name='Ravi Kumar';

-- Find all Sleeper seats available for Train 12601 on 2025-09-26.
SELECT Total_Seats - Booked_Seats AS Available_Seats
FROM Seats
WHERE Train_No='12601' AND Travel_Date='2025-09-26' AND Class='SL';

-- List all passengers above 30 years.
SELECT * FROM Passengers WHERE Age > 30;

-- Find bookings with Status = 'Booked' for 26-Sep-2025.
SELECT * FROM Bookings WHERE Travel_Date='2025-09-26' AND Status='Booked';

-- List passengers whose name starts with 'P'.
SELECT * FROM Passengers WHERE Name LIKE 'P%';

-- Show trains whose distance is greater than 700 KM.
SELECT * FROM Trains WHERE Distance_KM > 700;

--  Show bookings with passenger name, train name, seat number, and class.
SELECT b.Booking_ID, p.Name AS Passenger, t.Train_Name, b.Seat_No, b.Class
FROM Bookings b
JOIN Passengers p ON b.Passenger_ID = p.Passenger_ID
JOIN Trains t ON b.Train_No = t.Train_No;

-- Display train schedule with train name, station name, arrival, and departure.
SELECT t.Train_Name, s.Station_Name, sc.Arrival, sc.Departure
FROM Schedules sc
JOIN Trains t ON sc.Train_No = t.Train_No
JOIN Stations s ON sc.Station_Code = s.Station_Code;

-- List all payments with passenger name, booking ID, amount, and status.
SELECT p.Name, pay.Booking_ID, pay.Amount, pay.Status
FROM Payments pay
JOIN Bookings b ON pay.Booking_ID = b.Booking_ID
JOIN Passengers p ON b.Passenger_ID = p.Passenger_ID;

-- Show train routes with train name, station name, and sequence number.
SELECT t.Train_Name, s.Station_Name, tr.Sequence_No
FROM Train_Routes tr
JOIN Trains t ON tr.Train_No = t.Train_No
JOIN Stations s ON tr.Station_Code = s.Station_Code
ORDER BY tr.Train_No, tr.Sequence_No;

-- Find passengers and their booked seat number, class, and train name.
SELECT p.Name, b.Seat_No, b.Class, t.Train_Name
FROM Bookings b
JOIN Passengers p ON b.Passenger_ID = p.Passenger_ID
JOIN Trains t ON b.Train_No = t.Train_No;

-- Find total seats booked per train on 2025-09-26.
SELECT Train_No, SUM(Booked_Seats) AS Total_Booked
FROM Seats
WHERE Travel_Date='2025-09-26'
GROUP BY Train_No;

-- Count number of bookings per passenger.
SELECT Passenger_ID, COUNT(*) AS Booking_Count
FROM Bookings
GROUP BY Passenger_ID;

-- Total payment received per train.
SELECT b.Train_No, SUM(pay.Amount) AS Total_Payment
FROM Payments pay
JOIN Bookings b ON pay.Booking_ID = b.Booking_ID
GROUP BY b.Train_No;

-- Average age of passengers traveling in '3A' class.
SELECT AVG(p.Age) AS Avg_Age
FROM Passengers p
JOIN Bookings b ON p.Passenger_ID = b.Passenger_ID
WHERE b.Class='3A';

-- Find maximum booked seats for any train on 2025-09-26.
SELECT MAX(Booked_Seats) AS Max_Booked
FROM Seats
WHERE Travel_Date='2025-09-26';

-- Update seat booked after a new booking.
UPDATE Seats
SET Booked_Seats = Booked_Seats + 1
WHERE Train_No='12601' AND Travel_Date='2025-09-26' AND Class='SL';

-- Cancel a booking and update seat availability.
UPDATE Bookings SET Status='Cancelled' WHERE Booking_ID='B1001';

-- Delete a payment record.
DELETE FROM Payments WHERE Payment_ID='PAY501';

-- Delete all bookings for a specific passenger.
DELETE FROM Bookings WHERE Passenger_ID='P001';

-- Update passenger phone number.
UPDATE Passengers SET Phone='9998887776' WHERE Passenger_ID='P002';

-- Create a view for all bookings with passenger and train details.
CREATE VIEW BookingDetails AS
SELECT b.Booking_ID, p.Name AS Passenger, t.Train_Name, b.Seat_No, b.Class, b.Status
FROM Bookings b
JOIN Passengers p ON b.Passenger_ID = p.Passenger_ID
JOIN Trains t ON b.Train_No = t.Train_No;

-- Select from view:
SELECT * FROM BookingDetails WHERE Class='SL';

-- Create a view for train seat availability.
CREATE VIEW SeatAvailability AS
SELECT Train_No, Travel_Date, Class, Total_Seats-Booked_Seats AS Available_Seats
FROM Seats;

-- Stored procedure to get total payment for a passenger
CALL TotalPayment('P001');

-- Trigger to automatically reduce seat availability after booking.
DELIMITER //
CREATE TRIGGER ReduceSeat AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Seats
    SET Booked_Seats = Booked_Seats + 1
    WHERE Train_No = NEW.Train_No AND Travel_Date = NEW.Travel_Date AND Class = NEW.Class;
END //
DELIMITER ;









