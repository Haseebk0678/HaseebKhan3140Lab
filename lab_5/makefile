all:
	awk -f my-app/src/script.awk my-app/src/data/data.csv 
	sqlite3 my-app/src/Lab5DB.db < my-app/src/Sqlscript.sql
	+$(MAKE) -C my-app
