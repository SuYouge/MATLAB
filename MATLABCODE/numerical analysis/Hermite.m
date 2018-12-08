% function [f,f0] = Hermite(x,y,y_1,x0)
% %����֪���ݵ�İ����ز�ֵ����ʽ
% %��֪���ݵ��x����������x
% %��֪���ݵ��y����������y
% %��ֵ���x����x0
% %��֪���ݵ�ĵ���������y_1
% %��õİ����ز�ֵ����ʽ��f
% %x0���Ĳ�ֵ��f0
% syms t;
% f = 0.0;
% if (length(x) == length(y))
%     if (length(y) == length(y_1))
%         n = length(x);
%     else
%         disp('y��y�ĵ�����ά������ȣ�');
%         return;
%     end
% else
%     disp('x��y��ά������ȣ�'); %���
%     return;
% end
% for i=1:n
%     h = 1.0;
%     a = 0.0;
%     for j=1:n
%         if (j~=i)
%             h = h*(t-x(j))^2/((x(i)-x(j))^2);
%             a = a + 1/(x(i)-x(j));
%         end
%     end
%      f = f + h * (x(i)-t)*(2*a*y(i)-y_1(i)+y(i));%%%%%%���Ŵ���
%      f = f + h * ((x(i)-t)*(2*a*y(i)-y_1(i))+y(i));
% end
% f0 = subs(f, 't',x0);
function [f,f0]  = Hermite(x,y,y_1,x0)
syms t;
f = 0.0;
if(length(x) == length(y))
        if(length(y) == length(y_1))
            n = length(x);
        else
            disp('y��y�ĵ�����ά������ȣ�');
            return;
        end
    else
        disp('x��y��ά������ȣ�');
        return;
end

for i=1:n
        h = 1.0;
        a = 0.0;
    for j=1:n
        if( j ~= i)
            h = h*(t-x(j))^2/((x(i)-x(j))^2);
            a = a + 1/(x(i)-x(j));
        end
    end

    f = f + h*((x(i)-t)*(2*a*y(i)-y_1(i))+y(i));

    if(i==n)
        if(nargin == 4)
            f0 = subs(f,'t',x0);
        else
            f = vpa(f,6);
        end
    end
end