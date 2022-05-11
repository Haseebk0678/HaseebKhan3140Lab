DROP TABLE IF EXISTS Car_info; 
DROP TABLE IF EXISTS Cars;
DROP TABLE IF EXISTS Owners;
DROP TABLE IF EXISTS Judges;

-- using headers to make it easier to see
.header on
--data is of type csv
.mode csv

CREATE TABLE Car_info (
    Timestamp DATETIME,
    Email TEXT,
    Name TEXT,
    Year INT,
    Make TEXT,
    Model TEXT,
    Car_ID INT,
    Judge_ID TEXT,
    Judge_Name TEXT,
    Racer_Turbo INT,
    Racer_Supercharged INT,
    Racer_Performance INT,
    Racer_Horsepower INT,
    Car_Overall INT,
    Engine_Modifications INT,
    Engine_Performance INT,
    Engine_Chrome INT,
    Engine_Detailing INT,
    Engine_Cleanliness INT,
    Body_Frame_Undercarriage INT,
    Body_Frame_Suspension INT,
    Body_Frame_Chrome INT,
    Body_Frame_Detailing INT,
    Body_Frame_Cleanliness INT,
    Mods_Paint INT,
    Mods_Body INT,
    Mods_Wrap INT,
    Mods_Rims INT,
    Mods_Interior INT,
    Mods_Other INT,
    Mods_ICE INT,
    Mods_Aftermarket INT,
    Mods_WIP INT,
    Mods_Overall INT
);
.import \New_data.csv Car_info

-- bulk insert is only available in sql and not sqlite3

-- BULK INSERT Car_info
-- FROM 'C:\data\dataCSV.txt'
-- WITH
-- (
--    FIRSTROW = 2,
--    FIELDTERMINATOR = ',',
--    ROWTERMINATOR = '\n'
-- )
-- GO

 -- create a table that only have car information 
CREATE TABLE Cars(
    Car_ID INT PRIMARY KEY,
    Year INT,
    Make TEXT,
    Model TEXT
);
INSERT INTO Cars (Car_ID, Year, Make, Model) select Car_ID, Year, Make, Model from Car_info;


-- create a table that have owners information 
CREATE TABLE Owners(
    Car_ID INT PRIMARY KEY,
    Name TEXT,
    Email TEXT
);
INSERT INTO Owners (Car_ID, Name, Email)  select Car_ID, Name, Email from Car_info;


CREATE TABLE Judges(
    Timestamp datetime,
    Judge_ID text,
    Judge_Name text);
INSERT INTO Judges (Timestamp, Judge_ID, Judge_Name) select Timestamp, Judge_ID, Judge_Name from Car_info;

