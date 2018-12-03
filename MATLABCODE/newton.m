function [x,it] = newton(np, a, maxit, tol)
    it = 0;
    x = a;
    [f,g] = testf(x,np);
    while it<=maxit && abs(f)>tol,
        it = it +1;
        x  = x -g\f;
        [f,g] = testf(x,np);
    end