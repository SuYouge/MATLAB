function [f,f0] = Newtonforward(x,y,x0)
%����֪���ݵ����ǰţ�ٲ�ֵ����ʽ
%��֪���ݵ��x����������x
%��֪���ݵ��y����������y
%��ֵ���x����x0
%��õ�ǰ��ţ�ٲ�ֲ�ֵ����ʽ��f
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
xx = linspace(x(1),x(n),n);
if (xx ~= x)
    disp('�ڵ�֮�䲻�ǵȾ�ģ�');
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
