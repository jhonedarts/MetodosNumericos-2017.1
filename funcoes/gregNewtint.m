%-----------------------------------
% Método de interpolação de Gregory Newton
% Autor: Jhone Mendes
%-----------------------------------
function [f] = gregNewtint(x,y,xp)
%clear
%clc
format long;

fprintf('----- Método de interpolação de Gregory Newton -----\n');

%xp = 0.04; % x procurado
grau =3;

%x = [0.01 0.03 0.05 0.07];
%y = [1.01 1.09 1.25 1.49];
n=length(x);
xvec = ones(1,n-1);
for i=1:n-1    
    xvec(i) = x(i+1)-x(i);
end
xvecModa = mode(xvec);
for i=1:n-1    
    if (xvec(i)-xvecModa > 1e-17)
        disp('Os valores de x não são equidistantes');
        return;
    end
end
fdiv = zeros(n-1,n-1);
%calculo das diferenças simples de primeira ordem
for i=1:n-1
    fdiv(i,1) = y(i+1)-y(i);
end
%calculo das diferenças simples de ordem k
for k=2:n-1
    for i=1:((n-k))
        fdiv(i,k) = fdiv(i+1,k-1)-fdiv(i,k-1);
    end
end
fprintf('\ndiferenças simples:\n');
disp(fdiv);
z = (xp-x(1))/abs(x(1)-x(2));
fprintf('Valor do z:\n');
disp(z);

f = y(1);
fprintf('f(x1) = %.16f\n',f);
for i=1:grau
    zeta=1;
    for j=2:i
        zeta = zeta*(z-(j-1));
    end
    f = f + z*zeta*(fdiv(1,i)/factorial(i));
    fprintf('f%d(x) = %.16f\n',i,f);
end



