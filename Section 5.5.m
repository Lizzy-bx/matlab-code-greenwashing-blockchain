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
