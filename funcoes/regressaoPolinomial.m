%-----------------------------------
% Método de Regressão Polinomial
% Autores: Alán Bruno e Jhone Mendes
%-----------------------------------
function [] = regressaoPolinomial(x,y,n)

%--------------- testes -------------------
%clear 
%clc;
%format long;
%x = [50;80;130;200;250;350;450;550;700];
%y = [99;177;202;248;229;219;173;142;72];
%n=3;%grau
%x = [0;1;2;3;4;5];
%y = [2.1;7.7;13.6;27.2;40.9;61.1];
%n=2;%grau
%x = [3;4;5;7;8;9;11;12];
%y = [1.6;3.6;4.4;3.4;2.2;2.8;3.8;4.6];
%n=5;%grau
%-----------------------------------------

disp('REGRESSÃO POLINOMIAL...');

xi=[]; yi=[]; xiyi=[];

count=1;
while(count<=2*n)
    vetor=[];
    s=1;
    while(s<=length(x))    
         vetor(s)=x(s)^(count);
         s=s+1;
    end
    xi(count)=sum(vetor);
    count=count+1;
end

count=1;
while(count<=n)
    vetor=[];
    s=1;
    while(s<=length(x))
        vetor(s)=(x(s)^count)*y(s);
        s=s+1;   
    end
    xiyi(count)=sum(vetor);
    count=count+1;    
end
%disp('xiyi');
%disp(xiyi);
matrizCoeficentes=[];
matrizTermos=[];
i=1;
count=1;
while(i<=n+1)
    j=1;
    while(j<=n+2)
        if(i==1 && j==1) 
            matrizCoeficentes(i,j)=length(x);
        elseif(j==n+2 && i==1)
            matrizTermos(i)=sum(y);
        elseif(j==n+2)
            matrizTermos(i)=xiyi(i-1);
        elseif(i==1)
            matrizCoeficentes(i,j)=xi(j-1); 
        else
            matrizCoeficentes(i,j)=xi(j+(i-2));  
        end
        j=j+1;
    end
    i=i+1;
end

disp('Coeficiente das equaçoes Normais');
%disp(matrizCoeficentes);
for i=1:n+1
    for j=1:n+1
        fprintf('%.6e ',matrizCoeficentes(i,j));
    end
    fprintf('\n');
end
fprintf('\n');

disp('Termos indepentes das equações Normais');
%disp(matrizTermos');
for i=1:n+1
    fprintf('%.6e\n',matrizTermos(i));
end
fprintf('\n');

a=matrizTermos/matrizCoeficentes;
disp('Os coeficientes do polinômio são');
disp(a');
vetor=[];
s=1;
while(s<=length(x))   
     i=1;
     temp=y(s)-a(1);    
     while(i<=n)
       temp=temp-a(i+1)*(x(s)^(i));       
       i=i+1;
     end
     vetor(s)=temp^2;
     s=s+1;
end   
Sr=sum(vetor);
%disp('SR');
%disp(Sr);
Syx=sqrt(Sr/(length(x)-(n+1)));
St=0;
mediay=sum(y)/length(x);

i=1;
while(i<=length(x))
    St=St+(y(i)-mediay)^2;   
    i=i+1;
end
Desvio=sqrt(St/(length(x)-1));
R2=(St-Sr)/St;
R=sqrt(R2);

%Resultados
fprintf('O desvio padrão para esta caso é %f\n',Desvio);
fprintf('O Erro-Padrão da estimativa para esta caso foi de %f\n',Syx);
fprintf('O Coficiente de Determinação para esta caso foi de %f\n\n',R2);

if(Syx<Desvio)
    fprintf('Neste caso houve melhora ao relizar o ajuste.\n');
else
    fprintf('Neste caso não houve melhora ao relizar o ajuste.\n');
end
fprintf('Com a aplicação deste método de regressão polinomial\n');
fprintf('foi explicado %.2f',roundn(R2*100,-2));
fprintf('%% ');
fprintf('da incerteza em relação a amostra\n');