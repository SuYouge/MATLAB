% % function [f,f0] = Language(x,y,x0)
%����֪���ݵ���������ղ�ֵ����ʽ
%��֪���ݵ��x����������x
%��֪���ݵ��y����������y
%��ֵ���x����x0
%��õ��������ղ�ֵ����ʽ��f
%x0���Ĳ�ֵ��f0
% % syms t;
% % if (length(x) == length(y))
% %     n = length(x);
% % else
% %     disp('x��y��ά������ȣ�'); %���
% %     return;
% % end
% % f = 0.0;
% % for i = 1:n
% %     l = y(i);
% %     for j =1:i-1
% %         l = l*(t-x(j))/(x(i)-x(j));
% %     end
% %     for j = i+1:n
% %         l = l*(t-x(j))/(x(i)-x(j));     %�����������ջ�����
% %     end
% %    f = f+1;        %�����������ղ�ֵ����
% %    simplify(f);        %����
% % end
% % f0 = subs(f,'t',x0);
% %��֪��Ϊʲô����ʾ���� ���ǰ��ļ����ڸ�Ŀ¼������
function yy=Language(x,y,xi)
m=length(x);
n=length(y);
if m ~= n , error('����x��y�ĳ��ȱ���һ��'); end; 
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

