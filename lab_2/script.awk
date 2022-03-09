BEGIN {
    FS = ","
    OFS = ","
}
{
    if(NR>1){
        total =0;
        for(i=10; i<= NF;i++){
            total+=$i
    }

    print $7, total  > "Car_Score.csv"
    print $7, $4, $5, $6, $3, $2  > "Cars_Table.csv"
    print $1 = substr($1, 10, 14), $8, $9, substr($1, 1, 2) * 60 + substr($1, 4) > "Judges_Table.csv"
    }
}