function [f,g] = testf(x,np)
switch np,
    case 1,
        p = [1 0 0 0 -3 -10];
        f = polyval(p,x);
        g = polyval(polyder(p),x);
    case 2,
        f = sin(10*x) + 2*cos(x) - x -3;
        g = 10*cos(10*x) - 2*sin(x) - 1;
    case 3,
        f = x + atan(x) - 3;
        g = 1 + 1/(x^2+1);
    case 4,
        f = (x+2)*log(x^2+x+1) + 1;
        g = log(x^2+x+1) + (x+2)/(x^2+x+1)*(2*x+1);
end