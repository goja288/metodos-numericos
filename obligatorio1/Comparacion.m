function Comparacion()

	addpath("matrices");
	load("matrices/harvard500.mat");
	HARV = G;
	load("matrices/wb-cs-stanford.mat");
	STANFORD = Problem.A; 
	X = createMatrix(50);

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

	disp("PAGERANKPOW X: ");
	[autoVector,iter] = pagerankpow(X);
	[probabilidad indice] = max(autoVector);
	fprintf(1,'Probabilidad: %g Indice= %d Iteracion= %d \n\n\n',probabilidad,indice,iter);


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

	disp("PAGERANKPOW HARVARD: ");
	[autoVector,iter] = pagerankpow(HARV);
	[probabilidad indice] = max(autoVector);
	fprintf(1,'Probabilidad: %g Indice= %d Iteracion= %d \n\n\n',probabilidad,indice,iter);


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

	disp("PAGERANKPOW HARVARD: ");
	[autoVector,iter] = pagerankpow(STANFORD);
	[probabilidad indice] = max(autoVector);
	fprintf(1,'Probabilidad: %g Indice= %d Iteracion= %d \n\n\n',probabilidad,indice,iter);


	

	#plot(erroresPotencias,";errores Potencias;");
	#plot(erroresSistema,";errores Sistemas;");
endfunction

function [A] = createMatrix(dim)
#crear matriz esparsa de dim*dim
	A = sparse(dim,dim);
	maxnel = min(16,dim);
	for i = 1:dim
		nel = floor(rand(1)*maxnel);
		if(nel == 0)
			val = 0;
		else
			val = 1/nel;
		end
		for j = 1:nel
			col_ind = ceil(rand(1)*dim);
			while(A(col_ind,i) ~= 0)
				col_ind = ceil(rand(1)*dim);
			end
			A(col_ind,i) = val;
		end
	end
endfunction
