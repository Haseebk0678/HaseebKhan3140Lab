# Lab2

## Report

Using Sqlite I preformed the following

### Part 1

o Cars table with primary key Car_ID and contains car information such as Year, Make, Model as well as owner information

o Judges table that contains Judge_ID, Judge Name, Judge_Time, Judge_time_hour_in_min, and Judge_Time_min

o Car_Score table that contains the scores for each car with Car_ID as the primary key

### Part 2
2. Using the database created with the tables noted above:


o Write a single SQLite3 query that shows the results for all cars (that query the correct tables). Compute the total score for each row. The output should show (ranking, car_id, year, car make, car model). Present the list in descending order using the total column and make sure you add a new ranking column. Export the results a file named extract1.csv. (Note: you may have to write multiple queries to figure out the single query)

o Write an SQLite3 query that shows for each Car Make grouping: a list of the top 3 cars of that Make. The output should contain at minimum the following fields: ranking, car make, car_id, total score. Export the results to a file named extract2.csv

### Part 3

3. Update the Judges table with the following information. You will need to create new fields:

o Counts the number of cars each judge has judged for the day

o A field that shows the ‘start’ or the first timestamp of judging for the day

o A field that shows the ‘end’ or the final timestamp of judging for the day

o The duration between start and end times

o An ‘average’ speed score that is a calculated as duration divided by number of cars judged.

o Try to complete this in a single query if you can.


## Raw data
We were given a data set named [data.csv](https://gist.github.com/katychuang/d66a59b6db4e59c16efd4c42ad411f8e/5e68894febe276fd763dcc8e28fa6ad2657f7d7f) with a list of different variable names that can be seen in the link above. Using awk I created three more csv named [Car_Score](https://github.com/Haseebk0678/HaseebKhan3140Lab/blob/main/lab_2/Car_Score.csv), []




## Dependencies

Ran on Mac

## Other notes

For some reason if I copy and paste everything that I have in my sql file onto sqlite3, some of the output, the extracts, are missed, but doing the extract by itself makes everything work, so if the extract files are empty recopy only the extract parts and it should work