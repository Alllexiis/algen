%Programa de optimizacao
%X = GA(FITNESSFCN,NVARS,A,b,Aeq,beq,lb,ub,NONLCON,options)
function [x,fval] = gacusto2()
global x1;
global x2;
global x3;
global x4;
options = gaoptimset('PlotFcns',...
{@gaplotbestf,@gaplotbestindiv,@gaplotexpectation,@gaplotstopping},...
 'PopInitRange',[0;1]);
[x, fval] = ga(@custo2,2,[1 0],1,[1 1],0.9,0,0.9,[],options);
x1 = num2str(x(1),3);
x2 = num2str(x(2),3);
x4_1 = x(1) + x(2);
x3 = num2str(fval, 3);
x4 = num2str(x4_1, 3);


