function [f,f0] = ThrSample3 (x,y,x0)
%求已知数据点的第三类三次样条插值多项式及其插值点处的值
%已知数据点的x坐标向量：x
%已知数据点的y坐标向量：y
%左端点的一阶导数：：y3_1
%右端点的一阶导数：：y3_N
%插值点的x坐标：x0
%求得的三次样条插值多项式：f
%求得的x0处的插值：f0
%x= [0 1 2 3 4 5 6.2832]；
%y = [0 0.8415 0.9093 0.1411 -0.7568 -0.9589 0]；
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
A = diag(2*ones(1,n-1)); %求解m的系数矩阵
h0 = x(2)-x(1);
h1 = x(3)-x(2);
he = x(n) - x(n-1);
A(1,2) = h0/(h0 + h1);
A(1,n-1) = 1 - A(1,2);
A(n-1,1) = he/(h0 + he);
A(n-1,n-2) = 1-A(n-1,1);
c = zeros(n-1,1);
c(1) = 3*A(1,n-1)*(y(2)-y(1))/h0 + 3*A(1,2)*(y(3) - y(2))/h1;
for i = 2:n-2
    u = (x(i)-x(i-1))/(x(i+1)-x(i-1));
    lamda = (x(i+1)-x(i))/(x(i+1)-x(i-1));
    c(i) = 3*lamda*(y(i)-y(i-1))/(x(i)-x(i-1)) +...
        3*u*(y(i+1)-y(i))/(x(i+1)-x(i));
    A(i,i+1) = u;
    A(i,i-1) = lamda;  %形成系数矩阵及向量c
end
c(n-1) = 3*(he*(y(2)-y(1))/h0+h0*(y(n)-y(n-1))/he)/(h0 + he);
m = zeros(n,1);
[m(2:n),~] = Choleskey(A,c);%用乔列斯基分解法求解方程组 === 书上用的方法是qr分解法 故答案不同 为-0.8718
m(1) = m(n);
h = x(index + 1) - x(index);%x0所在区间长度
f = y(index) * (2*(t-x(index))+h)*(t-x(index+1))^2/h/h/h + ...
    y(index+1) * (2*(x(index+1)-t)+h)*(t-x(index))^2/h/h/h + ...
    m(index) * (t-x(index))*(x(index+1)-t)^2/h/h - ...
    m(index+1)*(x(index+1)-t)*(t-x(index))^2/h/h;%x0所在区间的插值函数
f0 = subs(f,'t',x0);%x0处的插值