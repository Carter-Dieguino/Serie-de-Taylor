function[T, taylor] = TaylorSerie(f, xi, xf, orden)
clc 
syms x
xi = input('ingrese valor de "x" base: '); 
xf = input('ingrese valor de "x" a aproximar: '); 
f = input('ingrese la funcion: '); 
orden = input('ingrese el orden del polinomio de Taylor: ');
h = xf-xi; 
taylor = 0; 
tayloranterior = 0; 
i = 1;
for n = 0:orden
    derivada = diff(f, n, x);
    derivada = inline(derivada);
    taylor = (derivada(xi)/factorial(n)) * 100;
    n_derivada(i,1) = i; 
    n_taylor(i,1) = taylor;
    error(i,1) = abs((taylor-tayloranterior)/taylor) * 100;
    tayloranterior = taylor;
    i = i+1;
end
T = table(n_derivada, n_taylor, error)
end