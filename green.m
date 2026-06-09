function dydt=green(t,y,C1,C2,C3,C4,U2,U1,L,R,rn,a,rg,b,F2,F1,k,S,rb) %函数定义前后保持一致，y改为x，那么后面y(1)改为x(1)，以此类推。
dydt=zeros(3,1);%双方则改为（2,1），四方则改为（4,1）
%参数字母如果是希腊字母，尽量用其读音拼写，可以百度查看
dydt(1)=y(1)* (y(1)-1)* (C1-C2-L*a-U1*y(2)+L*a*y(3)+U1*y(2)*y(3));
dydt(2)=y(2)* (y(2)-1)* (C3-C4-U2-R*y(3)+R*b*y(3)-R*rn*y(3)+R*b*rn*y(3));
dydt(3)=y(3)* (y(3)-1)*(F2-R+R*k-F2*y(1)-R*rn-S*y(2)+ R*k*rb-F1*y(1)*y(2)-R*rg*y(2)+R*rn*y(2));
end