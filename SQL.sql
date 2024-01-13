CREATE TABLE LOCATIONS(
    LocationId INT PRIMARY KEY IDENTITY(1,1), 
    LocationName VARCHAR(255),
    NoOfVisits INT CHECK(NoOfVisits>=0));

INSERT INTO LOCATIONS VALUES('Midtown', 15);
INSERT INTO LOCATIONS VALUES('Cabbagetown', 8);
INSERT INTO LOCATIONS VALUES('EastView', 3);
INSERT INTO LOCATIONS VALUES('Trafalgar', 2);
INSERT INTO LOCATIONS VALUES('Square One', 20);
SELECT * FROM LOCATIONS;

CREATE TABLE LOCATION_DESC(
  LocationDescId INT IDENTITY(1,1),
  LocationId INT NOT NULL,
  PRIMARY KEY(LocationDescId, LocationId),
  FOREIGN KEY(LocationId) REFERENCES LOCATIONS(LocationId),
  Address VARCHAR(255),
  Tel BIGINT CHECK(Tel BETWEEN 1000000000 AND 9999999999),
  Email VARCHAR(255),
  AMENTY VARCHAR(50),
  CoachId INT NOT NULL,
  FOREIGN KEY(CoachId) REFERENCES COACHES(CoachId));

INSERT INTO LOCATION_DESC VALUES(1, 'Midtown, Toronto ON', 7418529630, 'loc.gym@cxyz.com', 'Sauna', 1);
INSERT INTO LOCATION_DESC VALUES(1, 'Midtown, Toronto ON', 7418529630, 'loc.gym@cxyz.com', 'Green Zone', 1);
INSERT INTO LOCATION_DESC VALUES(1, 'Midtown, Toronto ON', 7418529630, 'loc.gym@cxyz.com', 'Hot Yoga', 1);
INSERT INTO LOCATION_DESC VALUES(1, 'Midtown, Toronto ON', 7418529630, 'loc.gym@cxyz.com', 'Spinning', 1);
INSERT INTO LOCATION_DESC VALUES(1, 'Midtown, Toronto ON', 7418529630, 'loc.gym@cxyz.com', 'Pool', 1);
INSERT INTO LOCATION_DESC VALUES(1, 'Midtown, Toronto ON', 7418529630, 'loc.gym@cxyz.com', 'Sauna', 1);
INSERT INTO LOCATION_DESC VALUES(1, 'Midtown, Toronto ON', 7418529630, 'loc.gym@cxyz.com', 'Sauna', 3);
INSERT INTO LOCATION_DESC VALUES(1, 'Midtown, Toronto ON', 7418529630, 'loc.gym@cxyz.com', 'Sauna', 4);
INSERT INTO LOCATION_DESC VALUES(1, 'Midtown, Toronto ON', 7418529630, 'loc.gym@cxyz.com', 'Sauna', 5);
INSERT INTO LOCATION_DESC VALUES(4, 'Midtown, Toronto ON', 7418529630, 'loc.gym@cxyz.com', 'Sauna', 1);
INSERT INTO LOCATION_DESC VALUES(5, 'Midtown, Toronto ON', 7418529630, 'loc.gym@cxyz.com', 'Sauna', 1);

SELECT * FROM LOCATION_DESC;


CREATE TABLE COACHES(
  CoachId INT PRIMARY KEY IDENTITY(1,1),
  CoachFirstName VARCHAR(50),
  CoachLastName VARCHAR(50),
  Level INT NOT NULL CHECK(Level > 0),
  Rating INT CHECK(Rating BETWEEN 1 AND 5));

INSERT INTO COACHES VALUES('Sally', 'Thompson', 3, 5);
INSERT INTO COACHES VALUES('Adam', 'Levine', 2, 4);
INSERT INTO COACHES VALUES('Sayed', 'Shaikh', 1, 4);
INSERT INTO COACHES VALUES('Layla', 'Mendez', 5, 3);
INSERT INTO COACHES VALUES('Mark', 'Anthony', 10, 4);
INSERT INTO COACHES VALUES('Sander', 'Samuels', 3, 5);
SELECT * FROM COACHES;

CREATE TABLE COACH_DESC(
  CoachDescId INT IDENTITY(1,1),
  CoachId INT NOT NULL,
  PRIMARY KEY(CoachDescId, CoachId),
  FOREIGN KEY(CoachId) REFERENCES COACHES(CoachId),
  LocationId INT NOT NULL,
  FOREIGN KEY(LocationId) REFERENCES LOCATIONS(LocationId),
  Phylosophy VARCHAR(255),
  CertificateId INT,
  FOREIGN KEY(CertificateId) REFERENCES CERTIFICATES(CertificateId),
  ReferenceId INT,
  FOREIGN KEY(ReferenceId) REFERENCES REFERENCE(ReferenceId),
);

INSERT INTO COACH_DESC VALUES(1, 1, 'Live life, be healthy and strong', 1, 1);
INSERT INTO COACH_DESC VALUES(1, 1, 'Live life, be healthy and strong', 2, 1);
INSERT INTO COACH_DESC VALUES(1, 1, 'Live life, be healthy and strong', 3, 1);
INSERT INTO COACH_DESC VALUES(1, 1, 'Live life, be healthy and strong', 1, 2);
INSERT INTO COACH_DESC VALUES(1, 1, 'Live life, be healthy and strong', 1, 3);
INSERT INTO COACH_DESC VALUES(1, 4, 'Live life, be healthy and strong', 1, 3);
INSERT INTO COACH_DESC VALUES(1, 5, 'Live life, be healthy and strong', 1, 3);
SELECT * FROM COACH_DESC;


