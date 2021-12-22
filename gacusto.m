% Programa de optimizacao

function [x,fval] = gacusto()
   
    %loading variables
    global pg1 pg2 P1 P3;
    global x12 x23 x13 NODAL;
    global c11 c12 c21 c22;
    
    load cachefile;

    %Setting options
    options = optimoptions('ga',...
        'PopulationSize',   PopSize,...
        'PopInitRange',     InitRange,...
        'MaxGenerations',   MaxGen,...    
        'MaxTime',          MaxTime,...         
        'InitialPenalty',   InitPen,...
        'PenaltyFactor',    PenFactor,...
        'PlotFcn',          plots,...
        'SelectionFcn',     Selection,...           
        'EliteCount',       EliteCount,...
        'CrossoverFraction',CrossFract,...
        'MutationFcn',      Mutation,...
        'CrossoverFcn',     Crossover);     
    tic
        
        if      Exercise == "Ex2"
            [x, fval] = ga(@custo, 2,    [],   [],  [1 1],  0.9,  0,    1,  [], options);

        elseif  Exercise == "Ex3"
            [x, fval] = ga(@custo, 2, [1 0], [0.5], [1 1],  0.9,  0,    1,  [], options);

        elseif  Exercise == "Ex4"
            [x, fval] = ga(@custo, 2,    [], [], [10 -20],  0.5, [],   [],  [], options);

        else
        %EX Customizado
            if      (MAXOUT == 0 && NODAL == 0)
                A=[]; b=[];
                Aeq=[1 1];
                beq=[P1+P3];
                
            elseif  (MAXOUT == 0 && NODAL == 1)
                A=[]; b=[];
                Aeq=[1/x23 -(1/x13+1/x23)];
                beq=P3;
                
            elseif  (MAXOUT == 1 && NODAL == 0)
                if pg1_max>= 0.001; A=[1 0]; b=[pg1_max]; end
                if pg2_max>= 0.001; A=[0 1]; b=[pg2_max]; end
                Aeq=[1 1];
                beq=[P1+P3];
                
            elseif  (MAXOUT == 1 && NODAL == 1)
                if pg1_max>= 0.001; A=[-(1/x12+1/x23) 1/x23]; b=[pg1_max-(P1+P3)]; end
                if pg2_max>= 0.001; A=[1/x12+1/x23 -1/x23];   b=[pg2_max]; end
                Aeq=[1/x23 -(1/x13+1/x23)];
                beq=P3;
            end    
            teste={A;b;Aeq;beq}
            [x, fval] = ga(@custo,...
                2       ,...<Number of design variables>
                A       ,...<A matrix for inequality constraints>   %x1 ou x2
                b       ,...<b vector for inequality constraints>   %<= ao valor
                Aeq     ,...<Aeq matrix for equality constraints>   %x1 +x2 =
                beq     ,...<beq vector for equality constraints>   %0.9 Potencia de saida
                0       ,...<Lower bound on X> 
                []      ,...<Upper bound on X> 
                []      ,...NONLCON
                options);
            
                
        end
        
    time = num2str(toc, 3);
    %saving variables
    if ~NODAL 
        p1 = num2str(x(1),3);
        p2 = num2str(x(2),3);
        t2 = '';
        t3 = '';
    else
        p1 = num2str(pg1,3);
        p2 = num2str(pg2,3);
        t2 = num2str(x(1),3);
        t3 = num2str(x(2),3);
    end
    pt = num2str((pg1+pg2), 3); 
    fit = num2str(fval, 3);
    save('cachefile.mat','p1','p2','pt','t2','t3','fit','time','-append');

