%% Save Normal
var1 = 'Ola';
var2 = 1234;
save save_test var1
save save_test var2
%Teste
clear
load save_test %ver variaveis Workspace

%% Save c/ -append
clear
if ~isfile('save_test.mat'), save save_test;, end

var1 = 'Ola';
var2 = 1234;
save('save_test.mat','var1','-append')
save('save_test.mat','var2','-append')
%Teste
clear
load save_test %ver variaveis Workspace
%% Save c/ -append
clear
if ~isfile('save_test.mat'), save save_test;, end

var1 = 'Ola';
var2 = 1234;
save('save_test.mat','var1','var2','-append')
%Teste
clear
load save_test %ver variaveis Workspace
