%-------------------------------------------------
% Método da Fatoração LU
% Autor: Jhone Mendes
% retorna as xaizes(aprox) de um sistema
% linear passado como parametro (como uma matriz)
%-------------------------------------------------
function [x] = fatLU(M)
%M = matriz aumentada do sistema linear
format long;
fprintf('\nFatoração LU ------------------------------------------------------------------\n');
%parametro
% M = [1 -5 1 -13 3 16;
%    -5 1 16 -2 -7 7;
%    -17 6 5 -1 4 -14; 
%    2 11 -1 -5 -20 3; 
%    3 -21 -8 -4 5 -5];
%%test do exemplo 1
% M = [5 2 1 8;
%    3 6 -2 7;
%    2 -4 10 8];

n = size(M, 2)-1;
m = size(M, 1);
swap = zeros(n,1);
%pivotamento da massa
for i=1:n %varre as linhas
    for j=1:m %varre as colunas
        if i==j %para os valores da diagonal principal faça
            for k=i+1:n   
                if abs(M(k,j))>abs(M(i,j)) % se algum valor abaixo for maior do que que o da diagonal, troca
                    swap = M(k,:);
                    M(k,:) = M(i,:);
                    M(i,:) = swap;
                end
            end
        end
    end
end

A = M(:,1:n);
b = M(:,n+1);
L = zeros(n,m);
U = zeros(n,m);

%preenchendo L e U
for i=1:n
    for j=1:m
        if(i>=j)
            if(i==j)
                U(i,j) = 1;
            end
            s = 0;
            for k=1:j-1
                s = s+ L(i,k)*U(k,j);
            end
            L(i,j) = A(i,j) -s;
        else
            s = 0;
            for k=1:i-1
                s = s+ L(i,k)*U(k,j);
            end
            U(i,j) = (A(i,j)-s)/L(i,i);
        end
    end
end
disp('Matriz L: ');
disp(L);
disp('Matriz U: ');
disp(U);
%L*y = b;
y = zeros(n,1);
for i=1:n
    s = 0;
    for k=1:i-1%somar os y ja calculados
        s = s+ L(i,k)*y(k);
    end
    %y da rodada
    y(i) = (b(i)-s)/L(i,i);
end
disp('Vetor y: ');
disp(y);

x = zeros(n,1);
for i=n:-1:1
    s = 0;
    for k=i+1:m%somar os y ja calculados
        s = s+ U(i,k)*x(k);
    end
    %y da rodada
    x(i) = (y(i)-s)/U(i,i);
end
disp('Raízes x: ');
disp(x);
end%function