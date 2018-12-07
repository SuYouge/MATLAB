% % function [f,f0] = Language(x,y,x0)
%求已知数据点的拉格朗日插值多项式
%已知数据点的x坐标向量：x
%已知数据点的y坐标向量：y
%插值点的x坐标x0
%求得的拉格朗日插值多项式：f
%x0处的插值：f0
% % syms t;
% % if (length(x) == length(y))
% %     n = length(x);
% % else
% %     disp('x和y的维数不相等！'); %检错
% %     return;
% % end
% % f = 0.0;
% % for i = 1:n
% %     l = y(i);
% %     for j =1:i-1
% %         l = l*(t-x(j))/(x(i)-x(j));
% %     end
% %     for j = i+1:n
% %         l = l*(t-x(j))/(x(i)-x(j));     %计算拉格朗日基函数
% %     end
% %    f = f+1;        %计算拉格朗日插值函数
% %    simplify(f);        %化简
% % end
% % f0 = subs(f,'t',x0);
% %不知道为什么会提示错误 考虑把文件放在根目录下运行
function yy=Language(x,y,xi)
m=length(x);
n=length(y);
if m ~= n , error('向量x与y的长度必须一致'); end; 
s=0;
for i=1 : n
z=ones(1,length(xi));
for j=1 : n
if j ~= i
z=z.*(xi-x(j))./(x(i)-x(j));
end
end
s=s+z*y(i);
end
yy=s;

