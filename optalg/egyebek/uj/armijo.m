function alfa=armijo(f,df,x,p,alfa)
  rho=0.8;
  c=0.8;
  fx=f(x);
  L=c*(df(x)*p);
  while f(x+alfa*p)>fx-alfa*L
    alfa=alfa*rho;
  end
end
