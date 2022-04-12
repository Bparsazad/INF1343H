


CREATE SCHEMA LAO_Cases;
USE LAO_Cases;

DROP TABLE IF EXISTS CASES;
CREATE TABLE Cases (
  Case_ID VARCHAR(9) NOT NULL,
  Client_ID VARCHAR(9) NOT NULL,
  Staff_ID VARCHAR(9) NOT NULL, 
  Court_ID VARCHAR(9) NOT NULL,
  Vendor_ID VARCHAR(9) NOT NULL, 
  Location_ID VARCHAR(9) NOT NULL,
  Case_Managed CHAR(1),
  Case_Status CHAR(1),
  Creation_Date DATETIME,
  Case_Type CHAR(2),
  Court_Date DATE,
  Court_Decision VARCHAR(25),
  Decistion_Date DATE,
  PRIMARY KEY (Case_ID)
);

TRUNCATE TABLE CASES;
INSERT INTO Cases 
(Case_ID, Client_ID, Staff_ID, Court_ID, Vendor_ID, Location_ID, Case_Managed , Case_Status , Creation_Date          , Case_Type , Court_Date, Court_Decision, Decistion_Date)
VALUES 
 (1     ,'1'        ,'1'       ,'1'       ,'1'        ,'1'          ,'Y'           ,'A'           ,'2015-01-01 15:10:31'  ,'CR'       ,'2019-09-01','GUILTY'      ,'2019-09-10' ),
 (2     ,'2'        ,'2'       ,'2'       ,'1'        ,'2'          ,'Y'           ,'A'           ,'2019-09-01 09:00:00'  ,'FA'       ,'2022-05-01',''            ,NULL ),
 (3     ,'2'        ,'3'       ,'3'       ,'2'        ,'3'          ,'N'           ,'A'           ,'2019-10-01 11:11:11'  ,'CR'       ,'2022-10-05',''            ,NULL )
;
SELECT * from Cases;


/*DROP TABLE Vendor; */
CREATE TABLE Vendor (
Vendor_ID VARCHAR(9) NOT NULL,
Vendor_Name VARCHAR(25),
Tier_Rate CHAR(1),
Gender  CHAR(1),
Private_Bar Char(1),
Effective_Date  DATETIME,
Effective_Status CHAR(1),
Unit_Number  VARCHAR(3),
Street_Number VARCHAR(10),
Street_Name VARCHAR(25),
City VARCHAR(25),
Province  VARCHAR(25),
Country VARCHAR(25),
Postal_Code CHAR(6),
PRIMARY KEY (VENDOR_ID)
);

INSERT INTO VENDOR
(Vendor_ID, Vendor_Name , Tier_Rate , Gender , Private_Bar, Effective_Date , Effective_Status ,Unit_Number ,Street_Number , Street_Name ,City     ,Province , Country ,Postal_Code)
 VALUES
 (1       ,'John Smith' , '1'        ,'M'     ,'Y'          ,'2001-01-10'   , 'A'              , '10'       ,'1010'        ,'Young'      ,'Toronto','Ontario', 'Canada' ,'M4Y3C1'),
 (2       ,'Roger Major', '2'        ,'M'     ,'Y'          ,'2001-01-10'   , 'A'              , '11'       ,'1011'        ,'Young'      ,'Toronto','Ontario', 'Canada' ,'M4Y3C1'),
 (3       ,'Amy Smith'  , '3'        ,'F'     ,'Y'          ,'2001-01-10'   , 'A'              , '12'       ,'1012'        ,'Young'      ,'Toronto','Ontario', 'Canada' ,'M4Y3C1')
;

SELECT * FROM VENDOR;

/*DROP TABLE Vendor_Phone; */
CREATE TABLE Vendor_Phone (
Vendor_ID VARCHAR(9) NOT NULL,
Phone_Number CHAR(10),
PRIMARY KEY (VENDOR_ID, Phone_number)
);

INSERT INTO Vendor_Phone 
(Vendor_ID, Phone_number)
Values
(1,'6477717733'),
(1,'6477717734'),
(3,'6477717789')
;
SELECT * FROM VENDOR_phone;




/*DROP TABLE Area_Office; */
CREATE TABLE Area_Office  (
Office_ID VARCHAR(9) NOT NULL,
Office_Name VARCHAR(25),
Unit_Number VARCHAR(3),
Street_Number VARCHAR(10),
Street_Name VARCHAR(25),
City VARCHAR(25),
Province VARCHAR(25),
Country VARCHAR(25),
Postal_Code CHAR(6),
PRIMARY KEY (OFFICE_ID)
);

