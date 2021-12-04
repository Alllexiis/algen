%Funcao a optimizar
function z=custo(x)
    %Funcao fitness
    global pg1 pg1_2 pg2 pg2_2;
    
    c1=pg1*x(1)+pg1_2*x(1)^2;
    c2=pg2*x(2)+pg2_2*x(2)^2;
    z=c1+c2;