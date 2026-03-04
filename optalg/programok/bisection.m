function x=bisection(f,a,b,tol)
   while b-a>tol
      m=0.5*(a+b);
      if f(m)*f(a)<0
         b=m;
      else
         a=m;
      end
   end
   x=0.5*(a+b);
end