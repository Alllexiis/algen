%Programa de optimizacao
%X = GA(FITNESSFCN,NVARS,A,b,Aeq,beq,lb,ub,NONLCON,options)
options = gaoptimset('PlotFcns',...
 {@gaplotbestf,@gaplotbestindiv,@gaplotexpectation,@gaplotstopping},...
 'PopInitRange',[0;1]);
[x fval] = ga(@custo4,2,[],[],[10 -20],0.5,[],[],[],options)

teta=[0;x']

p12=-x(1)/0.3
p13=-x(2)/0.1
p23=(x(1)-x(2))/0.1
pg2=13.33*x(1)-10*x(2)
pg1=0.9-pg2
p1=pg1-p12-p13
p3=p13+p23


[10 20 ][ x1  = 10x1 + 20x2
          x2]