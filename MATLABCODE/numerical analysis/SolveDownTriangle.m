function x=SolveDownTriangle(A,b)
%��������ϵ����������Է�����Ax=b�Ľ�
%���Է������ϵ����A
%���Է������еĳ���������b
%���Է�����Ľ⣺x
N = size(A);
n = N(1);
for i=1:n
    if (i>1)
        s = A(i,1:(i-1))*x(1:(i-1),1);
    else
        s = 0;
    end
    x(i,1)=(b(i)-s)/A(i,i);
end