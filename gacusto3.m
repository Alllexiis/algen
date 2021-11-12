%Programa de optimizacao
%X = GA(FITNESSFCN,NVARS,A,b,Aeq,beq,lb,ub,NONLCON,options)
function [x,fval] = gacusto3(a)
options = gaoptimset('PlotFcns',...
 {@gaplotbestf,@gaplotbestindiv,@gaplotexpectation,@gaplotstopping},...
 'PopInitRange',[0;1]);
[x, fval] = ga(@custo,2,[1 0],a,[1 1],0.9,0,0.9,[],options);

