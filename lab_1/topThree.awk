BEGIN{
    top_three_for_infiti = 3;
    top_three_for_Acura = 3
    top_three_for_Audi = 3
    top_three_for_Benz = 3
}
{
    if($4 == "Infiniti" && top_three_for_infiti != 0){
            print $0 > "topThree.out" 
        }
}
END{

}