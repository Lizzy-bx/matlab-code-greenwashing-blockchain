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

%% Fig.7 Influence of green input cost of core enterprises %C1=100,110,120
clc,clear;
figure(7);
%C1=100
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'r+','linewidth',1);
hold on ;
%C1=110
Cm=150,Um=200,C1=110,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'b-','linewidth',1);
hold on  ;   
%C1=120
Cm=150,Um=200,C1=120,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'g--','linewidth',1);
hold on  ; 
%坐标刻度间隔及其区间，坐标标注
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1],'ZTick',[0:0.2:1])
axis([0 1 0 1 0 1])
xlabel('$x$','interpreter','latex');ylabel('$y$','interpreter','latex');zlabel('$z$','interpreter','latex','Rotation',360,'position',[-0.1 1 1.1]);
%图象网格，底图加白
grid on
hold on
set(0,'defaultfigurecolor','w')
%图例及标题
legend({'{\it\fontname{Bodoni MT}C1}=100','{\it\fontname{Bodoni MT}C1}=110','{\it\fontname{Bodoni MT}C1}=120'},'location','northeast');
title('','FontWeight','bold','position',[0 0 -0.2]);
%加上标注和箭头
text(0.1,0.8 ,0.8,'$ESS$','interpreter','latex');
annotation('arrow',[0.27,0.15],[0.58 0.54]);
annotation('arrow',[0.25 0.15],[0.63 0.68]);
view([-55,30]);
% the small figure
axes('position',[0.13 0.32 0.2 0.2]); %小图的关键语句确定小图的大小位置


% y-x小图中的线条
%小图中的线条
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'r+','linewidth',1);
hold on 
Cm=150,Um=200,C1=110,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'b-','linewidth',1);
hold on     
Cm=150,Um=200,C1=120,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'g--','linewidth',1);
hold on
%坐标刻度间隔及区间，但不显示
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1],'ZTick',[0:0.2:1])
axis([0 1 0 1 0 1])
set(gca,'XTickLabel','','YTickLabel','','ZTickLabel','')
%背景网格并设置白底
grid on
hold on  
set(0,'defaultfigurecolor','w')
%图象显示视角，以及相应的坐标标注
view([0 90]); %y-x小图
xlabel('x','position',[0.8 -0.05 0.3])
ylabel('y','position',[0.1 1 0.8],'Rotation',360)
      
