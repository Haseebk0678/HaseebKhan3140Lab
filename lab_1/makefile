all:
	awk -f script.awk data_lab1/data.csv
	echo "ranking \t car_id \t year \t\t carmake \t car model"
	sort -k1 -nr text.out
	sort -k1 -nr text.out > sorted.out
	sort -k4 text.out > sortedMaker.out
	awk -f topThree.awk sorted.out
