function [f,f0] = Newton(x,y,x0)
%求已知数据点的牛顿插值多项式
%已知数据点的x坐标向量：x
%已知数据点的y坐标向量：y
%插值点的x坐标x0
%求得的均差形式的牛顿插值多项式多项式：f
%x0处的插值：f0
syms t;
if (length(x) == length(y))
    n = length(x);
    c(1:n) = 0.0;
else
    disp('x和y的维数不相等！'); %检错
    return;
end
f = y(1);
y1 = 0;
l =1;
for i=1:n-1
    for j=i+1 :n
        y1(j) = (y(j)-y(i))/(x(j)-x(i));
    end
    c(i) = y1(i+1);
    l = l*(t-x(i));
    f = f+c(i)*l;
    simplify(f);
    y=y1;
end
f0 = subs(f,'t',x0);