%% Fig.8 Influence of greenwashing exposure losses in core enterprises. L=150,175,200
clc,clear;
figure(8);
%L=150
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'r+','linewidth',1);
hold on ;
%L=175
Cm=150,Um=200,C1=100,U1=120,C2=80,L=175,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'b-','linewidth',1);
hold on  ;   
%L=200
Cm=150,Um=200,C1=120,U1=120,C2=80,L=200,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'g--','linewidth',1);
hold on  ; 
%坐标刻度间隔及其区间，坐标标注
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1],'ZTick',[0:0.2:1])
axis([0 1 0 1 0 1])
xlabel('$x$','interpreter','latex');ylabel('$y$','interpreter','latex');zlabel('$z$','interpreter','latex','Rotation',360,'position',[-0.1 1 1.1]);
%图象网格，底图加白
grid on
hold on
set(0,'defaultfigurecolor','w')
%图例及标题
legend({'{\it\fontname{Bodoni MT}L}=150','{\it\fontname{Bodoni MT}L}=175','{\it\fontname{Bodoni MT}L}=200'},'location','northeast');
%加上标注和箭头
text(0.1,0.8 ,0.8,'$ESS$','interpreter','latex');
annotation('arrow',[0.27,0.15],[0.58 0.54]);
annotation('arrow',[0.25 0.15],[0.63 0.68]);
view([-55,30]);
% the small figure
axes('position',[0.13 0.32 0.2 0.2]); %小图的关键语句确定小图的大小位置
% y-x小图中的线条
%小图中的线条
%L=150
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'r+','linewidth',1);
hold on ;
%L=175
Cm=150,Um=200,C1=100,U1=120,C2=80,L=175,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'b-','linewidth',1);
hold on  ;   
%L=200
Cm=150,Um=200,C1=120,U1=120,C2=80,L=200,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'g--','linewidth',1);
hold on  ; 
%坐标刻度间隔及区间，但不显示
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1],'ZTick',[0:0.2:1])
axis([0 1 0 1 0 1])
set(gca,'XTickLabel','','YTickLabel','','ZTickLabel','')
%背景网格并设置白底
grid on
hold on  
set(0,'defaultfigurecolor','w')
%图象显示视角，以及相应的坐标标注
view([0 90]); %y-x小图
xlabel('x','position',[0.8 -0.05 0.3])
ylabel('y','position',[0.1 1 0.8],'Rotation',360)
%% Fig.9 Influence of green input cost on SMEs. C3=25,30,35
clc,clear;
figure(9);
%C3=25
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'r+','linewidth',1);
hold on ;
%C3=30
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=30,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'b-','linewidth',1);
hold on  ;   
%C3=35
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=35,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'g--','linewidth',1);
hold on  ; 
%坐标刻度间隔及其区间，坐标标注
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1],'ZTick',[0:0.2:1])
axis([0 1 0 1 0 1])
xlabel('$x$','interpreter','latex');ylabel('$y$','interpreter','latex');zlabel('$z$','interpreter','latex','Rotation',360,'position',[-0.1 1 1.1]);
%图象网格，底图加白
grid on
hold on
set(0,'defaultfigurecolor','w')
%图例及标题
legend({'{\it\fontname{Bodoni MT}C_3}=25','{\it\fontname{Bodoni MT}C_3}=30','{\it\fontname{Bodoni MT}C_3}=35'},'location','northeast');
%加上标注和箭头
text(0.1,0.8 ,0.8,'$ESS$','interpreter','latex');
annotation('arrow',[0.27,0.15],[0.58 0.54]);
annotation('arrow',[0.25 0.15],[0.63 0.68]);
view([-55,30]);
% the small figure
axes('position',[0.13 0.32 0.2 0.2]); %小图的关键语句确定小图的大小位置
% y-x小图中的线条
%小图中的线条
%C3=25
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'r+','linewidth',1);
hold on ;
%C3=30
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=30,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'b-','linewidth',1);
hold on  ;   
%C3=35
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=35,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'g--','linewidth',1);
hold on  ; 
%坐标刻度间隔及区间，但不显示
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1],'ZTick',[0:0.2:1])
axis([0 1 0 1 0 1])
set(gca,'XTickLabel','','YTickLabel','','ZTickLabel','')
%背景网格并设置白底
grid on
hold on  
set(0,'defaultfigurecolor','w')
%图象显示视角，以及相应的坐标标注
view([0 90]); %y-x小图
xlabel('x','position',[0.8 -0.05 0.3])
ylabel('y','position',[0.1 1 0.8],'Rotation',360)
%% Fig.10 Influence of core enterprises on green incentives of SMEs.. U2=5,10,15
clc,clear;
figure(10);
%U2=5
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'r+','linewidth',1);
hold on ;
%U2=10
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=10,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'b-','linewidth',1);
hold on  ;   
%U2=15
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=15,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'g--','linewidth',1);
hold on  ; 
%坐标刻度间隔及其区间，坐标标注
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1],'ZTick',[0:0.2:1])
axis([0 1 0 1 0 1])
xlabel('$x$','interpreter','latex');ylabel('$y$','interpreter','latex');zlabel('$z$','interpreter','latex','Rotation',360,'position',[-0.1 1 1.1]);
%图象网格，底图加白
grid on
hold on
set(0,'defaultfigurecolor','w')
%图例及标题
legend({'{\it\fontname{Bodoni MT}U_2}=5','{\it\fontname{Bodoni MT}U_2}=10','{\it\fontname{Bodoni MT}U_2}=15'},'location','northeast');
%加上标注和箭头
text(0.1,0.8 ,0.8,'$ESS$','interpreter','latex');
annotation('arrow',[0.27,0.15],[0.58 0.54]);
annotation('arrow',[0.25 0.15],[0.63 0.68]);
view([-55,30]);
% the small figure
axes('position',[0.13 0.32 0.2 0.2]); %小图的关键语句确定小图的大小位置
% y-x小图中的线条
%小图中的线条
%U2=5
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'r+','linewidth',1);
hold on ;
%U2=10
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=10,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'b-','linewidth',1);
hold on  ;   
%U2=15
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=15,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'g--','linewidth',1);
hold on  ; 
%坐标刻度间隔及区间，但不显示
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1],'ZTick',[0:0.2:1])
axis([0 1 0 1 0 1])
set(gca,'XTickLabel','','YTickLabel','','ZTickLabel','')
%背景网格并设置白底
grid on
hold on  
set(0,'defaultfigurecolor','w')
%图象显示视角，以及相应的坐标标注
view([0 90]); %y-x小图
xlabel('x','position',[0.8 -0.05 0.3])
ylabel('y','position',[0.1 1 0.8],'Rotation',360)
%% Fig.11 The influence of critical conditions on Condition 1.. s=30,40
clc,clear;
figure(11);
%s=30
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=30,rb=0.0475,rb1=0.0175,F1=-50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'r+','linewidth',1);
hold on ;
%s=40
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=40,rb=0.0475,rb1=0.0175,F1=-50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'b-','linewidth',1);
hold on  ; 
%坐标刻度间隔及其区间，坐标标注
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1],'ZTick',[0:0.2:1])
axis([0 1 0 1 0 1])
xlabel('$x$','interpreter','latex');ylabel('$y$','interpreter','latex');zlabel('$z$','interpreter','latex','Rotation',360,'position',[-0.1 1 1.1]);
%图象网格，底图加白
grid on
hold on
set(0,'defaultfigurecolor','w')
%图例及标题
legend({'{\it\fontname{Bodoni MT}s}=30','{\it\fontname{Bodoni MT}s}=40'},'location','northeast');
%加上标注和箭头
text(0.1,0.8 ,0.8,'$ESS$','interpreter','latex');
text(0.61,0.64 ,-0.02,'$E_5$','interpreter','latex');
annotation('arrow',[0.49,0.46],[0.34 0.44]);
annotation('arrow',[0.25 0.15],[0.63 0.68]);
view([-55,30]);
% the small figure
axes('position',[0.13 0.32 0.2 0.2]); %小图的关键语句确定小图的大小位置
% y-x小图中的线条
%小图中的线条
%s=30
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=30,rb=0.0475,rb1=0.0175,F1=-50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'r+','linewidth',1);
hold on ;
%s=40
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=40,rb=0.0475,rb1=0.0175,F1=-50,F2=20,M=0.5,C21=1000;  
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 50],[0.5 0.5 0.5]);
plot3(y(:,1),y(:,2),y(:,3),'b-','linewidth',1);
hold on  ; 
%坐标刻度间隔及区间，但不显示
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1],'ZTick',[0:0.2:1])
axis([0 1 0 1 0 1])
set(gca,'XTickLabel','','YTickLabel','','ZTickLabel','')
%背景网格并设置白底
grid on
hold on  
set(0,'defaultfigurecolor','w')
%图象显示视角，以及相应的坐标标注
view([0 90]); %y-x小图
xlabel('x','position',[0.8 -0.05 0.3])
ylabel('y','position',[0.1 1 0.8],'Rotation',360)
%% Fig12区块链前演化轨迹
% 把这四幅图放在一张图上，子图部分
% 这里我们以0.2,0.5,0.7为例
% 平面x-t
clc,clear;
figure(12)
subplot(2,2,1); %将后面的figure函数替换，并只留一个标题title 
%线条
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;      
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb),[0 1],[0.2 0.2 0.2]); %一般x变化，y和z要么一起跟着变化，要么一直保持为0.5
points=1:1:length(t); 
plot(t,y(:,1),'rh-','linewidth',1,'markersize',5,'markerfacecolor','r','markerindices',points);
%MATLAB常用颜色：r红色；g绿色；b蓝色；c青绿色；m洋红色；y黄色；k黑色；w白色。
%MATLAB常用点标记符：+加号；o圆圈；*星号；.实点；x叉号；s正方形；d菱形；^上三角；v下三角；>右三角；<左三角；p五角星，h六芒星。
%MATLAB常用线型：-实线（默认）；--双划线；:虚线；:.点划线。（英文字符）
hold on;
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.5 0.5 0.5]);
points=1:1:length(t);
plot(t,y(:,1),'g--','linewidth',1,'markersize',5,'markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.7 0.7 0.7]);
points=1:1:length(t);
plot(t,y(:,1),'b:','linewidth',1,'markersize',5,'markerindices',points);
hold on;
%白底，网格
set(0,'defaultfigurecolor','w')
grid on
hold on
%坐标标注，刻度间隔及区间
xlabel('$Time$','interpreter','latex','Rotation',0);
ylabel('$Proportion$','interpreter','latex');
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1])
axis([0 1 0 1]);
%图例，标题
legend('x=0.2','x=0.5','x=0.7');
title('(a)','position',[0.5 -0.2]','FontWeight','bold');
% 5 y-t,这里我们以0.2,0.5,0.7为例
clc,clear;
subplot(2,2,2); %将figure函数替换
%线条
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;    
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.2 0.2 0.2]); %一般y变化，x和z要么一起跟着变化，要么一直保持为0.5
points=1:1:length(t);
plot(t,y(:,2),'rh','linewidth',1,'markersize',5,'markerfacecolor','r','markerindices',points);
%MATLAB常用线型：-实线（默认）；--双划线；:虚线；:.点划线。（英文字符）
%MATLAB常用颜色：r红色；g绿色；b蓝色；c青绿色；m洋红色；y黄色；k黑色；w白色。
%MATLAB常用点标记符：+加号；o圆圈；*星号；.实点；x叉号；s正方形；d菱形；^上三角；v下三角；>右三角；<左三角；p五角星，h六芒星。
hold on;
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.5 0.5 0.5]);
points=1:1:length(t);
plot(t,y(:,2),'bs','linewidth',1,'markersize',5,'markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.7 0.7 0.7]);
points=1:1:length(t);
plot(t,y(:,2),'go','linewidth',1,'markersize',5,'markerindices',points);
hold on;
%白底，网格
set(0,'defaultfigurecolor','w')
grid on
hold on
%坐标标注，刻度间隔及区间
xlabel('$Time$','interpreter','latex','Rotation',0);
ylabel('$Proportion$','interpreter','latex');
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1])
axis([0 1 0 1]);
%图例，标题
legend('y=0.2','y=0.5','y=0.7');
title('(b)','position',[0.5 -0.2]','FontWeight','bold');
% 5 z-t,这里我们以0.2,0.5,0.7为例
clc,clear;
subplot(2,2,3); %将figure函数替换
%线条
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;      
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.2 0.2 0.2]); %一般z变化，x和y要么一起跟着变化，要么一直保持为0.5
points=1:1:length(t); 
plot(t,y(:,3),'rh','linewidth',1,'markersize',5,'markerfacecolor','r','markerindices',points);
%MATLAB常用线型：-实线（默认）；--双划线；:虚线；:.点划线。（英文字符）
%MATLAB常用颜色：r红色；g绿色；b蓝色；c青绿色；m洋红色；y黄色；k黑色；w白色。
%MATLAB常用点标记符：+加号；o圆圈；*星号；.实点；x叉号；s正方形；d菱形；^上三角；v下三角；>右三角；<左三角；p五角星，h六芒星。
hold on;
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.5 0.5 0.5]);
points=1:1:length(t);
plot(t,y(:,3),'bs','linewidth',1,'markersize',5,'markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.7 0.7 0.7]);
points=1:1:length(t);
plot(t,y(:,3),'go','linewidth',1,'markersize',5,'markerindices',points);
hold on;
%白底，网格
set(0,'defaultfigurecolor','w')
grid on
hold on
%坐标标注，刻度间隔及区间
xlabel('$Time$','interpreter','latex','Rotation',0);
ylabel('$Proportion$','interpreter','latex');
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1])
axis([0 1 0 1]);
%图例，标题
legend('z=0.2','z=0.5','z=0.7');
title('(c)','position',[0.5 -0.2]','FontWeight','bold');
%5 x-y-z-t ,这里我们以0.2,0.5,0.7为例
clc,clear;
subplot(2,2,4); %将figure函数替换
%x的线条
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;      
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.2 0.2 0.2]); 
points=1:1:length(t); 
plot(t,y(:,1),'rh-','linewidth',1,'markersize',5,'markerfacecolor','r','markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.5 0.5 0.5]);
points=1:1:length(t);
plot(t,y(:,1),'g--','linewidth',1,'markersize',5,'markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.7 0.7 0.7]);
points=1:1:length(t);
plot(t,y(:,1),'b:','linewidth',1,'markersize',5,'markerindices',points);
hold on;
%y的线条
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.2 0.2 0.2]); 
points=1:1:length(t); %中间的1改为大一点的正整数，那么图象上的点就会变得稀疏
plot(t,y(:,2),'rh','linewidth',1,'markersize',5,'markerfacecolor','r','markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.5 0.5 0.5]);
points=1:1:length(t);
plot(t,y(:,2),'bs','linewidth',1,'markersize',5,'markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.7 0.7 0.7]);
points=1:1:length(t);
plot(t,y(:,2),'go','linewidth',1,'markersize',5,'markerindices',points);
hold on;
%z的线条
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.2 0.2 0.2]); 
points=1:1:length(t); 
plot(t,y(:,3),'rh','linewidth',1,'markersize',5,'markerfacecolor','r','markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.5 0.5 0.5]);
points=1:1:length(t);
plot(t,y(:,3),'bs','linewidth',1,'markersize',5,'markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.7 0.7 0.7]);
points=1:1:length(t);
plot(t,y(:,3),'go','linewidth',1,'markersize',5,'markerindices',points);
hold on;
%白底，网格
set(0,'defaultfigurecolor','w')
grid on
hold on
%坐标标注，刻度间隔及区间
xlabel('$Time$','interpreter','latex','Rotation',0);
ylabel('$Proportion$','interpreter','latex');
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1])
axis([0 1 0 1]);
%图例，标题
legend('x=y=z=0.2','x=y=z=0.5','x=y=z=0.7');
title('(d)','position',[0.5 -0.2]','FontWeight','bold');
%% Fig13区块链后演化轨迹
% 把这四幅图放在一张图上，子图部分
% 这里我们以0.2,0.5,0.7为例
% 平面x-t
clc,clear;
figure(13)
subplot(2,2,1); %将后面的figure函数替换，并只留一个标题title 
%线条
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;      
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.2 0.2 0.2]); %一般x变化，y和z要么一起跟着变化，要么一直保持为0.5
points=1:10:length(t); 
plot(t,y(:,1),'rh-','linewidth',1,'markersize',5,'markerfacecolor','r','markerindices',points);
%MATLAB常用颜色：r红色；g绿色；b蓝色；c青绿色；m洋红色；y黄色；k黑色；w白色。
%MATLAB常用点标记符：+加号；o圆圈；*星号；.实点；x叉号；s正方形；d菱形；^上三角；v下三角；>右三角；<左三角；p五角星，h六芒星。
%MATLAB常用线型：-实线（默认）；--双划线；:虚线；:.点划线。（英文字符）
hold on;
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.5 0.5 0.5]);
points=1:10:length(t);
plot(t,y(:,1),'g--','linewidth',1,'markersize',5,'markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M) ,[0 1],[0.7 0.7 0.7]);
points=1:10:length(t);
plot(t,y(:,1),'b:','linewidth',1,'markersize',5,'markerindices',points);
hold on;
%白底，网格
set(0,'defaultfigurecolor','w')
grid on
hold on
%坐标标注，刻度间隔及区间
xlabel('$Time$','interpreter','latex','Rotation',0);
ylabel('$Proportion$','interpreter','latex');
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1])
axis([0 1 0 1]);
%图例，标题
legend('x=0.2','x=0.5','x=0.7');
title('(a)','position',[0.5 -0.2]','FontWeight','bold');
% 5 y-t,这里我们以0.2,0.5,0.7为例
clc,clear;
subplot(2,2,2); %将figure函数替换
%线条
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;    
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.2 0.2 0.2]); %一般y变化，x和z要么一起跟着变化，要么一直保持为0.5
points=1:10:length(t);
plot(t,y(:,2),'rh','linewidth',1,'markersize',5,'markerfacecolor','r','markerindices',points);
%MATLAB常用线型：-实线（默认）；--双划线；:虚线；:.点划线。（英文字符）
%MATLAB常用颜色：r红色；g绿色；b蓝色；c青绿色；m洋红色；y黄色；k黑色；w白色。
%MATLAB常用点标记符：+加号；o圆圈；*星号；.实点；x叉号；s正方形；d菱形；^上三角；v下三角；>右三角；<左三角；p五角星，h六芒星。
hold on;
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.5 0.5 0.5]);
points=1:10:length(t);
plot(t,y(:,2),'bs','linewidth',1,'markersize',5,'markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.7 0.7 0.7]);
points=1:10:length(t);
plot(t,y(:,2),'go','linewidth',1,'markersize',5,'markerindices',points);
hold on;
%白底，网格
set(0,'defaultfigurecolor','w')
grid on
hold on
%坐标标注，刻度间隔及区间
xlabel('$Time$','interpreter','latex','Rotation',0);
ylabel('$Proportion$','interpreter','latex');
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1])
axis([0 1 0 1]);
%图例，标题
legend('y=0.2','y=0.5','y=0.7');
title('(b)','position',[0.5 -0.2]','FontWeight','bold');
% 5 z-t,这里我们以0.2,0.5,0.7为例
clc,clear;
subplot(2,2,3); %将figure函数替换
%线条
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;      
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.2 0.2 0.2]); %一般z变化，x和y要么一起跟着变化，要么一直保持为0.5
points=1:5:length(t); 
plot(t,y(:,3),'rh','linewidth',1,'markersize',5,'markerfacecolor','r','markerindices',points);
%MATLAB常用线型：-实线（默认）；--双划线；:虚线；:.点划线。（英文字符）
%MATLAB常用颜色：r红色；g绿色；b蓝色；c青绿色；m洋红色；y黄色；k黑色；w白色。
%MATLAB常用点标记符：+加号；o圆圈；*星号；.实点；x叉号；s正方形；d菱形；^上三角；v下三角；>右三角；<左三角；p五角星，h六芒星。
hold on;
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.5 0.5 0.5]);
points=1:5:length(t);
plot(t,y(:,3),'bs','linewidth',1,'markersize',5,'markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) ,[0 1],[0.7 0.7 0.7]);
points=1:5:length(t);
plot(t,y(:,3),'go','linewidth',1,'markersize',5,'markerindices',points);
hold on;
%白底，网格
set(0,'defaultfigurecolor','w')
grid on
hold on
%坐标标注，刻度间隔及区间
xlabel('$Time$','interpreter','latex','Rotation',0);
ylabel('$Proportion$','interpreter','latex');
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1])
axis([0 1 0 1]);
%图例，标题
legend('z=0.2','z=0.5','z=0.7');
title('(c)','position',[0.5 -0.2]','FontWeight','bold');
%5 x-y-z-t ,这里我们以0.2,0.5,0.7为例
clc,clear;
subplot(2,2,4); %将figure函数替换
%x的线条
Cm=150,Um=200,C1=100,U1=120,C2=80,L=150,a=0.9,Cs=45,R=60,rs=0.3,C3=25,U2=5,b=0.95,C4=40,C5=2,k=0.8,T=10,rg=0.0348,rn=0.0435,S=10,rb=0.0475,rb1=0.0175,F1=50,F2=20,M=0.5,C21=1000;      
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.2 0.2 0.2]); 
points=1:10:length(t); 
plot(t,y(:,1),'rh-','linewidth',1,'markersize',5,'markerfacecolor','r','markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.5 0.5 0.5]);
points=1:10:length(t);
plot(t,y(:,1),'g--','linewidth',1,'markersize',5,'markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.7 0.7 0.7]);
points=1:10:length(t);
plot(t,y(:,1),'b:','linewidth',1,'markersize',5,'markerindices',points);
hold on;
%y的线条
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.2 0.2 0.2]); 
points=1:10:length(t); %中间的1改为大一点的正整数，那么图象上的点就会变得稀疏
plot(t,y(:,2),'rh','linewidth',1,'markersize',5,'markerfacecolor','r','markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.5 0.5 0.5]);
points=1:10:length(t);
plot(t,y(:,2),'bs','linewidth',1,'markersize',5,'markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.7 0.7 0.7]);
points=1:10:length(t);
plot(t,y(:,2),'go','linewidth',1,'markersize',5,'markerindices',points);
hold on;
%z的线条
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.2 0.2 0.2]); 
points=1:5:length(t); 
plot(t,y(:,3),'rh','linewidth',1,'markersize',5,'markerfacecolor','r','markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.5 0.5 0.5]);
points=1:5:length(t);
plot(t,y(:,3),'bs','linewidth',1,'markersize',5,'markerindices',points);
hold on;
[t,y]=ode45(@(t,y) green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M),[0 1],[0.7 0.7 0.7]);
points=1:5:length(t);
plot(t,y(:,3),'go','linewidth',1,'markersize',5,'markerindices',points);
hold on;
%白底，网格
set(0,'defaultfigurecolor','w')
grid on
hold on
%坐标标注，刻度间隔及区间
xlabel('$Time$','interpreter','latex','Rotation',0);
ylabel('$Proportion$','interpreter','latex');
set(gca,'XTick',[0:0.2:1],'YTick',[0:0.2:1])
axis([0 1 0 1]);
%图例，标题
legend('x=y=z=0.2','x=y=z=0.5','x=y=z=0.7');
title('(d)','position',[0.5 -0.2]','FontWeight','bold');