INSERT INTO Area_Office
(Office_ID, Office_Name           , Unit_Number,Street_Number, Street_Name, City    , Province, Country, Postal_Code )
VALUES
(1        ,'Toronto Office'       ,'10'        ,'1010'       ,'North York','Toronto','Ontario','Canada','M1M1M1'),
(2        ,'North Ontarion Office','10'        ,'1011'       ,'North Ontario','Ottowa','Ontario','Canada','N1N2R1'),
(3        ,'South Ontarion Office','10'        ,'1012'       ,'West Ontario','Windsor','Ontario','Canada','S1S1W1')
;

SELECT * FROM Area_Office;
/*drop table COS;*/
CREATE TABLE COS (
Case_ID VARCHAR(9),
Termination_Date DATETIME,
COS_Reason VARCHAR(25),
Case_Manager_Note VARCHAR(256),
Vendor_Note VARCHAR(256),
Client_Note VARCHAR(256),
Primary Key (Case_ID,Termination_Date)
);
TRUNCATE TABLE COS;
INSERT INTO COS
(Case_ID, Termination_Date, COS_Reason, Case_Manager_Note , Vendor_Note, Client_Note)
VALUES
(1      ,'2015-02-01'     ,'not satisfied client', 'aggreed to change','very busy to care','not satisfied at all'),
(1      ,'2015-05-01'     ,'not satisfied vendor', 'aggreed to change','not able to help the client','unhappy with this vendor'),
(2      ,'2015-02-01'     ,'status changed', 'Lawyer address changed','far away from the cilent ','aggreed to change')
;
SELECT * FROM COS;


/****************************************************************************************************/
/****************************************************************************************************/
/****************************************************************************************************/


/*drop table charge;*/
CREATE TABLE CHARGE
	(Case_ID VARCHAR(9) NOT NULL,
    Charge_ID VARCHAR(9) NOT NULL,
    Charge_Name VARCHAR(25) NOT NULL,
    Effective_Date DATETIME,
    Effective_Status CHAR(1) NOT NULL,
    Primary Key(Case_ID, Charge_ID)
    );

INSERT INTO CHARGE
VALUES 
(1, 1 ,'Assault'	   ,'2015-01-01 15:10:31', 'A'),
(1, 2 ,'Sexual_Assault','2015-02-01 15:10:31', 'A'),
(2, 3 ,'Robbery'       ,'2016-01-01 15:10:31', 'A');


DROP TABLE COURT;
CREATE TABLE COURT
	(Court_ID VARCHAR(9) NOT NULL, 
    Location_ID VARCHAR(9) NOT NULL, 
    Court_Name VARCHAR(25) NOT NULL, 
    Court_level VARCHAR (25), 
    Unit_Number VARCHAR(3),
    Street_Number VARCHAR(25),
    Street_Name VARCHAR(25),
    City VARCHAR(25),
    Province VARCHAR(25),
    Country VARCHAR(25),
    Postal_Code CHAR(6),
    Primary Key(Court_ID)
    ); 

INSERT INTO COURT VALUES
(1, 1,'Ontario Court','Provincial Court','10'        ,'1010'       ,'North York','Toronto','Ontario','Canada','M1G1M6'),
(2, 3,'Supr. Court','Provincial Court','10'          ,'112'        ,'East York','Toronto','Ontario','Canada','M3S1H3'),
(3, 2,'Appeal Court','Provincial Court','10'         ,'13'         ,'Downtown','Barie','Ontario','Canada','M1M1M1');
    

CREATE TABLE LOCATION
	(Location_ID VARCHAR (9) NOT NULL,
    Location_Name VARCHAR(25) NOT NULL,
    District VARCHAR(25),
    Region VARCHAR(25),
    Effective_Date DATETIME,
    Effective_Status CHAR(1) NOT NULL,
    Primary Key (Location_ID)
    ); 

INSERT INTO LOCATION VALUES
(1,'North York','Toronto','GTA','1990-01-01 15:10:31','A'),
(2,'East York','Toronto','GTA','1990-01-01 15:10:31','A'),
(3,'Downtown','Barie','GTA','1990-01-01 15:10:31','A');



