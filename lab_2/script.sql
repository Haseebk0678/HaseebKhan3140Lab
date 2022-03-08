CREATE TABLE Judges(
    Judge_ID text,
    Judge_Name text);
    .mode csv
    .import \Judges_Table.csv judges;

CREATE TABLE Car_Score(
   Car_ID int primary key,
   Car_Score int);
   .mode csv
   .import \Car_Score.csv Car;

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

-- Figuring out this rn
-- SELECT * FROM Rank GROUP BY Car_Make LIMIT 10;



-- Found on Stack Over
.mode csv
.output extract2.csv

SELECT *
    FROM (
        SELECT *, Rank() 
          over (Partition BY Car_Make
                ORDER BY Car_Rank DESC ) AS Rank
        FROM Rank
        ) rs WHERE Rank <= 3;



select Judge_ID, count(*) as c FROM Judges GROUP BY Judge_ID
