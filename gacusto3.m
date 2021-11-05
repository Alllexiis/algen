%Programa de optimizacao
%X = GA(FITNESSFCN,NVARS,A,b,Aeq,beq,lb,ub,NONLCON,options)
function [x,fval] = gacusto3(a, b)
options = gaoptimset('PlotFcns',...
 {@gaplotbestf,@gaplotbestindiv,@gaplotexpectation,@gaplotstopping},...
 'PopInitRange',[a;b]);
[x, fval] = ga(@custo,2,[1 0],0.5,[1 1],0.9,0,0.9,[],options);

