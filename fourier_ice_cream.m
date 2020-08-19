% Programa para dibujar un helado con las series de Fourier.
clear; clc;

syms x f s t

disp('Fourier Series');

% En caso se desea que sea parametrizable el programa.
% T=input('Ingrese el periodo de la función:')
% B=input('Ingrese el inicio de la función:')
% f=input('Ingrese la función a evaluar: ')

n=input('Ingrese N que desea Evaluar: ');
disp('Cargando serie de Fourier......')

% Primera función para dibujar el cono del Helado;
firstFunction = -(1 - abs(x)) - pi;
valueFirstFunctionFourier = fourierSeries(firstFunction, n);

% Segunda función que dibuja la parte superior del helado;
secondFunction = -x^2/14 + 4.6;
valueSecondFunctionFourier = fourierSeries(secondFunction, n);

% Tercera función que dibuja la división entre el cono y la parte superior
% del helado.
thirdFunction = 2;
valueThirdFunctionFourier = fourierSeries(thirdFunction, n);

% Función para calcular Fourier Series
function valueFourier = fourierSeries(functionExpression, maxValue)
    
    syms x f s t    
    % Cálculo dela serie de Fourier
    max=maxValue;
    T=4*pi;
    B=-2*pi;
    f = functionExpression;
    
    A0=((2/T)*int((f*cos(2*pi*0*1/T)),x,B,T+B))/2;

    s=A0;

    for N=1:max    
      an = (2/T)*int((f*cos(2*pi*N*x/T)),x,B,T+B);
      bn = (2/T)*int((f*sin(2*pi*N*x/T)),x,B,T+B);
      as = an*cos(2*pi*N*x/T);
      bs = bn*sin(2*pi*N*x/T);    
      s=s+as+bs; 
    end 
    
    %Gráficamos el resultado de fourier de la función calculada y la ponemos de color verde.
    splot = fplot(s,[B,4*T+B]);    
    set(splot,'Color','g');
    % Activamos la cuadricula en la gráfica
    grid on
    
    % Etiquetas para la Tabla.
    title('Fourier')
    xlabel('x');
    ylabel('y');
    
    %Cambiamos el tamaño del Plot.
    x0=10;
    y0=10;
    width=550;
    height=300;
    set(gcf,'position',[x0,y0,width,height])
    
    % Permitimos que se pueda redibujar sobre el plot.
    hold on;
    
    % Graficamos la función ingresada para tener de referencia y la ponemos de color rojo.
    funplot =fplot(f, [B,T+B]);
    set(funplot,'Color','r');
    
    % Devolvemos el valor de Fourier.
    valueFourier = s;
end
