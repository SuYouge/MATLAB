function [x,L] = Choleskey(A,b)
%乔列斯基分解法求线性方程组Ax=b的解
%线性方程组的系数矩阵：A
%线性方程组中的常数向量：b
%线性方程组的解：x
%乔列斯基分解后的下三角矩阵：L
N = size(A);
n = N(1);
L(1,1) = sqrt(A(1,1));
L(2:n,1) = A(2:n,1)/L(1,1); %L的第一列
for k=2:n
    L(k,k) = sqrt(A(k,k)-L(k,1:(k-1))*transpose(L(k,1:(k-1))));%L对角元素
    for i = (k+1) :n
        L(i,k) = (A(i,k)-L(i,1:(k-1))*transpose(L(k,1:(k-1))))/L(k,k);%L第k列
    end
end
y = SolveDownTriangle(L,b);
x = SolveUpTriangle(transpose(L),y); %求解方程