# Lab 4

## Report

Creating a backend API endpoint

## Dependencies

1. Sqlite
2. Express
3. NPM
4. Md5

## Commands
After cloning the repo 
``` bash
git submodule init
git submodule update
```
if make was not run before in the main directory To run the program run

``` bash
make
```

## Objective

The objective of this lab is to build a backend API using a combination of SQL and JavaScript to enable users to view data that is stored in a database as well as update data.

## Requirements:

You may reuse your SQLite database/scripts from Lab 2, however be aware that you may end up making some further modifications to support the combination of tools mentioned in this lab.

2. Due to the nature of running NodeJS, you must work off your local machine (I.e. laptop), not the Linux Machines
    1. Installing NodeJS and required NPM packages mentioned in class are necessary to complete this lab (see this page for instructions) 
    2. Set up a gitignore file (https://git-scm.com/docs/gitignore)

4. Your API endpoint should support the following features:
    1. Viewing data that is in the database as JSON formatted data
        1. Display results of select all - I.e., all cars present in the CSV file, all the car owners contact information, showing results per class
        2. Display data that is a list of records and a single record

    2. Inserting new data record(s)
        1. Support query, parameter, and JSON body for inserting 1 record at a time and multiple records
    3. Updating data records
        1. Support query, parameter, and JSON body methods for updating 1 record at a time and across multiple records

## Description

The following is a description of how my program runs
Using the command make I run the awk and sql script.
I first use an awk script to get the data from the submodule and then use that to remove the first line and also where Car_ID = "ShowCar"

From there I run sqlite3 scripts from my make file and put them into my Lab4DB.db. The sql scripts can be found Sqlscript.sql

Then I ran the command npm run start, which runs the command start in package.json.