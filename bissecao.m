 %% Isolamento da raiz
clc                                                                         
clear
syms x
fx=input('Entre com a fun��o, fx=');
df=diff(fx);
fab=10;
dab=-5;
while fab>0 ||  dab<0
    a=input('entre com o valor de a, a=');
    b=input ('entre com o valor de b, b=');
    fa=subs(fx,a);
    fb=subs (fx,b);
    da=subs(df,a);
    db=subs(df,b);
    fab=fa*fb;
    dab=da*db;
end
%come�ando o m�todo da Bisse��o
E=input ('entre com a precis�o, E=');
y=10;
k=0;
while abs(y)>E
    x1=(a+b)/2;
    y=subs(fx,x1);
    k=k+1;
    if fa*y<0
    b=x1;
    fb=y;
    else
        a=x1;
        fa=y;
    end
end
fprintf('O numero de intera��o �: %d\n',k);
fprintf('A raiz �: %f\n',x1);
fprintf('o erro �: %f\n',abs(y));
