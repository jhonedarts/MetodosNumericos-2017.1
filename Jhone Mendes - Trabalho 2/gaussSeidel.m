%-------------------------------------------------
% Método Gauss-Seidel
% Autor: Jhone Mendes
% retorna as xaizes(aprox) de um sistema
% linear passado como parametro (como uma matriz)
%-------------------------------------------------
function [x] = gaussSeidel(M, erroTotal)
format long;
fprintf('\nMétodo Gauss-Seidel------------------------------------------------------------\n');
%parametro
%erroTotal = 0.0001;
% M = [1 -5 1 -13 3 16;
%    -5 1 16 -2 -7 7;
%    -17 6 5 -1 4 -14; 
%    2 11 -1 -5 -20 3; 
%    3 -21 -8 -4 5 -5];
%test do exemplo 1
% M = [6 -1 1 7;
%      1 8 -1 16;
%      1 1 5 18];

%test do caso de test 1
% M = [-8 1 -2 -20;
%      2 -6 -1 -38;
%     -3 -1 7 -34];

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

x = zeros(1,n);
xant = zeros(1,n);
erro = ones(1,n);

disp('Raízes | Erros ');
fprintf('iteração');
for i=1:n        
    fprintf('        x(%d)         ',i);
end
for i=1:n        
    fprintf('      erro(%d)        ',i);
end
fprintf('\n');
for cont=1:100 %para impedir loops infinitos
    fprintf('   %d    | ',cont);
    for i=1:n
        xant(i) = x(i);
    end
    
    for i=1:n
        s1 = 0;
        for j=1:i-1
            %fprintf('i %d j %d | s %.4f | a %.4f | xant(%d) %.4f | \n',i,j,s,A(i,j),j,xant(j));
            s1 = s1 + (A(i,j) * x(j));        
        end
        s2 = 0;
        for j=i+1:m
            %fprintf('i %d j %d | s %.4f | a %.4f | xant(%d) %.4f | \n',i,j,s,A(i,j),j,xant(j));
            s2 = s2 + (A(i,j) * xant(j));        
        end
        %fprintf('i %d | b %.4f | s %.4f | A %.4f |----------\n',i,b(i),s,A(i,i));
        x(i) = (b(i) -s1 -s2) / A(i,i);
        %fprintf('x(%d) = %.16f\n\n',i,x(i));
        fprintf('%.16f | ',x(i));
        
    end
    
    for i=1:n
        erro(i) = x(i)-xant(i);
    end
    
    erroS = true;
    for i=1:n
        if abs(erro(i))>erroTotal
            erroS = false;
        end
        fprintf('%.16f | ', erro(i));
    end
    fprintf('\n');
    if (erroS)
        break; %quebra o for
    end
end
end%function

