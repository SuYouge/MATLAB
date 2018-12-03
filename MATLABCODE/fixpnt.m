function [x,it] = fixpnt(np, a, maxit, tol)
switch np,
    case 1,
        phi = inline('(3*x+10)^(1/5)');
    case 2,
        phi = inline('sin(10*x)+2*cos(x)-3');
    case 3,
        phi = inline('3-atan(x)');
    case 4,
        phi = inline('-2-1/log(x^2+x+1)');
end
    it = 0;
    x  = phi(a);
    while it<=maxit && abs(x-a)>tol,
        it = it + 1 ;
        a  = x;
        x = phi(a);
    end
    
        