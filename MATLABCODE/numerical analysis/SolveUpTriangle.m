function x=SolveUpTriangle(A,b)
%��������ϵ����������Է�����Ax=b�Ľ�
%���Է������ϵ����A
%���Է������еĳ���������b
%���Է�����Ľ⣺x
N = size(A);
n = N(1);
for i=n:-1:1
    if (i<n)
        s = A(i,(i+1):n)*x((i+1):n,1);
    else
        s = 0;
    end
    x(i,1)=(b(i)-s)/A(i,i);
end