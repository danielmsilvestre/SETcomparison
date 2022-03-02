%% Clear variables and plots
clearvars;
close all;

%% Load data structures
load consensusFDI4nodes.mat;

%% Fault Detection and Isolation
% Figure 1 - Progress of the filter bank

h = figure;
hold on;
% Perform the sum of number of active filters per iteration for each method
filterCount = reshape(sum(reshape(cell2mat(filterBankProgress),nb_methods,n+1,[]),2),nb_methods,simulationTime);
for method = 1:nb_methods
    plot(1:simulationTime,filterCount(method,:), '.-', 'markersize', 8,'DisplayName',methods{method}.name);
end
plot(1:simulationTime,6*ones(1,simulationTime),'--','Color', [0.5 0.5 0.5],'HandleVisibility','off');
text(15,6.2,'Detection');
plot(1:simulationTime,1*ones(1,simulationTime),'--','Color', [0.5 0.5 0.5],'HandleVisibility','off');
text(15,1.25,'Isolation');
hold off;
legend('Location','East');
xlabel('$k$ time step','interpreter','latex');
ylabel('Number of active filters','interpreter','latex');
ylim([0,n+1-length(measuredNodes)]);

saveas(h, 'Fig8-ConsensusFDI','pdf');


%% Computation Times

% Figure 2 - Computation time to run all filters

h = figure;
hold on;
% Perform the sum of computation times for each filter for every method
totalComputationTime = reshape(sum(cell2mat(computationTimes),1),simulationTime+1,[])';
for method = 1:nb_methods
    stem(1:simulationTime,totalComputationTime(method,2:end),'DisplayName',methods{method}.name);
end
hold off;
legend;
xlabel('$k$ time step','interpreter','latex');
ylabel('total computation time','interpreter','latex');
% set(gca,'yscal','log');

saveas(h, 'Fig9-ConsensusFDItime','pdf');


