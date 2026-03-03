% Peter - accel - solution
clc; clf; clear;

delete peter_acc_solution.txt;
diary peter_acc_solution.txt;

hold on;

rng(2*22*22);

t=0:2:12;
acc=2.22;
f=acc/2*t.^2+t.*datasample(-10:10,length(t))/12;
f=round(f,2);
f(1)=0;


% f
% return

% we are also examine the rref
% transforming them to a column vector
t=t(:); f=f(:);
% build the gaussian equation
A=[t.^2];
fprintf("- the rref of the gaussian normal equation:\n\n")
disp(rref([A'*A, A'*f]))
fprintf("\n");

% also using the backslash to solve the system
x=(A'*A)\(A'*f);

% we are searching the in s+a/2*t^2 form
a=2*x(1);

plot(t,f,"*","MarkerSize",8);
% we need more points to plot a nice parabola
xx=linspace(-1,13);
plot(xx,a/2*xx.^2,"r","LineWidth",1);

legend(["data points","the best fitting function"],"Location","southeast");
axis([-1,13,-inf,inf]);

saveas(gca(),"peter_acc_solution.png","png");

fprintf("- the best function is: %.4f/2*t^2\n",a);
fprintf("- at t=13 the position will be x=%.4f/2*13^2 = %.4f\n", a,a/2*13^2);
fprintf("- the position x=1000 will be reached at t=%.4f\n",sqrt(2*1000/a));
fprintf("- the acceleration is a=%.4f\n",a);


hold off;
diary off;
