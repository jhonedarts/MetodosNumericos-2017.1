%minimos quadrados linear geral
%autor: Jhone Mendes
clc                                                                         
clear
format long;
%exemplo pratico aula 19
%x = [0; 1; 2; 3; 4; 5];
%y = [2.1; 7.7; 13.6; 27.2; 40.9; 61.1];

%exercicio
x = [0.5; 1; 2; 3; 4; 5; 6; 7; 9];
y = [6; 4.4; 3.2; 2.7; 2.2; 1.9; 1.7; 1.4; 1.1];

z = [ones(size(x)) x x.^2];
coefA = z'*z;
termI = z'*y;
a = coefA\termI;

sr = sum((y-z*a).^2);
syx = sqrt(sr/(length(x)- length(a)));
st = sum((y-mean(y)).^2);
r2 = 1 - (sr/st);

disp('Tabela z:');
disp(z);
disp('Coeficientes de a:');
disp(coefA);
disp('Termos independentes');
disp(termI);
disp('Valores de a:');
disp(a);
disp('Erro-padrao da estimativa (syx):');
disp(syx);
disp('Coeficiente de determinacao:');
disp(r2);

%t = 0.5;

%t = 0;
pt = zeros(10);
pt(1) = a(1)^(-1.5*0)+a(2)^(-0.3*0)+a(3)^(-0.05*0);
disp('Resultado final:');
disp(pt(1));
for i=1:9    
    pt(i+1) = a(1)^(-1.5*i)+a(2)^(-0.3*i)+a(3)^(-0.05*i);
end
t = 0 : 1 : 9;
plot(t,pt);
hold on;
plot(x,y,'.');