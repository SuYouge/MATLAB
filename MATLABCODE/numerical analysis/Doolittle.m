function [x,L,U] = Doolittle(A,b)
%杜立脱尔分解法求线性方程组Ax=b的解
%线性方程组的系数矩阵：A
%线性方程组中的常数向量：b
%线性方程组的解：x
%杜立脱尔分解后的下三角矩阵：L
%杜立脱尔分解后的上三角矩阵：U
N = size(A);
n = N(1);
L = eye(n,n);%L的对角元素为1
U = zeros(n,n);

U(1,1:n) = A(1,1:n);  %U的第一行
L(1:n,1) = A(1:n,1)/U(1,1); %L的第一列

for k=2:n
    for i = k:n
        U(k,i) = A(k,i) - L(k,1:(k-1))*U(1:(k-1),i);
        %U的第k列
    end
    for j = (k+1):n
        L(j,k) = (A(j,k) - L(j,1:(k-1))*U(1:(k-1),k))/U(k,k);
        %L的第k列
    end
end
y = SolveDownTriangle(L,b);
x = SolveUpTriangle(U,y);