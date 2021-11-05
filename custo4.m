%Funcao a optimizar
function z=custo4(x)
%Funcao fitness
pg2=13.33*x(1) - 10*x(2);
pg1=0.9-pg2;
c1=0.3*pg1+0.01*pg1^2;
c2=0.2*pg2+0.3*pg2^2;
z=c1+c2;

