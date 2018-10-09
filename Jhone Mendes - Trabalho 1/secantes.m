%-----------------------------------
% Método das Secantes
% Autor: Jhone Mendes
%-----------------------------------
%function [] = secantes(f,x0,x1,erro)
clear
clc

fprintf('----- Método das Secantes -----\n');

f = @(x)log(2*x)+cos(2*x)-2;
x0 = 7.0;
x1 = 7.5;
%usando erro absoluto estimado, criterio de parada:
erro = 10^-6;

fprintf('Intevalo inicial a: %f b: %f\n\n', x0, x1);

%primeira iteração é feita fora do while
k = 1;
kmax = 100;%gatilho de parada

x = (x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
fprintf(' i  |         xi         |        f(xi)       |        erro        |\n');
fprintf('(1) | %.16f | %.16f | %.16f |\n', x, f(x), abs(x-x1));
while (abs(x-x1)>=erro)&&(k < kmax)
    k = k+1;    
    x0 = x1;
    x1 = x;
    x = (x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
    fprintf('(%d) | %.16f | %.16f | %.16f |\n', k, x, f(x), abs(x-x1)); 
end
fprintf('\nValor Encontrado!\nApós %d iterações:\nx = %.16f\nerro absoluto estimado = %.16f\n', k, x, abs(x-x1));