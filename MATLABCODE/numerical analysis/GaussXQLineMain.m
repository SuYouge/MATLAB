function [x,XA] = GaussXQLineMain(A,b)
%��˹������ȥ�������Է�����Ax=b�Ľ�
%���Է������ϵ����A
%���Է������еĳ���������b
%���Է�����Ľ⣺x
%��Ԫ���ϵ������XA
N = size(A);
n = N(1);
index = 0;
for i=1:(n-1)
    me = max(abs(A(1:n,i)));
    for k=i:n
        if (abs(A(k,i))==me)
            index = k;
            break;
        end
    end
    temp = A(i,1:n);
    A(i,1:n)=A(index,1:n);
    A(index,1:n) = temp;
    
    bb = b(index);
    b(index)=b(i);
    b(i) = bb;
    
    for j = (i+1):n
        if(A(i,i)==0)
            disp('�Խ�Ԫ��Ϊ0��'); %��ֹ�Խ���Ԫ��Ϊ0
            return;
        end 
        l = A(j,i);
        m = A(i,i);
        A(j,1:n)=A(j,1:n)-l*A(i,1:n)/m; %��Ԫ����
        b(j)=b(j)-l*b(i)/m;
    end
end
x = SolveUpTriangle(A,b);
XA = A;