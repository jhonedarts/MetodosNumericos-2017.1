%-----------------------------------
% Método de Newton-Raphson
% Autor: Jhone Mendes
%-----------------------------------
clear
clc
x = sym('x');

fprintf('----- Método de Newton-Raphson -----\n');
%função
f = @(x)log(2*x)+cos(2*x)-2;
a = 7;
b = 7.5;
%usando erro absoluto estimado, criterio de parada:
erro = 10^-6;

fprintf('Intevalo inicial a: %f b: %f\n\n', a, b);

h = char(diff(f(x)));
temp = strcat('@(x)', h);
flinha = str2func(temp);

%primeira iteração é feita fora do while
k = 1;
kmax = 100; %gatilho de parada
if(f(a)*diff(flinha(a))<0)&(f(b)*diff(flinha(b))>0)%sinais iguais em a e diferentes em b
    xant = a;
elseif(f(b)*diff(flinha(b))<0)&(f(a)*diff(flinha(a))>0)%sinais iguais em b e diferentes em a
    xant = b;
else%sinais iguais ou diferentes em ambos
    if(f(a)<f(b))
        xant = a;
    else
        xant = b;
    end
end
x = xant -(f(xant)/flinha(xant));
fprintf(' i  |         xi         |        f(xi)       |        erro        |\n');
fprintf('(1) | %.16f | %.16f | %.16f |\n', x, f(x), abs(x-xant));
while (abs(x-xant)>=erro)&&(k < kmax)
    k = k+1;
    xant = x;
    x = xant -(f(xant)/flinha(xant));
    fprintf('(%d) | %.16f | %.16f | %.16f |\n', k, x, f(x), abs(x-xant));
end
fprintf('\nValor Encontrado!\nApós %d iterações:\nx = %.16f\nerro absoluto estimado = %.16f\n', k, x, abs(x-xant));