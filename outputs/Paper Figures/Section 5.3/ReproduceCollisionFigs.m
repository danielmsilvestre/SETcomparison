%% Clear variables and plots
clearvars;
close all;

%% Load data structures
load collision.mat;

%% Computation Times

% Figure 1 - Computation time to detect potential collisions

h = figure;
hold on;
for method = 1:size(computationTimes,1)
    times = computationTimes(method,computationTimes(method,:)>0);
    stem(0:(size(times,2)-1),times,'DisplayName',methods{method}.name);
end
hold off;
legend;
xlabel('$k$ time step','interpreter','latex');
ylabel('computation time','interpreter','latex');
set(gca,'yscal','log');

saveas(h, 'Fig7-CollisionTime','pdf');


