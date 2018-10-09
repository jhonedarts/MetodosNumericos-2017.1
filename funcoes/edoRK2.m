function [x, y] = edoRK2(edo, xIni, xFim, h, yIni, a, b, c)
% EDORK2 Calcula o resultado aproximado de um pvi usando o método
% usando o método de Runge-Kutta de segunda ordem.
% Variaveis de Entrada:
% xIni   valor inicial de x
% xFim   valor final de x
% h   tamanho do passo
% a   valor inicial de y
% Variaveis de Saída
% x    vetor contendo as coordenadas x da solução
% y    vetor contendo as coordenadas y da solução
% a valores dos coeficientes a_i
% b valores dos coeficientes b_i_j
% c valores dos coeficientes c_i

x(1) = xIni;
y(1) = yIni;

% calculando o numero de passos
n = (xFim-xIni)/h;

for i=1:n
    % calcula o novo valor de x;
    x(i+1) = x(i)+h;
    % calcula k1 e k2
    k1 = edo(x(i), y(i));
    k2 = edo(x(i) + a(2)*h, y(i) + b(2,1)*h*k1);
    % calcula o novo valor de y
    y(i+1) = y(i)+(c(1)*k1 + c(2)*k2)*h; 
end

end

