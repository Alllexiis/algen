%Funcao a optimizar
function z=custo(x)
    %Funcao fitness
    global pg1 pg2 P1 P3; 
    global x12 x23 x13 NODAL;
    global c11 c12 c21 c22;
    
    if ~NODAL
        pg1 = x(1);
        pg2 = x(2);
    else
        pg2 = x(1)*(1/x12 + 1/x23) - x(2)/x23;
        pg1 = (P1+P3)-pg2;
    end
        
    c1 = c11 * pg1 + c12 * pg1^2;
    c2 = c21 * pg2 + c22 * pg2^2;
    z=c1+c2;