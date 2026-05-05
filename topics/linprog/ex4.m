A=[-2 1;1 -2]; b=[8; 12];
Aeq=[]; beq=[];
xlo=[0 0]'; xup=[];
c=(-1)*[2 1]; % we need max -> (-1) 
[loc, val]=linprog(c,A,b,Aeq,beq,xlo,xup)
