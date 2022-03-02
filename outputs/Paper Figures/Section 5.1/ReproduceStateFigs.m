%% Clear variables and plots
clearvars;
close all;

%% Load data structures
load StateEstimation.mat;

%% Cruise Control

% Figure 1 - Computation time for Cruise Control

h = figure;
hold on;
for method = 1:size(computationTimes{1},1)
    stem(0:simulationTime,squeeze(computationTimes{1}(method,3,:)),'DisplayName',nameMethod{method});
end
hold off;
legend;
xlabel('$k$ time step','interpreter','latex');
ylabel('computation time','interpreter','latex');
set(gca,'yscal','log');

saveas(h, 'Fig1-CruiseComputation','pdf');


%% Figure 2 - Volume for the Motor Speed

h = figure;
hold on;
for method = 1:size(volumes{2},1)
    stem(0:simulationTime,squeeze(volumes{2}(method,3,:)),'DisplayName',nameMethod{method});
end
hold off;
legend;
xlabel('$k$ time step','interpreter','latex');
ylabel('Hypervolume','interpreter','latex');
set(gca,'yscal','log');

saveas(h, 'Fig2-MotorVolume','pdf');


%% Figure 3 - Volume for the Suspension

h = figure;
hold on;
for method = 1:size(volumes{3},1)
    stem(0:simulationTime,squeeze(volumes{3}(method,1,:)),'DisplayName',nameMethod{method});
end
hold off;
legend;
xlabel('$k$ time step','interpreter','latex');
ylabel('Hypervolume','interpreter','latex');
set(gca,'yscal','log');

saveas(h, 'Fig3-SuspensionVolume','pdf');

%% Figure 4 - Volume for the Inverted Pendulum

h = figure;
hold on;
for method = 1:size(volumes{4},1)
    stem(0:simulationTime,squeeze(volumes{4}(method,2,:)),'DisplayName',nameMethod{method});
end
hold off;
legend;
xlabel('$k$ time step','interpreter','latex');
ylabel('Hypervolume','interpreter','latex');
set(gca,'yscal','log');

saveas(h, 'Fig4-PendulumVolume','pdf');

%% Figure 5 - Doubles for the Aircraft

h = figure;
hold on;
for method = 1:size(nb_doubles{5},1)
    stem(0:simulationTime,squeeze(nb_doubles{5}(method,3,:)),'DisplayName',nameMethod{method});
end
hold off;
legend('Location','Southeast');
xlabel('$k$ time step','interpreter','latex');
ylabel('Number of doubles','interpreter','latex');
set(gca,'yscal','log');

saveas(h, 'Fig5-AircraftDoubles','pdf');

%% Figure 6 - Computation time for the Aircraft

h = figure;
hold on;
for method = 1:size(computationTimes{5},1)
    stem(0:simulationTime,squeeze(computationTimes{5}(method,3,:)),'DisplayName',nameMethod{method});
end
hold off;
legend;
xlabel('$k$ time step','interpreter','latex');
ylabel('computation time','interpreter','latex');
set(gca,'yscal','log');

saveas(h, 'Fig6-AircraftComputation','pdf');



