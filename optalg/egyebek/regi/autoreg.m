% rekurziv sorozat hibaval -> a "legjobb" egyutthatokat keressuk

clear;
clf;
close all;

y=dlmread("idosor.txt");
y=y(:);
N=length(y);
t=(1:N)';

plot(t,y);

% tegyuk fel hogy ennyit ismerunk
N0=80;
b=y(4:N0);

%A=y(repmat((0:(N0-4))',1,3)+[1 2 3]);
A=[y(1:N0-3),y(2:N0-2),y(3:N0-1)];

% olyan x egyutthatokat keresunk melyre A*x es b a legkozelebb van 
% egymashoz...
x=(A'*A)\(A'*b);


yb=y;
for k=(N0+1):N
  yb(k)=x'*yb(k-3:k-1);
end
hold on;
plot(t(N0+1:N),yb(N0+1:N),'r*')


