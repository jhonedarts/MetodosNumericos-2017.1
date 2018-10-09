%-----------------------------------
% Método da Bissecção
% Autor: Jhone Mendes
%-----------------------------------
clear
clc

fprintf('----- Método da Bissecção -----\n');
%função
f = @(x)log(2*x)+cos(2*x)-2;
%intervalo
a = 7;
b = 7.5;
%criterio de parada
e = 10^-6;

fprintf('Intevalo inicial a: %f b: %f\n\n', a, b);
%caso o intervalo inicial já ative a condicao de parada
if b - a < e
    x = (a+b)/2;
    fprintf('x = %.8f\n', x);
    return
end
k = 0;
%max de iterações
kmax = 100;
fprintf(' i  |     a      |     b      |     xi     |   f(xi)    |     c      |\n');
while (b-a >= e) && (k < kmax)
    k = k+1;
    x = (a+b)/2;
    if f(a)*f(x) > 0
        a = x;
    else
        b = x;
    end
    fprintf('(%d) | %.8f | %.8f | %.8f | %.8f | %.8f |\n', k, a, b, x, f(x), b-a);
end

fprintf('\nValor Encontrado!\nApós %d iterações:\nx = %.8f\nc = %.8f\n', k, x, b-a);
