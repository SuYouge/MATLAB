function [x,L,U] = Crout(A,b)
%克劳特分解法求线性方程组Ax=b的解
%线性方程组的系数：A
%线性方程组中的常数向量：b
%线性方程组的解：x
%克劳特分解后的下三角矩阵：L
%克劳特分解后的上三角矩阵：U
N = size(A);
n = N(1);
L = zeros(n,n);
U = eye(n,n);
L(1:n,1) = A(1:n,1);
U(1,1:n) = A(1,1:n)/L(1,1);
for k=2:n
    for i = k:n
        L(i,k) = A(i,k) - L(i,1:(k-1))*U(1:(k-1),k);
        %L的第k列
    end
    for j = (k+1):n
        U(k,j) = (A(k,j) - L(k,1:(k-1))*U(1:(k-1),j))/L(k,k);
        %L的第k列
    end
end
y = SolveDownTriangle(L,b);
x = SolveUpTriangle(U,y);