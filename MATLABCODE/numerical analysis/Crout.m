function [x,L,U] = Crout(A,b)
%�����طֽⷨ�����Է�����Ax=b�Ľ�
%���Է������ϵ����A
%���Է������еĳ���������b
%���Է�����Ľ⣺x
%�����طֽ��������Ǿ���L
%�����طֽ��������Ǿ���U
N = size(A);
n = N(1);
L = zeros(n,n);
U = eye(n,n);
L(1:n,1) = A(1:n,1);
U(1,1:n) = A(1,1:n)/L(1,1);
for k=2:n
    for i = k:n
        L(i,k) = A(i,k) - L(i,1:(k-1))*U(1:(k-1),k);
        %L�ĵ�k��
    end
    for j = (k+1):n
        U(k,j) = (A(k,j) - L(k,1:(k-1))*U(1:(k-1),j))/L(k,k);
        %L�ĵ�k��
    end
end
y = SolveDownTriangle(L,b);
x = SolveUpTriangle(U,y);