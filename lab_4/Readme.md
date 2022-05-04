# Lab 4

## Report

Creating a backend API endpoint

## Dependencies

Sqlite
Express
NPM
Md5

## Commands
After cloning the repo 
``` bash
    git submodule init
    git submodule updatemake
```
if make was not run before in the main directory

``` bash
    make
```

To run the program run

``` bash
    npm run
```


## Objective

The objective of this lab is to build a backend API using a combination of SQL and JavaScript to enable users to view data that is stored in a database as well as update data.

## Requirements:

You may reuse your SQLite database/scripts from Lab 2, however be aware that you may end up making some further modifications to support the combination of tools mentioned in this lab.

2. Due to the nature of running NodeJS, you must work off your local machine (I.e. laptop), not the Linux Machines

a. Installing NodeJS and required NPM packages mentioned in class are necessary to complete this lab (see this page for instructions) 3. Set up a gitignore file (https://git-scm.com/docs/gitignore)

4. Your API endpoint should support the following features:

a. Viewing data that is in the database as JSON formatted data

i. Display results of select all - I.e., all cars present in the CSV file, all the car owners contact information, showing results per class

ii. Display data that is a list of records and a single record

b. Inserting new data record(s)

i. Support query, parameter, and JSON body for inserting 1 record at a time and multiple records

c. Updating data records

i. Support query, parameter, and JSON body methods for updating 1 record at a time and across multiple records

