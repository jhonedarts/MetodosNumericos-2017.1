%function [x, y] = rungeKutta4(f,xIni, xFim, yIni,h)
%function [x, y] = edoRK2(edo, xIni, xFim, h, yIni, a, b, c)

% calculando o numero de passos
clc                                                                         
clear
xFim = 2;
xIni = 0;
yIni = 2;
h = 0.1;
syms s(t) f(p,q)
f(p,q) = -p+q+2;

n = (xFim-xIni)/h;
x = zeros(n,0);
y = zeros(n,0);

x(1) = xIni;
y(1) = yIni;
    for i=1:n
        x(i+1) = x(i)+h;
        K1 = f(x(i), y(i));
        K2 = f(x(i) + h/2, y(i)+ K1*(h/2));
        K3 = f(x(i) + h/2, y(i)+ K2*(h/2));
        K4 = f(x(i) + h, y(i)+ K3*h);
        y(i+1) = y(i) + (h/6)*(K1 + 2*K2 + 2*K3 + K4);
    end
%end
disp(x');
disp(y');