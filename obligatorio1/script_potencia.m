
tol = 1e-5;
maxiter = 100;

matriz = load("matrices/harvard500");
G = matriz.G ;
[n,m] =  size(G);

P = ObtenerMatrizDeTransicion(G) ;
%P = ObtenerMatrizSinDump(G);
tic
[potencia_vector, potencia_valor, potencia_errores, potencia_iter] = Potencia(P, maxiter, tol);
toc

plot (potencia_vector);

