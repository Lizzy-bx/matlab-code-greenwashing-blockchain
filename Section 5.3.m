
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