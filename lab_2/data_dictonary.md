CREATE TABLE Car_Score(
   Car_ID int primary key,
   Car_Score int);
CREATE TABLE Cars(
   Car_ID int primary key,
   Car_Year int,
   Car_Make text,
   Car_Model text,
   Owner_Name text,
   Owner_Email text);
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
CREATE TABLE Rank(
   Ranking int,
   Car_ID int,
   Car_Year int,
   Car_Make text,
   Car_Model text);
CREATE TABLE Judges_New(
    Judge_ID text,
    Amount_Of_Times_Judges_Judged Int,
    min_Judge_Time time,
    max_Judge_Time time,
    Judge_Length_In_Minutes int,
    Average_Amount_Of_Minutes_Per_Case int
);