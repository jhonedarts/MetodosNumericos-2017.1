%-------------------------------------
% Trabalho 2, comparativo dos métodos
% Gauss, Fatoração LU, Gauss-Jacobi e 
% Gauss-Seidel
% Autor: Jhone Mendes
%-------------------------------------
clear
clc
format long;
disp('Jhone Mendes - Trabalho 2');

%parametro ---------------
erro = 0.00001;

M = [1 -5 1 -13 3 16;
   -5 1 16 -2 -7 7;
   -17 6 5 -1 4 -14; 
   2 11 -1 -5 -20 3; 
   3 -21 -8 -4 5 -5];
%-------------------------

disp('Matriz desafio');
disp(M);

xGauss = gauss(M);
xfatLU = fatLU(M);
xJacobi = gaussJacobi(M, erro);
xSeidel = gaussSeidel(M, erro);

n = size(xGauss);
fprintf('\n\nComparativo Final\n\nRaízes |       Gauss        |      Fat. LU       |       Jacobi       |       Seidel       |\n');
for i=1:n
    fprintf('  x(%d) | %.16f | %.16f | %.16f | %.16f |\n', i, xGauss(i), xfatLU(i), xJacobi(i), xSeidel(i));
end