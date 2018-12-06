function x=SolveUpTriangle(A,b)
%求上三角系数矩阵的线性方程组Ax=b的解
%线性方程组的系数：A
%线性方程组中的常数向量：b
%线性方程组的解：x
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