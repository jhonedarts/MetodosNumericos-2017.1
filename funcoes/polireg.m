%Regressão Polinomial
%Autor: Jhone Mendes
clc                                                                         
clear

%inputs
%x = input('vector X: ');
%y = input('vector Y: ');
%m = input('Grau da regressão polinomial: ');

%x = [50;80;130;200;250;350;450;550;700];
%y = [99;177;202;248;229;219;173;173;142;72];
x = [0;1;2;3;4;5];
y = [2.1;7.7;13.6;27.2;40.9;61.1];
%x = [3;4;5;7;8;9;11;12];
%y = [1.6;3.6;4.4;3.4;2.2;2.8;3.8;4.6];
%x = [2;3;4;5;7;10];
%y = [5.2;7.8;10.7;13;19.3;27.5];
m = 3;
ym = sum(y)/length(y);

n = length(x);
model = zeros(n,(m+1)*2);
for i=1:n
    for j=1:(m+1)*2
        if j <= m+1
            model(i,j) = x(i)^(j+1); % xi
        else if(j == (m+1)*2)
                model(i,j) = (y(i)-ym)^2; % (yi-ym)^2
            else
                model(i,j) = (x(i)^(j-3))*y(i); %xi yi
            end
        end
    end
end

exps = zeros(m+1, 3);
expsR= zeros(0,m+1);
%first line
exps(1,1) = length(x);
exps(1,2) = sum(x); 
exps(1,3) = sum(model(:,1)); % sum(x^2)
expsR(1) = sum(y);
%another lines
for i=2:m+1
    for j=1:4
        if j==4
            expsR(i) = sum(model(:,j+i-2)); %sum(xi yi)
        else
            if and(j==1, i==2)
                exps(i,j) = sum(x);
            else
                exps(i,j) = sum(model(:,i+j-3)); %sum(xi)
            end
        end
    end
end

a = exps\expsR';
st = model(:,(m+1)*2-1)';
sr = zeros(length(x),0);
for i=1:n
    sr(i) = (y(i)-a(1)-a(2)*x(i)-a(3)*(x(i))^2)^2;
end

syx = sqrt(sum(sr)/(n-(m+1)));
err = (sum(st) - sum(sr))/sum(st);
errC = sqrt(err);

disp('Tabela de dados: ');
for i=1:n
    for j=1:(m+1)*2
        fprintf('%.4f   ', model(i,j));
    end
    fprintf('\n');
end
%disp(model);
fprintf('\nCoeficientes de a:\n');
%disp(exps);
for i=1:m+1
    for j=1:3
        fprintf('%.4f   ', exps(i,j));
    end
    fprintf('\n');
end
fprintf('\nResultados:\n');
%disp(expsR);
for i=1:m+1
    fprintf('%.4f   ', expsR(i));    
end
fprintf('\n\n');
disp('Valores de a: ');
for i=1:3
    fprintf('%.4f   ', a(i));    
end
fprintf('\n\n');
disp('Erro-padrão da estimativa:');
disp(syx);
disp('Coeficiente de Determinação:');
disp(err);
disp('Coeficiente de Correlação:');
disp(errC);
