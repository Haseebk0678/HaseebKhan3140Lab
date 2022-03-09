sqlite3 Lab2DB
.headers on
.mode columns

DROP Table if exists Judges;
DROP TABLE IF EXISTS Car_Score;
DROP TABLE IF EXISTS Cars;
DROP TABLE IF EXISTS Car_Total; 
DROP TABLE IF EXISTS Car_Ranking;
DROP TABLE IF EXISTS Rank;
DROP TABLE IF EXISTS Judges_New;




CREATE TABLE Judges(
    Judge_Time text,
    Judge_ID text,
    Judge_Name text,
    Judge_Time_Min int
    );

.mode csv
.import \Judges_Table.csv Judges

CREATE TABLE Car_Score(
   Car_ID int primary key,
   Car_Score int);

.mode csv
.import \Car_Score.csv Car_Score

CREATE TABLE Cars(
   Car_ID int primary key,
   Car_Year int,
   Car_Make text,
   Car_Model text,
   Owner_Name text,
   Owner_Email text);
   
.mode csv
.import \Cars_Table.csv Cars

CREATE TABLE Car_Total(
   Car_ID int,
   Car_Year int,
   Car_Make text,
   Car_Model text,
   Car_Total int);

INSERT INTO Car_Total SELECT Cars.Car_ID, Cars.Car_Year, Cars.Car_Make, Cars.Car_Model, Car_Score.Car_Score FROM Cars, Car_Score WHERE Cars.Car_ID = Car_Score.Car_ID;


CREATE TABLE Car_Ranking(
   Car_ID int,
   Car_Year int,
   Car_Make text,
   Car_Model text,
   Car_Total int);

INSERT INTO Car_Ranking SELECT * FROM Car_Total ORDER BY Car_Total DESC;

CREATE TABLE Rank(
   Ranking int,
   Car_ID int,
   Car_Year int,
   Car_Make text,
   Car_Model text);

INSERT INTO Rank (Ranking, Car_ID, Car_Year,Car_Make,Car_Model) SELECT rowid, Car_ID,Car_Year,Car_Make,Car_Model FROM Car_Ranking;


.mode csv
.output extract1.csv
SELECT * FROM Rank;

.mode csv
.output extract2.csv


SELECT *
    FROM (
        SELECT *, Rank() 
          over (Partition BY Car_Make
                ORDER BY Ranking DESC ) AS Rank
        FROM Rank
        ) rs WHERE Rank <= 3;


CREATE TABLE Judges_New(
    Judge_ID text,
    Amount_Of_Times_Judges_Judged Int,
    min_Judge_Time time,
    max_Judge_Time time,
    Judge_Length_In_Minutes int,
    Average_Amount_Of_Minutes_Per_Case int
);



INSERT INTO Judges_New SELECT Judge_ID, count(*), min(Judge_Time), max(Judge_Time), max(Judge_Time_Min) - min(Judge_Time_Min), (max(Judge_Time_Min) - min(Judge_Time_Min))/count(*) FROM Judges GROUP BY Judge_ID;

.mode csv
.output extract3.csv

select * from Judges_New;


Drop table Judges;

