A=[10 20 -1;-6 -8 -3]; b=[140; -72];
Aeq=[1 -1 1]; beq=4;
xlo=[0 0 0]'; xup=[];
c=[-1 -1 -2]; % we need max -> (-1) 
[loc, val]=linprog(c,A,b,Aeq,beq,xlo,xup)
