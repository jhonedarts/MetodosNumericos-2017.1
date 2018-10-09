%-------------------------------------------------
% Método da Eliminação de Gauss
% Autor: Jhone Mendes
% retorna as xaizes(aprox) de um sistema
% linear passado como parametro (como uma matriz)
%-------------------------------------------------
function x = gauss(A)
%A = matriz aumentada do sistema linear
format long;

fprintf('\nMétodo da Eliminação de Gauss -------------------------------------------------\n');
%parametro
% A = [1 -5 1 -13 3 16;
%    -5 1 16 -2 -7 7;
%    -17 6 5 -1 4 -14; 
%    2 11 -1 -5 -20 3; 
%    3 -21 -8 -4 5 -5];

%%test do exemplo 1
% A = [5 2 1 8;
%    3 6 -2 7;
%    2 -4 10 8];
n = size(A, 2)-1;
m = size(A, 1);
swap = zeros(n,1);
%pivotamento da massa
for i=1:n %varre as linhas
    for j=1:m %varre as colunas
        if i==j %para os valores da diagonal principal faça
            for k=i+1:n   
                if abs(A(k,j))>abs(A(i,j)) % se algum valor abaixo for maior do que que o da diagonal, troca
                    swap = A(k,:);
                    A(k,:) = A(i,:);
                    A(i,:) = swap;
                end
            end
        end
    end
end
x = zeros(n, 1);
cont = 0;
%multiplicadores
for k = 1:n-1
    for i = k+1:n
        m = A(i,k)/A(k,k);%m = A(2,1)/A(1,1)..
        A(i,k) = 0;        
        for j = k+1:n+1
            A(i,j) = A(i,j) - m*A(k,j);%L2 - m*L1 (termos da matriz)
        end 
        cont=cont+1;
        fprintf('Passo: %d\n',cont);
        disp(A);
    end    
end

%raizes
x(n) = A(n, n+1)/A(n,n); %ultima linha
for k = n-1:-1:1
    s = 0;
    for j = k+1:n
        s = s+A(k,j)*x(j);
        x(k) = (A(k, n+1)-s)/A(k,k);
    end
end

fprintf('A solução deste sistema é o vetor\n');
fprintf('%.16f\n', x);
end%function