/***********************************************************************************************/
/***********************************************************************************************/
/***********************************************************************************************/
drop table clients;
CREATE TABLE Clients (
	Client_ID varchar(9) NOT NULL,
	Client_F_Name varchar(25) NOT NULL,
	Client_M_Name varchar(25),
	Client_L_Name varchar(25) NOT NULL, 
	Birth_Date Date,
	Aborigine char(1) CHECK (Aborigine In ('Y', 'N')),
	Unit_Number varchar(3),
	Street_Number varchar(10),
	Street_Name varchar(3),
	City varchar(25),
	Province varchar(25),
	Country varchar(25),
	Postal_Code char(6),
	PRIMARY KEY (Client_ID)
);

CREATE TABLE Client_Phone
(
Client_ID VARCHAR(9) Not Null,
Phone_Number CHAR(12),
PRIMARY KEY (CLIENT_ID,PHONE_NUMBER)
);

INSERT INTO Clients
(Client_ID	, Client_F_Name	, Client_M_Name	, Client_L_Name	, Birth_Date	, Aborigine	, Unit_Number	, Street_Number	, Street_Name	, City			, Province	, Country	, Postal_Code)
VALUES
(1			,'Richard'		,'M'			,'Nixon'		,'1913-01-09'	,'N'		,'100'			,'600'			,'Pen'			,'Washington'	,'DC'		,'USA'		,NULL			),
(2			,'Dwight'		,'D'			,'Eisenhower'	,'1890-10-14'	,'N'		,'101'			,'600'			,'Pen'			,'Washington'	,'DC'		,'USA'		,NULL			),
(3			,'John'			,'Q'			,'Adams'		,'1767-07-11'	,'N'		,'102'			,'600'			,'Pen'			,'Washington'	,'DC'		,'USA'		,NULL			),
(4			,'Barack'		,'H'			,'Obama'		,'1961-08-04'	,'N'		,'103'			,'600'			,'Pen'			,'Washington'	,'DC'		,'USA'		,'20500'		),
(5			,'James'		,'A'			,'Garfield'		,'1931-11-19'	,'N'		,'104'			,'600'			,'Pen'			,'Washington'	,'DC'		,'USA'		,NULL			)
;

SELECT * FROM Clients;

drop table staff;
CREATE TABLE Staff (
	Staff_ID varchar(9) NOT NULL,
    Office_ID varchar(9) NOT NULL,
    Staff_Name varchar(25),
    Gender char(1) CHECK (Gender In ('M', 'F', 'U', 'O')),
    Salary_Rate Decimal(6,0) NOT NULL,
    SIN Char(9) NOT NULL,
    Birth_Date date,
    Hiring_Date date NOT NULL,
    Leave_Date date,
    Effective_Status Varchar(25),
    PRIMARY KEY (Staff_ID)
);

INSERT INTO Staff
(Staff_ID	, Office_ID	, Staff_Name			, Gender	, Salary_Rate	, SIN		, Birth_Date	, Hiring_Date	, Leave_Date	, Effective_Status	)
VALUES
(1			,1			,'John A Macdonald'		,'M'		,100000			,'000000000','1815-01-01'	,'1867-07-01'	,'1891-06-06'	, 'Deceased'		),
(2			,1			,'Alexander Mackenzie'	,'M'		,100000			,'000000001','1822-01-01'	,'1873-11-07'	,'1878-10-06'	, 'Deceased'		),
(3			,2			,'Wilfrid Laurier'		,'M'		,100000			,'000000007','1841-01-01'	,'1896-11-07'	,'1911-10-06'	, 'Deceased'		),
(4			,2			,'Joe Clark'			,'M'		,100000			,'000000016','1939-01-01'	,'1979-06-04'	,'1980-03-2'	, 'Alive'			),
(5			,3			,'Justin Trudeau'		,'M'		,100000			,'000000023','1971-01-01'	,'2015-11-04'	,NULL			, 'Alive'			)
;

Select * FROM Staff;


CREATE TABLE Advice(
	Advice_ID varchar(9) NOT NULL,
    Client_ID varchar(9) NOT NULL,
    Staff_ID varchar(9) NOT NULL,
    Advice_Title varchar(25) NOT NULL,
    Advice_Type varchar(2) NOT NULL CHECK (Advice_Type In ('CR', 'FA', 'CI', 'RE')),
    Creation_Date date NOT NULL,
    PRIMARY KEY (Advice_ID)
);

