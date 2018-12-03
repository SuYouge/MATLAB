function test713
    a = [1 -2*pi 1 -3];
    b = [2 -pi 3 -2];
    tol = 1e-6;
    maxit = 100;
    fprintf('    ===   Solution and Iteration Numbers    ===\n');
    fprintf('    PROB    BISECT    FIXEDPOINT NEWTON    SECANT\n');
    fprintf('    -----------------------------------------    \n');
    for np = 1:4,
        a1 = a(np);
        b1 = b(np);
        [x1,it1] = bisect(np, a1, b1, maxit, tol);
        [x2,it2] = fixpnt(np, (a1+b1)/2, maxit, tol);
        [x3,it3] = newton(np, (a1+b1)/2, maxit, tol);
        [x4,it4] = secant(np, a1, b1, maxit, tol);
        fprintf('%6d'     ,np);
        fprintf('   %8.4f',x1,x2,x3,x4);
        fprintf('\n       ');
        fprintf('   %10d',it1,it2,it3,it4);
        fprintf('\n');
    end
    