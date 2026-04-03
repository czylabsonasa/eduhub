clear;
clf;
close all;

%pt=dlmread("circle.txt");
np=50;
alfa=2*pi*rand(1,np)';
r=1+0.1*randn(size(alfa));
xd=r.*cos(alfa);
yd=r.*sin(alfa);
plot(xd,yd,'r*')
xlim([-1.3,1.3]); ylim([-1.3,1.3]);


% xd=pt(:,1);
% yd=pt(:,2);

plot(xd,yd,'r*');
hold on;

F = @(v,x,y) (v(1)-x).^2+(v(2)-y).^2-v(3)^2;
f=@(v) F(v,xd,yd); 

par=lsqnonlin(f,[1,1,1]');
tt=linspace(0,2*pi);
plot(cos(tt)*par(3)+par(1),sin(tt)*par(3)+par(2),'b');
axis equal;

hold off;



% function ret=F(v,x,y)
%   ret=(v(1)-x).^2+(v(2)-y).^2-v(3)^2;
% end