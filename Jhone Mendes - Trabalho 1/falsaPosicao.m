%-----------------------------------
% Método da Falsa Posição
% Autor: Jhone Mendes
%-----------------------------------
clear
clc

fprintf('----- Método da Falsa Posição -----\n');
%função
f = @(x)log(2*x)+cos(2*x)-2;
a = 7;
b = 7.5;
%usando erro absoluto estimado, criterio de parada:
erro = 10^-6;

fprintf('Intevalo inicial a: %f b: %f\n', a, b);
%caso o intervalo inicial já ative a condicao de parada
if b - a < erro
    x = a-((b-a)*f(a))/(f(b)-f(a));
    fprintf('x = %.16f\n', x);
    return
end
%primeira iteração é feita fora do while
k = 1;
kmax = 100; %gatilho de parada
xant =0;
x = a-((b-a)*f(a))/(f(b)-f(a));
fprintf(' i  |         xi         |        f(xi)        |        erro        |\n');
fprintf('(1) | %.16f | %.16f | %.16f |\n', x, f(x), abs(x-xant));
while (abs(x-xant) >= erro) && (k < kmax)
   k = k+1;
   xant = x;   
   if f(a)*f(x) > 0
       a = x;
   else
       b = x;
   end
   x = a-((b-a)*f(a))/(f(b)-f(a));
   fprintf('(%d) | %.16f | %.16f | %.16f |\n', k, x, f(x), abs(x-xant));
end

fprintf('\nValor Encontrado!\nApós %d iterações:\nx = %.16f\nerro absoluto estimado = %.16f\n', k, x, abs(x-xant));