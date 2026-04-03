% circle lkn
clear; clf;

np=50;
alfa=2*pi*rand(1,np)';
r=1+0.1*randn(size(alfa));
x=r.*cos(alfa);
y=r.*sin(alfa);
plot(x,y,'r*')
xlim([-1.3,1.3]); ylim([-1.3,1.3]);
axis equal;
% for reference
% https://lucidar.me/en/mathematics/least-squares-fitting-of-circle/

A=[x,y,ones(size(x))];
sol=(A'*A)\(A'*(x.^2+y.^2));
xc=sol(1)/2;
yc=sol(1)/2;
R=sqrt(sol(3)+xc^2+yc^2);
hold on;
beta=linspace(0,2*pi-1e-6,100);
plot(xc,yc,'Xb',xc+R*cos(beta),yc+R*sin(beta),'b')

