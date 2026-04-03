% a 4. feladat generalt adattal

%clear; 
clf;
close all;

n=100;

t=linspace(0,2*pi,n)';
%y=sin(t)+sin(2*t);
fun = @(x) sin(x) + x.*sin(2*x);
y=fun(t);



megvan=50; % ez százalék
if false
  van=rand(n,1)<megvan/100; 
end
hiany=~van;


tv=t(van);
yv=y(van);
th=t(hiany);
yh=t(~hiany);

ax = tiledlayout(3,1);
ax1 = nexttile;
%subplot(3,1,1);
plot(ax1,tv,yv,'k*',t,y,'b')
xlim([0,2*pi]);

S=eye(n);
Sv=S(:,van); % S van
Sh=S(:,hiany); % S hianyzik

% elsorendu
D1=diag(ones(n,1))+diag(-1*ones(n-1,1),1);

% masodrendu
% D=diag(ones(n,1))+diag(-2*ones(n-1,1),1)+diag(ones(n-2,1),2);
D2=-2*diag(ones(n,1))+diag(ones(n-1,1),1)+diag(ones(n-1,1),-1);
Dsim = diag(ones(n-1,1),-1)  - diag(ones(n-1,1),1); D3(1,1)=1; D3(n,n)=-1;

D = D2; d = "2";
% olyan yh vektort keresunk mely a meglevo vektorral osszefesulve a leheto
% legsimabb: simasag elso/masodik differencia (derivalt) a leheto legkisebb
% az osszefesult vektor:
% Sh*yh+Sv*yv ->
% D*Sh*yh+D*Sv*yv a leheto legkisebb
% D*Sh*yh a leheto legkozelebb van a (-D*Sv*yv) vektorhoz...-> lkn
A=D*Sh;
b=D*Sv*yv;
yh=(A'*A)\(-A'*b);

ax2 = nexttile;
%subplot(3,1,2);
plot(ax2,th,yh,'r*',t,y,'b')
xlim([0,2*pi]);


%subplot(3,1,3);
ax3 = nexttile;
plot(ax3,tv,yv,'k*',th,yh,'r*',t,y,'b')
xlim([0,2*pi]);

hiba = norm(yh - fun(th));

title(ax,sprintf("D%d hiba: %.4f", d, hiba));