CREATE TABLE AMENITIES(
    AmenityName VARCHAR(50),
    LocationId INT NOT NULL,
    FOREIGN KEY(LocationId) REFERENCES LOCATIONS(LocationId));

INSERT INTO AMENITIES VALUES('Sauna', '1');
INSERT INTO AMENITIES VALUES('Green Zone', '1');
INSERT INTO AMENITIES VALUES('Hot Yoga', '1');
INSERT INTO AMENITIES VALUES('Spinning', '1');
INSERT INTO AMENITIES VALUES('Pool', '1');
SELECT * FROM AMENITIES;


CREATE TABLE CERTIFICATES(
    CertificateId INT PRIMARY KEY IDENTITY(1,1), 
    CertificateName VARCHAR(50));

INSERT INTO CERTIFICATES VALUES('Advanced Fit');
INSERT INTO CERTIFICATES VALUES('Bikram Yoga');
INSERT INTO CERTIFICATES VALUES('Massage III');
SELECT * FROM CERTIFICATES;


CREATE TABLE REFERENCE(
    ReferenceId INT PRIMARY KEY IDENTITY(1,1), 
    ClientFirstName VARCHAR(50),
    ClientLastName VARCHAR(50),
    Phone BIGINT CHECK(Phone BETWEEN 1000000000 AND 9999999999),
    Email VARCHAR(100));

INSERT INTO REFERENCE VALUES('Cathy', 'Long', 8759641202, 'cathy.long@xyz.com');
INSERT INTO REFERENCE VALUES('Trevor', 'Smith', 8794561230, 'trevor.smith@yyx.com');
INSERT INTO REFERENCE VALUES('Michael', 'Ross', 6547458512, 'michael.ross@lmn.com');
SELECT * FROM REFERENCE;

CREATE TABLE CLASSES(
ClassId INT PRIMARY KEY IDENTITY(1,1),
ClassName VARCHAR(255),
ClassTime TIME,
Price INT NOT NULL CHECK(Price > 0),
LocationId INT NOT NULL,
 FOREIGN KEY(LocationId) REFERENCES LOCATIONS(LocationId),
Room VARCHAR(50)
);

INSERT INTO CLASSES VALUES('Body Pump','09:50:00',10, 3, 'Big Studio');
INSERT INTO CLASSES VALUES('Hiit','09:50:00', 5, 1, 'Studio 1');
INSERT INTO CLASSES VALUES('Body Pump','10:20:00', 10, 1, 'Studio 1');
INSERT INTO CLASSES VALUES('Yoga','09:50:00', 8, 3, 'Small Studio');
SELECT * FROM CLASSES;




CREATE TABLE REVIEWS(
ReviewId INT PRIMARY KEY IDENTITY(1,1),
ReviewDate DATE,
Communication INT CHECK(Communication BETWEEN 1 AND 5),
Enthusiasm INT CHECK(Enthusiasm BETWEEN 1 AND 5),
Punctuality INT CHECK(Punctuality BETWEEN 1 AND 5),
CoachId INT NOT NULL,
FOREIGN KEY(CoachId) REFERENCES COACHES(CoachId)
);

INSERT INTO REVIEWS VALUES('2020-04-04', 4, 5, 2, 1);
INSERT INTO REVIEWS VALUES('2020-04-04', 3, 5, 3, 1);
INSERT INTO REVIEWS VALUES('2022-07-14', 4, 5, 3, 1);
SELECT * FROM REVIEWS;

SELECT * FROM LOCATIONS;
SELECT * FROM LOCATION_DESC;
SELECT * FROM COACHES;
SELECT * FROM COACH_DESC;
SELECT * FROM AMENITIES;
SELECT * FROM CERTIFICATES;
SELECT * FROM REFERENCE;
SELECT * FROM CLASSES;
SELECT * FROM REVIEWS;



SELECT * FROM LOCATIONS;

SELECT DISTINCT Address, Tel, Email FROM LOCATION_DESC WHERE LocationId=1;
SELECT DISTINCT Amenty FROM LOCATION_DESC WHERE LocationId=1;
SELECT DISTINCT LOCATION_DESC.CoachId, COACHES.CoachFirstName FROM LOCATION_DESC, COACHES WHERE COACHES.CoachId = LOCATION_DESC.CoachId AND LOCATION_DESC.LocationId=1;


SELECT * FROM COACHES;

SELECT * FROM COACH_DESC;
SELECT DISTINCT COACHES.CoachFirstName, COACHES.Level, COACHES.Rating, COACH_DESC.Phylosophy FROM COACH_DESC, COACHES WHERE COACHES.CoachId=COACH_DESC.CoachId AND COACHES.CoachFirstName='Sally';

SELECT DISTINCT COACH_DESC.CoachId, LOCATIONS.LocationName FROM LOCATIONS,COACH_DESC WHERE LOCATIONS.LocationId = COACH_DESC.LocationId AND COACH_DESC.CoachId=1;

SELECT DISTINCT COACH_DESC.CoachId, REFERENCE.ClientFirstName, REFERENCE.ClientLastName, REFERENCE.Phone, REFERENCE.Email FROM REFERENCE,COACH_DESC WHERE REFERENCE.ReferenceId=COACH_DESC.ReferenceId AND COACH_DESC.CoachId=1;