% Peter - watertank - solution
clc; clf; clear;
delete peter_water_solution.txt;
diary peter_water_solution.txt;

hold on;

t=0:2:12;
f=[3,4,5,5.5,6.5,7,8];

% we are also examine the rref
% transforming them to a column vector
t=t(:); f=f(:);
% build the gaussian equation
A=[ones(size(t)), t];
fprintf("- the rref of the gaussian normal equation:\n\n")
disp(rref([A'*A, A'*f]))
fprintf("\n");



p=polyfit(t,f,1);
% we are searching the line in b+at form
a=p(1); b=p(2);

plot(t,f,"*","MarkerSize",8);
% saveas(gca(),"peter_water_data.png","png");
% return;

plot([-1,13],polyval(p,[-1,13]),"r","LineWidth",1);

legend(["data points","the best fitting line"],"Location","southeast");
axis([-1,13,2,9]);

saveas(gca(),"peter_water_solution.png","png");

fprintf("- the best line is: %.4f + %.4f*t\n",b,a);
fprintf("- at t=20 the height of the water is: %.4f + %.4f*20 = %.4f\n",b,a,polyval(p,20));
fprintf("- the tank will be full at t=(50-%.4f)/%.4f = %.4f\n",b,a,(50-b)/a);
fprintf("- the tank was empty at t=(0-%.4f)/%.4f = %.4f\n",b,a,(0-b)/a);


hold off;

diary off;