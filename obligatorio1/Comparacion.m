function Comparacion()

	addpath("matrices");
	load("matrices/harvard500.mat");
	HARV = G;
	load("matrices/wb-cs-stanford.mat");
	STANFORD = Problem.A; 
	X = [0 0 1 0; 1 0 1 0; 0 0 0 1; 1 0 1 0];

	disp("POTENCIA vs ARNOLDI\n");
	set(0, 'defaultfigurevisible', 'off');

	maxIteraciones = 20;
	tolerancia = 10^-20;
	alpha = 0.85;


	disp("POTENCIA X: ");
	[autoVector,autoValor,errores,iter] = Potencia2(X, maxIteraciones,alpha,tolerancia);
	[probabilidad indice] = max(autoVector);
	fprintf(1,'Probabilidad: %g Indice= %d Iteracion= %d \n',probabilidad,indice,iter);
	plot(errores,";Error vs Iteracion X;");
	print('ErrorVsIteracionPotencia-X','-dpng');

	disp("ARNOLDI X: ");
	[autoVector,autoValor,errores,iter] = Sistema(X, maxIteraciones,alpha,tolerancia);
	[probabilidad indice] = max(autoVector);
	fprintf(1,'Probabilidad: %g Indice= %d Iteracion= %d \n',probabilidad,indice,iter);
	plot(errores,";Error vs Iteracion X;");
	print('ErrorVsIteracionArnoldi-X','-dpng');


	disp("POTENCIA HARVARD: ");
	[autoVector,autoValor,errores,iter] = Potencia2(HARV, maxIteraciones,alpha,tolerancia);
	[probabilidad indice] = max(autoVector);
	fprintf(1,'Probabilidad: %g Indice= %d Iteracion= %d \n',probabilidad,indice,iter);
	plot(errores,";Error vs Iteracion POTENCIA;");
	print('ErrorVsIteracionPotencia-Harvard','-dpng');

	disp("ARNOLDI HARVARD: ");
	[autoVector,autoValor,errores,iter] = Sistema(HARV, maxIteraciones,alpha,tolerancia);
	[probabilidad indice] = max(autoVector);
	fprintf(1,'Probabilidad: %g Indice= %d Iteracion= %d \n',probabilidad,indice,iter);
	plot(errores,";Error vs Iteracion ARNOLDI;");
	print('ErrorVsIteracionArnoldi-Harvard','-dpng');


	disp("POTENCIA STANFORD: ");
	[autoVector,autoValor,errores,iter] = Potencia2(STANFORD, maxIteraciones,alpha,tolerancia);
	[probabilidad indice] = max(autoVector);
	fprintf(1,'Probabilidad: %g Indice= %d Iteracion= %d \n',probabilidad,indice,iter);
	plot(errores,";Error vs Iteracion POTENCIA;");
	print('ErrorVsIteracionPotencia-Stanford','-dpng');

	disp("ARNOLDI STANFORD: ");
	[autoVector,autoValor,errores,iter] = Sistema(STANFORD, maxIteraciones,alpha,tolerancia);
	[probabilidad indice] = max(autoVector);
	fprintf(1,'Probabilidad: %g Indice= %d Iteracion= %d \n',probabilidad,indice,iter);
	plot(errores,";Error vs Iteracion ARNOLDI;");
	print('ErrorVsIteracionArnoldi-Stanford','-dpng');


	

	#plot(erroresPotencias,";errores Potencias;");
	#plot(erroresSistema,";errores Sistemas;");
endfunction


