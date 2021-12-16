%Programa de optimizacao
%X = GA(FITNESSFCN,NVARS,A,b,Aeq,beq,lb,ub,NONLCON,options)
function [x,fval] = gacusto2()
    %loading variables
    global pg1 pg1_2 pg2 pg2_2;    
    load cachefile;
    %Setting options
    options = gaoptimset('PlotFcns',...
    {@gaplotbestf,@gaplotbestindiv,@gaplotexpectation,@gaplotstopping},...
     'PopInitRange',[0;1]); 
    %Function call @custo
    [x, fval] = ga(@custo,...
        2       ,...<Number of design variables>
        [1 0]   ,...<A matrix for inequality constraints>
        1       ,...<b vector for inequality constraints>
        [1 1]   ,...<Aeq matrix for equality constraints>
        0.9     ,...<beq vector for equality constraints>
        0       ,...<Lower bound on X>
        0.9     ,...<Upper bound on X>
        []      ,...NONLCON,INTCON?
        options);
    
    x1 = num2str(x(1),3);
    x2 = num2str(x(2),3);
    x3 = num2str(fval, 3);
    x4 = num2str(x(1) + x(2), 3);
    save('cachefile.mat', 'x1','x2','x3','x4','-append');

