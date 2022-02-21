BEGIN {
    FS = ","
    print "ranking \t car_id \t year \t carmake \t car model" > "sorted.out"
}
{
    if(NR>1){
        total =0;
        for(x = 8; x <= NF; x++){
            total += $x
        }
        print total "\t\t" $7 "\t\t" $4 "\t\t" $5 "\t\t" $6 > "text.out"
        }
}
END{
}