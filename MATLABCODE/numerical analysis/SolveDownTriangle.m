function x=SolveDownTriangle(A,b)
%求下三角系数矩阵的线性方程组Ax=b的解
%线性方程组的系数：A
%线性方程组中的常数向量：b
%线性方程组的解：x
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