clc; clear;

x1=0; h1=5;
x2=5; h2=0;

x=linspace(x1,x2,33);
p=polyfit([x1,x2],[h1,h2],1);
h=polyval(p,x);
h=h(2:end-1);
h=h(:);
obj=mk_obj(h1,h2,x);

[h,t]=fminunc(obj,h);
h=[h1;h;h2];
plot(x,h);

function obj=mk_obj(h1,h2,x)
   N=length(x);
   g=9.81;
   function t=obj0(h)
      h=[h1;h;h2];
      t=0;
      v=0;
      for i=2:N
      dh=h(i-1)-h(i);
      dx=x(i-1)-x(i);
      vp=sqrt(v^2+2*g*dh);
      t=t+2*sqrt(dx^2+dh^2)/(v+vp);
      v=vp;
      end
   end
   obj=@obj0;
end