function dydt=green2(t,y,a,C1,C21,C3,C4,C5,U2,U1,L,R,rn,rg,rb,b,F2,F1,k,S,M) %函数定义前后保持一致，y改为x，那么后面y(1)改为x(1)，以此类推。
dydt=zeros(3,1);
dydt(1)=y(1)* (y(1)-1)* (C1-C21-(L*a-U1*y(2))*(y(3)-1));
dydt(2)=y(2)* (y(2)-1)* (C3-C4-U2+(b-1)*R*(1+rn)*y(3));
dydt(3)=y(3)* (y(3)-1)*(F2+R*(-1+k+k*rb-rn)-F2*y(1) +(M -R*rg+R*rn-S+C5*(y(1)-1)-(F1 + M)*y(1))*y(2));
end