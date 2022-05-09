all:
	awk -f script.awk data/data.csv 
	sqlite3 Lab4DB.db < Sqlscript.sql
	npm run start
