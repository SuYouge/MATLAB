function [f,f0] = Newton(x,y,x0)
%����֪���ݵ��ţ�ٲ�ֵ����ʽ
%��֪���ݵ��x����������x
%��֪���ݵ��y����������y
%��ֵ���x����x0
%��õľ�����ʽ��ţ�ٲ�ֵ����ʽ����ʽ��f
%x0���Ĳ�ֵ��f0
syms t;
if (length(x) == length(y))
    n = length(x);
    c(1:n) = 0.0;
else
    disp('x��y��ά������ȣ�'); %���
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