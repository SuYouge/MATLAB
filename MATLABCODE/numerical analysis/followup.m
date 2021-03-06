function x = followup(A,b)
%追赶法分解法求线性方程组Ax=b的解
%线性方程组的系数矩阵：A
%线性方程组中的常数向量：b
%线性方程组的解：x
%A=[1 -3 0 0 0;8 2 0 0 0;0 6 3 7 0;0 0 12 4 9;0 0 0 -4 5]
%b=[1,1,1,1,1]'
n = rank(A);
for i=1:n
    if(A(i,i)==0)
        disp('ERROR:对角有元素0！');
        return;
    end
end
d = ones(n,1);
a = ones(n-1,1);
c = ones(n-1);
for i=1:n-1
    a(i,1)=A(i+1,i);
    c(i,1)=A(i,i+1);
    d(i,1)=A(i,i);
end
d(n,1) = A(n,n);
%求解Ly=b的解y，解保存在b中
for i=2:n
    d(i,1)=d(i,1)-(a(i-1,1)/d(i-1,1))*c(i-1,1);
    b(i,1)=b(i,1)-(a(i-1,1)/d(i-1,1))*b(i-1,1);
end
%求解Ux=y的解x
x(n,1)=b(n,1)/d(n,1);
for i=(n-1):-1:1
    x(i,1) = (b(i,1)-c(i,1)*x(i+1,1))/(d(i,1));
end




