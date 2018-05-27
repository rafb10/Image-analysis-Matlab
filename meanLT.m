function wynik = meanLT(x,y,W2,I,X,Y)

    il = 0.0;   
    suma = double(0);  
    
   
    
    for i= -W2:1:W2
        for j= -W2:1:W2
            
            if ( (i+x) >= 1 && (i+x) <= X && (j+y) >= 1 && (j+y) <= Y )
                il = il +1;
                suma = suma +  double(I(i+x,j+y));
            end
            
        end
    end
    
    wynik = suma / il;


end