INSERT INTO Advice
(Advice_ID	, Client_ID	, Staff_ID	, Advice_Title	, Advice_Type	, Creation_Date	)
VALUES
(1			,1			,1			,''				,'CR'			,'2021-01-01'	),
(2			,2			,1			,''				,'CR'			,'2021-02-02'	),
(3			,3			,1			,''				,'FA'			,'2021-03-03'	),
(4			,5			,4			,''				,'FA'			,'2021-04-04'	),
(5			,5			,5			,''				,'RE'			,'2021-05-05'	)
;

Select * FROM Advice;

/************ QUERIES **********************/

SELECT A.CASE_ID,
	   A.CLIENT_ID,
       A.VENDOR_ID,
       A.CASE_MANAGED,
       B.TERMINATION_DATE
FROM CASES A,COS B WHERE A.CASE_ID = B.CASE_ID AND A.VENDOR_ID = '1';

SELECT * FROM VENDOR WHERE GENDER = 'M';

SELECT * 
FROM CASES A, VENDOR B, COURT C
WHERE A.VENDOR_ID = B.VENDOR_ID AND A.COURT_ID = C.COURT_ID;

/*Find all Advice from Staff who work at Office 1*/
SELECT *
FROM Advice A, Staff B WHERE A.Staff_ID = B.Staff_ID AND B.Office_ID = 1;

/*Find all female staff*/
SELECT * FROM Staff WHERE Gender = 'F';

/*Find all clients born before Canada's Confederation*/
Select * FROM Clients WHERE Birth_Date < '1867-07-01';


Select * from  CHARGE WHERE Case_ID = 1 and Charge_ID = 1; 

select * FROM LOCATION WHERE Location_ID = 1; 

SELECT C.Case_ID,C.Location_ID,L.Region,L.District FROM Cases C,Location L
WHERE C.Location_ID = L.Location_ID and C.Location_ID = 1;


/************************* VIEWS *************************/
DROP VIEW IF EXISTS CASES_OF_VENDOR_1;
CREATE VIEW CASES_OF_VENDOR_1 AS
SELECT A.CASE_ID,
	   A.CLIENT_ID,
       A.VENDOR_ID,
       A.CASE_MANAGED,
       B.TERMINATION_DATE
FROM CASES A,COS B WHERE A.CASE_ID = B.CASE_ID AND A.VENDOR_ID = '1'
;

DROP VIEW IF EXISTS MALE_VENDORS;
CREATE VIEW MALE_VENDORS AS
SELECT Vendor_Name, TIER_RATE FROM VENDOR WHERE GENDER = 'M'
;

DROP VIEW IF EXISTS VIEW3;
CREATE VIEW TORONTO_OFFICES AS
SELECT OFFICE_ID,OFFICE_NAME FROM AREA_OFFICE WHERE CITY = 'Toronto';


-- first, to see the cases at a specific court (1) 
CREATE VIEW Court_1_Docket AS
SELECT C.Case_ID, C.Client_ID, C.Staff_ID, C.Vendor_ID
FROM CASES AS C, COURT AS CT 
WHERE C.Court_ID = CT.Court_ID
AND CT.Court_ID = 1; 

-- to check updates on the number of cases for a specific offence e.g. assault 
CREATE VIEW Assault_cases AS 
SELECT Case_ID, COUNT(*) AS number_of_assault_offences
FROM CHARGE
WHERE Charge_Name = 'Assault'
GROUP BY CASE_ID; 

SELECT * FROM Assault_cases;

-- to see all the courts in a specific location 1
CREATE VIEW Location_1_Courts AS 
SELECT C.Court_Name, C.Court_Level, C.Unit_Number, C.Street_Number, C.Street_Name
FROM Court as C, Location as L
WHERE C.Location_ID = L.Location_ID
AND L.Location_ID = 1; 


CREATE VIEW Advice_Office AS
SELECT 	A.Advice_ID,
		A.Advice_Title,
        A.Advice_Type
FROM Advice A, Staff B WHERE A.Staff_ID = B.Staff_ID AND B.Office_ID = 1;

CREATE VIEW FEMALE_STAFF AS
SELECT Staff_Name FROM Staff WHERE Gender = 'F';

CREATE VIEW PRE_CONFEDORATION_CLIENTS AS
Select Client_F_Name, Client_M_Name, Client_L_Name, Birth_Date FROM Clients WHERE Birth_Date < '1867-07-01';



/********************************* TRIGGER *******************************/

DROP TRIGGER IF EXISTS CASE_STATUS;
CREATE TRIGGER CASE_STATUS
AFTER INSERT ON COS
FOR EACH ROW
UPDATE CASES
	SET CASE_STATUS = 'I'
