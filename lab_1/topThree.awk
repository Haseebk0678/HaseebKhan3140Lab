BEGIN{
    top_three_for_Acura = 3;
    top_three_for_Audi = 3;
    top_three_for_Benz = 3;
    top_three_for_Bmw = 3;
    top_three_for_Chevy = 3;
    top_three_for_Chrystler = 3;
    top_three_for_Civic = 3;
    top_three_for_Dodge = 3;
    top_three_for_Ford = 3;
    top_three_for_Honda = 3;
    top_three_for_Hyundai = 3;
    top_three_for_Infinity = 3;
    top_three_for_Infiti = 3;
    top_three_for_Lexus = 3;
    top_three_for_Mazda = 3;
    top_three_for_Mercedes = 3;
    top_three_for_Mitsu = 3;
    top_three_for_Mitsub = 3;
    top_three_for_Nissan = 3;
    top_three_for_Scion = 3;
    top_three_for_Subaru = 3;
    top_three_for_Toyota = 3;
    top_three_for_Volkswagen = 3;
    top_three_for_Volvo = 3;
}
{
    if($4 == "Acura" && top_three_for_Acura != 0){
            print $0 > "topThree.out"
            top_three_for_Acura--;
        }

    if($4 == "Audi" && top_three_for_Audi != 0){
        print $0 > "topThree.out" 
        top_three_for_Audi--
    }
    if($4 == "Benz" && top_three_for_Benz != 0){
        print $0 > "topThree.out" 
        top_three_for_Benz--
    }



    if($4 == "Bmw" && top_three_for_Bmw != 0){
        print $0 > "topThree.out" 
        top_three_for_Bmw--
    }
    if($4 == "Chevy" && top_three_for_Chevy != 0){
        print $0 > "topThree.out" 
        top_three_for_Chevy--
    }



    if($4 == "Chrystler" && top_three_for_Chrystler != 0){
        print $0 > "topThree.out" 
        top_three_for_Chrystler--
    }
    if($4 == "Civic" && top_three_for_Civic != 0){
        print $0 > "topThree.out" 
        top_three_for_Civic--
    }



    if($4 == "Dodge" && top_three_for_Dodge != 0){
        print $0 > "topThree.out" 
        top_three_for_Dodge--
    }
    if($4 == "Ford" && top_three_for_Ford != 0){
        print $0 > "topThree.out" 
        top_three_for_Ford--
    }


    
    if($4 == "Honda" && top_three_for_Honda != 0){
    print $0 > "topThree.out" 
    top_three_for_Honda--
    }
    if($4 == "Hyundai" && top_three_for_Hyundai != 0){
    print $0 > "topThree.out" 
    top_three_for_Hyundai--
    
    }

    if($4 == "Infinity" && top_three_for_Infinity != 0){
    print $0 > "topThree.out" 
    top_three_for_Infinity--
    }

    if($4 == "Infiti" && top_three_for_Infiti != 0){
    print $0 > "topThree.out" 
    top_three_for_Infiti--
    }

    if($4 == "Lexus" && top_three_for_Lexus != 0){
    print $0 > "topThree.out" 
    top_three_for_Lexus--
    }
    if($4 == "Mazda" && top_three_for_Mazda != 0){
    print $0 > "topThree.out" 
    top_three_for_Mazda--
    }

    if($4 == "Mercedes" && top_three_for_Mercedes != 0){
    print $0 > "topThree.out" 
    top_three_for_Mercedes--
    }
    if($4 == "Ford" && top_three_for_Mitsu != 0){
    print $0 > "topThree.out" 
    top_three_for_Mitsu--
    }

    if($4 == "Mitsub" && top_three_for_Mitsub != 0){
    print $0 > "topThree.out" 
    top_three_for_Mitsub--
    }
    if($4 == "Nissan" && top_three_for_Nissan != 0){
    print $0 > "topThree.out" 
    top_three_for_Nissan--
    }

    if($4 == "Scion" && top_three_for_Scion != 0){
    print $0 > "topThree.out" 
    top_three_for_Scion--
    }
    if($4 == "Subaru" && top_three_for_Subaru != 0){
    print $0 > "topThree.out" 
    top_three_for_Subaru--
    }

    if($4 == "Toyota" && top_three_for_Toyota != 0){
    print $0 > "topThree.out" 
    top_three_for_Toyota--
    }
    if($4 == "Volkswagen" && top_three_for_Volkswagen != 0){
    print $0 > "topThree.out"
    top_three_for_Volkswagen--
    }

    if($4 == "Volvo" && top_three_for_Volvo != 0){
    print $0 > "topThree.out" 
    top_three_for_Volvo--
    }


}