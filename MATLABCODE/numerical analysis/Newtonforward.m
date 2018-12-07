function [f,f0] = Newtonforward(x,y,x0)
%求已知数据点的向前牛顿插值多项式
%已知数据点的x坐标向量：x
%已知数据点的y坐标向量：y
%插值点的x坐标x0
%求得的前向牛顿差分插值多项式：f
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
xx = linspace(x(1),x(n),n);
if (xx ~= x)
    disp('节点之间不是等距的！');
    return;
end
for i=1:n-1
    for j=1:n-i
        y1(j) = y (j+1)-y(j);    
    end
    c(i) = y1(1);
    l = t;
    for k = 1:i-1
        l = l*(t-k);
    end
    f = f +c(i) * l/factorial(i);
    simplify(f);
    y = y1;
end
f0 = subs(f, 't',(x0-x(1))/(x(2)-x(1)));
