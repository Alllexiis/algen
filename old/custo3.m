%Funcao a optimizar
function z=custo2(x)
global pg1
global pg1_2
global pg2
global pg2_2
%Funcao fitness
c1=pg1*x(1)+pg1_2*x(1)^2;
c2=pg2*x(2)+pg2_2*x(2)^2;
z=c1+c2;