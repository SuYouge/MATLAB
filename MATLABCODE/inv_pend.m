syms M m b L I g
% A=[0 1 0 0;0 0 0 0;0 0 0 1;0 0 29.4 0]
% B=[0 1 0 3]'
% C=[1 0 0 0;0 0 1 0];
% D=[0 0]';
A=[0 1 0 0;
    0 -(I+m*L*L)*b/(I*M+I*m+M*m*L*L) m*m*g*L*L/(I*M+I*m+M*m*L*L) 0;
    0 0 0 1;
    0  -m*L*b/(I*M+I*m+M*m*L*L) m*g*L*(m+M)/(I*M+I*m+M*m*L*L) 0];

B = [0 (I+m*L*L)/(I*M+I*m+M*m*L*L) 0 m*L*(m+M)/(I*M+I*m+M*m*L*L)]';

C = [1 0 0 0;0 0 1 0];

D = [0 0]';

M = 1;m = 0.1;b = 0.1;L = 0.25; I = 0.003;g = 9.8;

A = eval(A);

B = eval(B);

Ctrl = ctrb(A,B);

Obser = obsv(A,C);

SYS = ss(A,B,C,D);

[num,den] = ss2tf(A,B,C,D,1);

