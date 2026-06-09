clc; clear; close all;

%% =========================
%  Parameter setting
% ==========================
Cm  = 150; %#ok<NASGU>
Um  = 200; %#ok<NASGU>
C1  = 100;
U1  = 120;
C2  = 80;
L   = 150;
a   = 0.9;

Cs  = 45; %#ok<NASGU>
R   = 60;
rs  = 0.3; %#ok<NASGU>
C3  = 25;
U2  = 5;
b   = 0.95;
C4  = 40;
C5  = 2;

k   = 0.8;
T   = 10; %#ok<NASGU>
rg  = 0.0348;
rn  = 0.0435;
S   = 10;
rb  = 0.0475;
rb1 = 0.0175; %#ok<NASGU>

F1  = 50;
F2  = 20;
M   = 0.5;
C21 = 120;

%% =========================
%  Time span and initial point
% ==========================
tspan = [0 50];
y0    = [0.5; 0.5; 0.5];

%% =========================
%  Scenario 0: Baseline without blockchain
%  Use green()
% ==========================
[t0, y0_sol] = ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb), tspan, y0);

%% =========================
%  Scenario 1: Only anti-greenwashing effect
%  Logic:
%  - camouflage cost increases: C21 = 1000
%  - bank-side blockchain cost effect is weakened by setting M = C5
% ==========================
C21_case1 = C21;   % activate anti-greenwashing channel
M_case1   = C5;    % neutralize bank-side cost change as much as possible

[t1, y1_sol] = ode45(@(t,y) green2(t,y,a,C1,C21_case1,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M_case1), tspan, y0);

%% =========================
%  Scenario 2: Only bank-side cost effect
%  Logic:
%  - keep camouflage cost unchanged: C21 = C2
%  - activate blockchain maintenance cost M
% ==========================
C21_case2 = C2;    % no extra anti-greenwashing penalty
M_case2   = M;     % activate bank-side blockchain cost channel

[t2, y2_sol] = ode45(@(t,y) green2(t,y,a,C1,C21_case2,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M_case2), tspan, y0);

%% =========================
%  Scenario 3: Full blockchain effect
%  Logic:
%  - camouflage cost increases
%  - bank-side maintenance cost channel also active
% ==========================
C21_case3 = C21;
M_case3   = M;

[t3, y3_sol] = ode45(@(t,y) green2(t,y,a,C1,C21_case3,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M_case3), tspan, y0);

%% =========================
%  Plot 2x2 figure
% ==========================
figure('Position',[100 100 1200 900]);

% -------- Scenario 0 --------
subplot(2,2,1);
plot(t0, y0_sol(:,1), 'LineWidth', 1.8); hold on;
plot(t0, y0_sol(:,2), 'LineWidth', 1.8);
plot(t0, y0_sol(:,3), 'LineWidth', 1.8);
xlabel('Time');
ylabel('Strategy probability');
title('(a) Baseline without blockchain');
legend('Core enterprises','SMEs','Financial institutions','Location','best');
grid on;
ylim([0 1]);

% -------- Scenario 1 --------
subplot(2,2,2);
plot(t1, y1_sol(:,1), 'LineWidth', 1.8); hold on;
plot(t1, y1_sol(:,2), 'LineWidth', 1.8);
plot(t1, y1_sol(:,3), 'LineWidth', 1.8);
xlabel('Time');
ylabel('Strategy probability');
title('(b) Only anti-greenwashing effect');
legend('Core enterprises','SMEs','Financial institutions','Location','best');
grid on;
ylim([0 1]);

% -------- Scenario 2 --------
subplot(2,2,3);
plot(t2, y2_sol(:,1), 'LineWidth', 1.8); hold on;
plot(t2, y2_sol(:,2), 'LineWidth', 1.8);
plot(t2, y2_sol(:,3), 'LineWidth', 1.8);
xlabel('Time');
ylabel('Strategy probability');
title('(c) Only bank-side cost effect');
legend('Core enterprises','SMEs','Financial institutions','Location','best');
grid on;
ylim([0 1]);

% -------- Scenario 3 --------
subplot(2,2,4);
plot(t3, y3_sol(:,1), 'LineWidth', 1.8); hold on;
plot(t3, y3_sol(:,2), 'LineWidth', 1.8);
plot(t3, y3_sol(:,3), 'LineWidth', 1.8);
xlabel('Time');
ylabel('Strategy probability');
title('(d) Full blockchain effect');
legend('Core enterprises','SMEs','Financial institutions','Location','best');
grid on;
ylim([0 1]);


%% =========================
%  Print final states
% ==========================
fprintf('\nFinal strategy probabilities:\n');
fprintf('Scenario 0 - Baseline without blockchain:   [%8.4f, %8.4f, %8.4f]\n', y0_sol(end,1), y0_sol(end,2), y0_sol(end,3));
fprintf('Scenario 1 - Only anti-greenwashing:        [%8.4f, %8.4f, %8.4f]\n', y1_sol(end,1), y1_sol(end,2), y1_sol(end,3));
fprintf('Scenario 2 - Only bank-side cost effect:    [%8.4f, %8.4f, %8.4f]\n', y2_sol(end,1), y2_sol(end,2), y2_sol(end,3));
fprintf('Scenario 3 - Full blockchain effect:        [%8.4f, %8.4f, %8.4f]\n', y3_sol(end,1), y3_sol(end,2), y3_sol(end,3));

%% =========================
%  Save figure (optional)
% ==========================
saveas(gcf, 'blockchain_decomposition_analysis.png');