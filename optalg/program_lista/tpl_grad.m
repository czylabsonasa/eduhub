clc; clear; clf;
hold on;

f0=;
f=;
df0=;
df=;
ox=;

xx=linspace();
yy=linspace();
[X,Y]=meshgrid(xx,yy);

Z=f0(X,Y);
contour(X,Y,Z);

tol=1e-6;
maxstep=50;

x=;

trace=[x];
for it=1:maxstep

  x1=;

  trace=[trace;x1];

  if norm(x-x1)<tol || norm(df(x1))<tol, break; end

end

plot(trace(1,:),trace(2,:),"o-");
plot(ox(1),ox(2),"X");

norm_df=norm(df(trace(:,end)));
title(sprintf("steps: %d df: %.4f",it,norm_df));

hold off;
