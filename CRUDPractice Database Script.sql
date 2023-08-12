CREATE DATABASE dbCRUDPractice

USE dbCRUDPractice

SELECT * FROM tblUser
TRUNCATE TABLE tblUser
CREATE TABLE tblUser
(
	ID INT PRIMARY KEY IDENTITY,
	Name VARCHAR(60),
	Email VARCHAR(60),
	Gender INT,
	Country INT,
	State INT,
	City INT,
	Hobbies VARCHAR(100)
)

ALTER TABLE tblUser ADD Password VARCHAR(10)

CREATE TABLE tblGender
(
	GID INT PRIMARY KEY IDENTITY,
	GName VARCHAR(6)
)

INSERT INTO tblGender(GName)VALUES('Male')
INSERT INTO tblGender(GName)VALUES('Female')
INSERT INTO tblGender(GName)VALUES('Other')

CREATE TABLE tblCountry
(
	CID INT PRIMARY KEY IDENTITY,
	CName VARCHAR(60)
)

INSERT INTO tblCountry(CName)VALUES('India')
INSERT INTO tblCountry(CName)VALUES('United States')

CREATE TABLE tblState
(
	SID INT PRIMARY KEY IDENTITY,
	CID INT,
	SName VARCHAR(60)
)

INSERT INTO tblState(CID, SName)VALUES(1, 'Delhi')
INSERT INTO tblState(CID, SName)VALUES(1, 'Haryana')
INSERT INTO tblState(CID, SName)VALUES(1, 'Uttar Paradesh')

INSERT INTO tblState(CID, SName)VALUES(2, 'Texas')
INSERT INTO tblState(CID, SName)VALUES(2, 'California')
INSERT INTO tblState(CID, SName)VALUES(2, 'Florida')

SELECT * FROM tblState

CREATE TABLE tblCity
(
	CityID INT PRIMARY KEY IDENTITY,
	SID INT,
	CityName VARCHAR(60)
)

INSERT INTO tblCity(SID, CityName)VALUES(1, 'North-Delhi')
INSERT INTO tblCity(SID, CityName)VALUES(1, 'South-Delhi')
INSERT INTO tblCity(SID, CityName)VALUES(1, 'West-Delhi')
INSERT INTO tblCity(SID, CityName)VALUES(2, 'Faridabad')
INSERT INTO tblCity(SID, CityName)VALUES(2, 'Sonipat')
INSERT INTO tblCity(SID, CityName)VALUES(2, 'Gurugram')
INSERT INTO tblCity(SID, CityName)VALUES(3, 'Lakhnow')
INSERT INTO tblCity(SID, CityName)VALUES(3, 'Varanasi')
INSERT INTO tblCity(SID, CityName)VALUES(3, 'Mathura')
INSERT INTO tblCity(SID, CityName)VALUES(4, 'Houston')
INSERT INTO tblCity(SID, CityName)VALUES(4, 'Dallas')
INSERT INTO tblCity(SID, CityName)VALUES(4, 'Austin')
INSERT INTO tblCity(SID, CityName)VALUES(5, 'Los Angeles')
INSERT INTO tblCity(SID, CityName)VALUES(5, 'San Diego')
INSERT INTO tblCity(SID, CityName)VALUES(5, 'San Jose')
INSERT INTO tblCity(SID, CityName)VALUES(6, 'Jacksonville')
INSERT INTO tblCity(SID, CityName)VALUES(6, 'Tampa')
INSERT INTO tblCity(SID, CityName)VALUES(6, 'West Palm Beach')

SELECT * FROM tblCity

CREATE TABLE tblHobbies
(
	HID INT PRIMARY KEY IDENTITY,
	HName VARCHAR(60)
)

INSERT INTO tblHobbies(HName)VALUES('Reading')
INSERT INTO tblHobbies(HName)VALUES('Traveling')
INSERT INTO tblHobbies(HName)VALUES('Coding')
INSERT INTO tblHobbies(HName)VALUES('Singing')
INSERT INTO tblHobbies(HName)VALUES('Cooking')
INSERT INTO tblHobbies(HName)VALUES('Other')

SELECT * FROM tblHobbies

CREATE PROC spBindGender
AS
BEGIN
	SELECT * FROM tblGender
END;

CREATE PROC spBindCountry
AS
BEGIN
	SELECT * FROM tblCountry
END;



ALTER PROC spBindState
( @cid int)
AS
BEGIN
	SELECT * FROM tblState WHERE CID = @cid
END;

CREATE PROC spBindCity
( @sid int)
AS
BEGIN
	SELECT * FROM tblCity WHERE SID = @sid
END;

CREATE PROC spBindHobbies
AS
BEGIN
	SELECT * FROM tblHobbies
END;

select * from tblUser
truncate table tblUser
CREATE PROC spInsertData
(
	@name varchar(60),
	@email varchar(60),
	@gender int,
	@country int,
	@state int,
	@city int,
	@hobbies varchar(100),
	@pass varchar(10)
)
AS
BEGIN
	INSERT INTO tblUser(Name, Email, Gender, Country, State, City, Hobbies, Password)
	Values(@name, @email, @gender, @country, @state, @city, @hobbies, @pass)
END;

CREATE PROC spCheckLoginCredentials
(
	@email VARCHAR(60),
	@password VARCHAR(60)
)
AS
BEGIN
	SELECT * FROM tblUser WHERE Email = @email AND Password = @password
END;

Alter PROC spGetUserRecord
(
	@id int
)
AS
BEGIN
	SELECT * FROM tblUser
	Join tblGender on Gender = GID
	Join tblCountry on Country = CID
	Join tblState on State = SID
	Join tblCity on City = CityID
	WHERE ID = @id
END;

Alter PROC spDeleteRecord
( @id int )
as
begin
	delete from tblUser where ID = @id
end;

CREATE PROC spCheckDuplicacy
(
	@email varchar(60)
)
as
begin
	select * from tblUser where Email = @email
end;

Create proc spUpdatePass
(
	@new_pass varchar(60),
	@id int
)
as
begin
Update tblUser set Password = @new_pass where ID = @id
end;