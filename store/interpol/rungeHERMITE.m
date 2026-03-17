clc; clf; clear;
% Runge examples - uniform Hermite

fun=@(x) 1./(1+25*x.^2);
dfun=@(x) -50*x./(1+25*x.^2).^2;
xx=linspace(-1,1);
yy=fun(xx);

nsp=0;
for np=[3,9,15]
  nsp=nsp+1;subplot(3,1,nsp);
  x=linspace(-1,1,np);
  data=cell(1,np);
  % also control some derivatives at the ends
  data{1}=[x(1),fun(x(1)),dfun(x(1))];
  data{2}=[x(2),fun(x(2)),dfun(x(2))];
  for i=3:np-2
    data{i}=[x(i),fun(x(i))];
  end
  data{np-1}=[x(np-1),fun(x(np-1)),dfun(x(np-1))];
  data{np}=[x(np),fun(x(np)),dfun(x(np))];
  
  [H,t]=hermite_interpolation(data);
  yyy=horner_newton(H,t,xx);

  plot(xx,yy,xx,yyy);
  maxdiff=max(abs(yy-yyy));
  title(sprintf("uniform+Hermite | num of points: %d | max difference: %.2f\n",np,maxdiff));
end

saveas(gca(),"rungeHERMITE.png","png");
