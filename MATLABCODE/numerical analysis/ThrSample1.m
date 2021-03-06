function [f,f0] = ThrSample1 (x,y,y_1,y_N,x0)
%求已知数据点的第一类三次样条插值多项式及其插值点处的值
%已知数据点的x坐标向量：x
%已知数据点的y坐标向量：y
%左端点的一阶导数：：y_1
%右端点的一阶导数：：y_N
%插值点的x坐标：x0
%求得的三次样条插值多项式：f
%求得的x0处的插值：f0
%y = [0.8415 0.9093 0.1411 -0.7568 -0.9589 -0.2794 0.6570 0.9894]
%结构体内容引用自非结构体数组对象。 ==== ","打成 "."
syms t;
% f = 0.0;
% f0 = 0.0;
if (length(x) == length(y))
    n = length(x);
else
    disp('x和y的维数不相等！');
end
for i = 1:n
    if(x(i) <= x0)&&(x(i+1)>=x0)
        index = i;
        break;
    end
end %找到x0所在区间
A = diag(2*ones(1,n));
u = zeros(n-2,1);
lamda = zeros(n-1,1);
c = zeros(n,1);
for i = 2:n-1
    u(i-1) = (x(i)-x(i-1))/(x(i+1)-x(i-1));
    lamda(i) = (x(i+1)-x(i))/(x(i+1)-x(i-1));
    c(i) = 3*lamda(i)*(y(i)-y(i-1))/(x(i)-x(i-1)) +...
        3*u(i-1)*(y(i+1)-y(i))/(x(i+1)-x(i));
    A(i,i+1) = u(i-1);
    A(i,i-1) = lamda(i);  %形成系数矩阵及向量c
end
c(1) = 2*y_1;
c(n) = 2*y_N;
m = followup(A,c);%用追赶法解方程组
h = x(index + 1) - x(index);%x0所在区间长度
f = y(index) * (2*(t-x(index))+h)*(t-x(index+1))^2/h/h/h + ...
    y(index+1) * (2*(x(index+1)-t)+h)*(t-x(index))^2/h/h/h + ...
    m(index) * (t-x(index))*(x(index+1)-t)^2/h/h - ...
    m(index+1)*(x(index+1)-t)*(t-x(index))^2/h/h;%x0所在区间的插值函数
f0 = subs(f,'t',x0);%x0处的插值