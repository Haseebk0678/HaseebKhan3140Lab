BEGIN {
    FPAT = "([^,]+)|(\"[^\"]+\")"
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
    print  $8, $9  > "Judges_Table.csv"
    print $7, $4, $5, $6, $3, $2  > "Cars_Table.csv"
    }
}
END{
}