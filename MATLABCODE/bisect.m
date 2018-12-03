function [x,it] = bisect(np, a, b, maxit, tol)
    fa = testf(a,np);
    fb = testf(b,np);
    it = 0;
    while abs(b-a)>tol
        it = it + 1;
        x = a/2+b/2;
        fx = testf(x,np);
        if sign(fx)==sign(fa),
            a = x ;fa = fx;
        else
            b = x; fb = fx;
        end
    end