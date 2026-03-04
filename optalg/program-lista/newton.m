function x1=newton(f,df,x0,tol)
   maxit=50;
   x1=x0-f(x0)/df(x0);
   for it=1:maxit
      if abs(x1-x0)<tol, break; end
      x0=x1;
      x1=x0-f(x0)/df(x0);
   end
end