function [f,f0] = Newtonback(x,y,x0)
%����֪���ݵ�����ţ�ٲ�ֵ����ʽ
%��֪���ݵ��x����������x
%��֪���ݵ��y����������y
%��ֵ���x����x0
%��õĺ���ţ�ٲ�ֲ�ֵ����ʽ��f
%x0���Ĳ�ֵ��f0
syms t;
if (length(x) == length(y))
    n = length(x);
    c(1:n) = 0.0;
else
    disp('x��y��ά������ȣ�'); %���
    return;
end
f = y(n);
y1 = 0;
xx = linspace(x(1),x(n),n);
if (xx ~= x)
    disp('�ڵ�֮�䲻�ǵȾ�ģ�');
    return;
end
for i=1:n-1
    for j=i+1:n
        y1(j) = y(j)-y(j-1);    
    end
    c(i) = y1(n);
    l = t;
    for k = 1:i-1
        l = l*(t+k);
    end
    f = f + c(i) * l/factorial(i);
    simplify(f);
    y = y1;
end
f0 = subs(f, 't',(x(n)-x0)/(x(2)-x(1)));
%����д��� �����ֹ�ʽ