WHERE CASE_ID = NEW.CASE_ID;


CREATE TRIGGER Charge_Status AFTER INSERT ON CASES
FOR EACH ROW 
		UPDATE Charge 
		SET Charge.Effective_Status = CASES.Case_Status 
		WHERE CASES.Case_ID = Charge.Case_ID;  

/*Increase staff Salary for every Advice client they have*/

CREATE TRIGGER INCREASE_PAY
AFTER INSERT ON Advice
FOR EACH ROW
UPDATE Client
	SET Salary_Rate = Salary_Rate + 1
    WHERE Staff_ID = NEW.Staff_ID;


/************************ FOREIGN KEYS **************************************/
ALTER TABLE `lao_cases`.`cases` 
  ADD CONSTRAINT `FK_VENDOR_ID`
  FOREIGN KEY (`Vendor_ID`)
  REFERENCES `lao_cases`.`vendor` (`Vendor_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `lao_cases`.`cases` 
  ADD CONSTRAINT `FK_Staff_Case_ID`
  FOREIGN KEY (`Staff_ID`)
  REFERENCES `lao_cases`.`Staff` (`Staff_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  ALTER TABLE `lao_cases`.`cases` 
  ADD CONSTRAINT `FK_Client_Case_ID`
  FOREIGN KEY (`Client_ID`)
  REFERENCES `lao_cases`.`Clients` (`Client_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  ALTER TABLE `lao_cases`.`cases` 
ADD CONSTRAINT `FK_COURT_ID`
  FOREIGN KEY (`COURT_ID`)
  REFERENCES `lao_cases`.`COURT` (`COURT_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `lao_cases`.`cases` 
  ADD CONSTRAINT `FK_LOCATION_ID`
  FOREIGN KEY (`Location_ID`)
  REFERENCES `lao_cases`.`LOCATION` (`Location_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `lao_cases`.`cos` 
  ADD CONSTRAINT `FK_CASE_ID`
  FOREIGN KEY (`CASE_ID`)
  REFERENCES `lao_cases`.`CASES` (`CASE_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  /*
  ALTER TABLE `lao_cases`.`CHARGE` 
  ADD CONSTRAINT `FK_CHARGE_ID`
  FOREIGN KEY (`CHARGE_ID`)
  REFERENCES `lao_cases`.`CHARGE_LIST` (`CHARGE_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  */
  
  ALTER TABLE `lao_cases`.`VENDOR_PHONE` 
  ADD CONSTRAINT `FK_VENDOR_PHONE`
  FOREIGN KEY (`VENDOR_ID`)
  REFERENCES `lao_cases`.`VENDOR` (`VENDOR_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  ALTER TABLE `lao_cases`.`CHARGE` 
  ADD CONSTRAINT `FK_CHARGE_CASE_ID`
  FOREIGN KEY (`CASE_ID`)
  REFERENCES `lao_cases`.`CASES` (`CASE_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

/*********************************************************/

ALTER TABLE Staff
ADD CONSTRAINT FK_OFFICE_ID
	FOREIGN KEY (Office_ID)
    REFERENCES Area_Office (Office_ID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;
    
ALTER TABLE Advice
ADD CONSTRAINT FK_CLIENT_ID
	FOREIGN KEY (Client_ID)
    REFERENCES Clients (Client_ID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;
    
ALTER TABLE Advice
ADD CONSTRAINT FK_STAFF_ID
	FOREIGN KEY (STAFF_ID)
    REFERENCES Staff (STAFF_ID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;

ALTER TABLE Client_phone
ADD CONSTRAINT FK_client_phone
	FOREIGN KEY (Client_ID)
    REFERENCES Clients (Client_ID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;
    
    
    /***********************************************************************************/
    /************************ Normalization *******************************************/
USE LAO_cASES;
select * from charge;

/*DROP TABLE CHARGE_LIST;        */
CREATE TABLE CHARGE_LIST
	(Charge_ID VARCHAR(9) NOT NULL,
    Charge_Name VARCHAR(25) NOT NULL,
    Primary Key (Charge_ID)
    );
    
INSERT INTO CHARGE_LIST VALUES
(1,'Assault'),
(2,'Sexual_Assault'),
(3,'Robbery'),
(4,'Murder'),
(5,'Weapon Offenses')
;

ALTER TABLE CHARGE
ADD CONSTRAINT FK_CHARGE_LIST
	FOREIGN KEY (Charge_ID)
    REFERENCES CHARGE_LIST (Charge_ID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE;
