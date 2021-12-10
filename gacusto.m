%Programa de optimizacao
%X = GA(FITNESSFCN,NVARS,A,b,Aeq,beq,lb,ub,NONLCON,options)
function [x,fval] = gacusto()
    %loading variables
    
    plots={@gaplotbestf,@gaplotbestindiv,@gaplotexpectation,@gaplotstopping};
    InitRange = [0;1];
    PopSize = 50;
    MaxGen = 1000;
    
    global pg1 pg1_2 pg2 pg2_2
    load cachefile;
    %falta PopSize InitRange [a,b] plots
    %if cachefile does not exist, create default ?
    
    %Setting options
    options = optimoptions('ga',... % genetic algorithm
    'PlotFcn', plots,...            %what plots to show plots 
    'PopInitRange', InitRange,...   %alterar valores tomados inicalmente pela população
    'PopulationSize', PopSize,...   %numero da população
    'MaxGenerations', MaxGen);     
 
    %Function call 
    [x, fval] = ga(@custo,...
        2       ,...<Number of design variables>
        [1 0]   ,...<A matrix for inequality constraints>   %x1 ou x2
        0.5     ,...<b vector for inequality constraints>   %<= ao valor
        [1 1]   ,...<Aeq matrix for equality constraints>   %x1 +x2 =
        0.9     ,...<beq vector for equality constraints>   %0.9
        0       ,...<Lower bound on X> limite inferior
        2*pi    ,...<Upper bound on X> limite superior
        []      ,...NONLCON
        options);
    
    %saving variables
    x1 = num2str(x(1),3);
    x2 = num2str(x(2),3);
    x3 = num2str(fval, 3);
    x4 = num2str(x(1) + x(2), 3);
    save('cachefile.mat', 'x1','x2','x3','x4','-append');

