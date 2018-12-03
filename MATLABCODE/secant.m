function [x,it] = secant(np, a, b, maxit, tol)
    it = 0;
    xo = a;
    x  = b;
    fo = testf(xo,np);
    f  = testf(x,np);
    while it<=maxit && abs(f)>tol,
        it = it + 1;
        xt = x - f / (f-fo)*(x-xo);
        xo = x;
        fo = f;
        x  = xt;
        f  = testf(x,np);
    end
    