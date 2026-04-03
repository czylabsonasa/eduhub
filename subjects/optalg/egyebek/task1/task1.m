clc; clear; 
close all;



function sima()
    figure(1);
    hold on;
    axis equal;

    data=readtable("pontok.csv");
    X=data.Var1;
    Y=data.Var2;
    Z=data.Var3;
    M=length(X);
    
    %plot3(X,Y,Z,"*");
    
    A=[ones(size(X)), X,Y];
    eig(A'*A)

    f=@(w) 1/M*norm(A*w-Z)^2;
    f0=@(w1,w2,w3) f([w1;w2;w3]);
    
    df=@(w) 2/M*((A'*A)*w-A'*Z);
    
    w_lkn=(A'*A)\(A'*Z);
    
    [XX,YY]=meshgrid(-2:5, -5:2, 55);
    ZZ=arrayfun(@(w2,w3)f0(0,w2,w3), XX,YY);
    
    contour(XX,YY,ZZ,33)
    w=4*(rand(3,1)-0.5);
    path=[w];
    for it=1:100000
        g=-df(w);
        if norm(g)<1e-4, break; end
        a=armijo(w,g,f,df);
        w=w+a*g;
        path=[path,w];
    end
    plot(path(2,:),path(3,:),"*")
    title(string(it));
    hold off;
end

function nemsima()
    figure(2);
    hold on;
    axis equal;
    
    data=readtable("pontok.csv");
    X=data.Var1;
    Y=data.Var2;
    Z=data.Var3;
    M=length(X);
    
    mX=mean(X);
    sX=std(X);
    mY=mean(Y);
    sY=std(Y);
    mZ=mean(Z);
    sZ=std(Z);
    
    X=(X-mX)/sX;
    Y=(Y-mY)/sY;
    Z=(Z-mZ)/sZ;


    %plot3(X,Y,Z,"*");
    
    A=[ones(size(X)), X,Y];
    eig(A'*A)
    
    f=@(w) 1/M*norm(A*w-Z)^2;
    f0=@(w1,w2,w3) f([w1;w2;w3]);
    
    df=@(w) 2/M*((A'*A)*w-A'*Z);
    
    w_lkn=(A'*A)\(A'*Z);
    
    [XX,YY]=meshgrid(-2:5, -5:2, 55);
    ZZ=arrayfun(@(w2,w3)f0(0,w2,w3), XX,YY);
    
    contour(XX,YY,ZZ,33)
    w=4*(rand(3,1)-0.5);
    path=[w];
    for it=1:100000
        g=-df(w);
        if norm(g)<1e-4, break; end
        a=armijo(w,g,f,df);
        w=w+a*g;
        path=[path,w];
    end
    plot(path(2,:),path(3,:),"*")
    title(string(it));
    hold off;
end


seed=12211;
rng(seed);
sima()

rng(seed);
nemsima()







function a=armijo(x,p,f,df)
    dfp=df(x)'*p;
    fx=f(x);
    c=0.8;
    rho=0.5;
    a=1;
    while f(x+a*p)>fx+c*a*dfp
      a=rho*a;
    end
end





hold off;

