function [x,XA]=GaussXQByOrder(A,b)
%高斯顺序消去法求线性方程组Ax=b的解
%线性方程组的系数：A
%线性方程组中的常数向量：b
%线性方程组的解：x
%消元后的系数矩阵：XA
N = size(A);
n = N(1);
for i=1:(n-1)
    for j = (i+1):n
        if(A(i,i)==0)
            disp('对角元素为0！'); %防止对角线元素为0
            return;
        end 
        l = A(j,i);
        m = A(i,i);
        A(j,1:n)=A(j,1:n)-l*A(i,1:n)/m; %消元方程
        b(j)=b(j)-l*b(i)/m;
    end
end
x = SolveUpTriangle(A,b);
XA = A;